#!/usr/bin/Rscript

#clear workspace
rm(list = ls())

library(tidyverse)

#Load Data
#Use this if you're running from the command line:
# mydata <- read.table(file("stdin"), sep = '=', strip.white = TRUE,col.names = c('key', 'value'))


#Use this if you're opening this repo as a R project, using relative paths:
mydata <- read.table('2020/Day14/input_test2.txt', sep = '=', strip.white = TRUE,col.names = c('key', 'value'))

#-------------------------------------------------------------------------
#Clean up data and Functions
#-------------------------------------------------------------------------

convert <- function(x){ #converts to 36 bits
  x_bit32 <- rev(as.character(intToBits(x)))
  x_bit36 <- c(rep(0, 4), as.integer(x_bit32))
  x_new <- paste(x_bit36, collapse = '')
  return(x_new)
}


binary_to_integer <- function(x) {
  x_char <- paste(x)
  x_int <- suppressWarnings(as.integer(strsplit(x_char, '')[[1]]))
  return(sum(x_int * 2^rev(seq_along(x_int) - 1)))
}


mask <- function(mask_, x) {
  mask_ <- suppressWarnings(as.integer(strsplit(mask_, '')[[1]]))
  x <- as.integer(strsplit(x, '')[[1]])
  x[!is.na(mask_)] <- mask_[!is.na(mask_)]
  paste(x, collapse = '')
}

mask_idx <- which(mydata[,1]=="mask")

#create a new variables
mydata$value_masked <- ""
mydata$value_converted <- ""
mydata$value_int <- ""
mydata$mem_value <- ""

not_unique_mem <- vector()
#fill in variables
for(i in 1:length(mask_idx)){
  if(mydata[mask_idx[i],1]=="mask"){
    mymask <- mydata[mask_idx[i],2]
    if(i!=length(mask_idx)){
      end <- (mask_idx[i+1]-1)
    }else{
      end <- nrow(mydata)
    }
    new_idx <- c((mask_idx[i]+1):end)
    for(j in new_idx){
      
      converted_value_x <- suppressWarnings(convert(mydata[j,2]))
      masked_value <- mask(mymask,converted_value_x)
      converted_int <- binary_to_integer(masked_value)
      
      memvalues <- suppressWarnings(as.integer(strsplit(mydata$key[j],"")[[1]]))
      mem_justnumbers <- memvalues[!is.na(memvalues)]
      mydata$mem_value[j] <- as.integer(paste(mem_justnumbers,collapse=""))
      
      mydata$value_masked[j] <- converted_value_x
      mydata$value_converted[j] <- masked_value
      mydata$value_int[j] <- converted_int
    }
  }
}

sorted_mem_values <- sort(as.integer(unique(mydata$mem_value)))
to_sum <- vector(mode = "numeric", length = length(sorted_mem_values))
for(a in 1:nrow(mydata)){
  for(b in 1:length(sorted_mem_values)){
    if(mydata$mem_value[a]==sorted_mem_values[b]){
      to_sum[b] <- mydata$value_int[a]
    }
  }
}

part1 <- paste(sum(as.numeric(to_sum),na.rm=TRUE))
print(part1)
