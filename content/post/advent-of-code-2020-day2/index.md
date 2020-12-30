---
output: hugodown::md_document
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Advent of Code 2020 Day 2"
subtitle: ""
summary: "Working through [Advent of Code](https://adventofcode.com) 2020!"
authors: []
tags: ["R", "rstats", "code"]
categories: ["R"]
date: 2020-12-02
lastmod: 2020-12-30
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
rmd_hash: 6f696410d260d961

---

Today's Advent of Code is all about passwords and using R!!

[My github repository](https://github.com/pritikadasgupta/adventofcode) contains my solutions to Advent of Code 2019-2020!


| Challenge                                                                        | Status |
| -------------------------------------------------------------------------------- | :----: |
| <a href="#day2">Day 2: Password Philosophy  |  \*\*  |



Day 2: [Password Philosophy](https://adventofcode.com/2020/day/2)
-----------------------------------------------------------

The problem asks you to go through a list of password policies and passwords, ([my day 2 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day2/input), and then we have to figure out which passwords are valid according to their policies.

## Part 1: 
## Load in Data:
```{r}
#Use this if you're running from the command line:
# df <- read.table(file("stdin"), header = FALSE, sep = " ")

#Use this if you're opening this repo as a R project, using relative paths:
df <- read.table("2020/Day2/input", header = FALSE, sep = " ")
```

My first instinct was to clean up the dataframe I just created.
First, I get min and max: lowest and highest number of times.

```{r}
df1 <- df %>% separate(V1, c("min", "max")) 
```

Then, a given letter must appear for the password to be valid, right? So, I get rid of the ":" for the letter.

```{r}
df2 <- df1 %>% separate(V2, c("letter", NA))
```

Then I created a function to count how many times a character occurs in a string:
```{r}
countLetter <- function(x){
  char <- x[1]
  s <- x[2]
  s2 <- gsub(char,"",s)
  return (nchar(s) - nchar(s2))
}

df2$count <- apply(df2[,3:4], 1, countLetter)
```

----


