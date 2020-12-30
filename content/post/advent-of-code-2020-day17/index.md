---
output: hugodown::md_document
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Advent of Code 2020"
subtitle: ""
summary: "Working through [Advent of Code](https://adventofcode.com) 2020!"
authors: []
tags: ["R", "rstats", "code"]
categories: ["R"]
date: 2020-12-01
lastmod: 2020-12-29
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

[Advent of Code](https://adventofcode.com) is an advent-style coding challenge, where there is a two-part coding/data challenge posted for each day in December until Christmas Day (December 1st to December 25th).

I will be attempting each day using R (mostly), Python (sometimes), and MATLAB (rarely) -- which are my three mainstay languages for data science.

[My github repository](https://github.com/pritikadasgupta/adventofcode) contains my solutions to Advent of Code 2019-2020!

I've been blogging about each challenge and my approaches to each of these; feel free to scroll over and go to each challenge directly on this page:

| Challenge                                                                        | Status |
| -------------------------------------------------------------------------------- | :----: |
| <a href="#day1">Day 1: Report Repair             |  \*\*  |
| <a href="#day2">Day 2: Password Philosophy  |  \*\*  |
| <a href="#day3">Day 3: Toboggan Trajectory    |  \*\*  |
| <a href="#day4">Day 4: Passport Processing   |  \*\*  |
| <a href="#day5">Day 5: Binary Boarding   |  \*\*  |
| <a href="#day6">Day 6: Custom Customs  |  \*\*  |
| <a href="#day7">Day 7: Handy Haversacks   |  \*\*  |
| <a href="#day8">Day 8: Handheld Halting   |  \*\*  |
| <a href="#day9">Day 9: Encoding Error    |  \*\*  |
| <a href="#day10">Day 10: Adapter Array    |  \*\*  |
| <a href="#day11">Day 11: Seating System    |  \*\*  |
| <a href="#day12">Day 12: Rain Risk    |  \*\*  |
| <a href="#day13">Day 13: Shuttle Search    |  \*\*  |
| <a href="#day14">Day 14: Docking Data    |  \*\*  |
| <a href="#day15">Day 15: Rambunctious Recitation    |  \*\*  |
| <a href="#day16">Day 16: Ticket Translation    |  \*\*  |
| <a href="#day17">Day 17: Conway Cubes   |  \*\*  |
| <a href="#day18">Day 18: Operation Order    |  \*\*  |
| <a href="#day19">Day 19: Monster Messages    |  \*\*  |
| <a href="#day20"> Day 20: Jurassic Jigsaw    |  \*\*  |
| <a href="#day21"> Day 21: Allergen Assessment    |  \*\*  |
| <a href="#day22"> Day 22: Crab Combat   |  \*\*  |
| <a href="#day23"> Day 23: Crab Cups   |  \*\*  |
| <a href="#day24"> Day 24: Lobby Layout    |  \*\*  |
| <a href="#day25"> Day 25: Combo Breaker   |  \*\*  |

<p>
<a id='day1'></a>
</p>

Day 1: [Report Repair](https://adventofcode.com/2020/day/1)
-----------------------------------------------------------

[My day 1 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day1/exercise1.input.txt)

## Part 1: Two numbers

The challenge was to find two numbers from a list that sum to 2020, then to report their product.

At first, I wanted to solve this problem any which way, and I didn't really care for time complexity. So my first solution was (incomplete code snippet):

```python
def aParticularSum(ar,k):
	multiple = 0
	for x,xval in enumerate(ar,start=0):
		ar_y = ar[:x] + ar[x+1:]
		for y,yval in enumerate(ar_y,start=0):
			if(xval+yval == k):
				multiple = xval*yval
	return multiple

with open(os.environ['INPUT_PATH']) as ar_count: 
	ar = [int(x) for x in ar_count.read().split()]
k = 2020
result = aParticularSum(ar,k)
```
The above solution was of time complexity: O(n^2), which was not ideal.

```python
def aParticularSum(ar,k):
    multiple = 0
    ar = sorted(ar) # sort the list ar
    minidx = 0 # min index
    maxidx = len(ar) - 1 #max index
    while(minidx < maxidx):
        if(ar[minidx] + ar[maxidx] == k):
            multiple = ar[minidx] * ar[maxidx]
        if(ar[minidx] + ar[maxidx] < k):
            minidx +=1
        else:
            maxidx -=1
    return multiple
```
This one (above) was of O(nlogn) time complexity with a space complexity of O(1).

So how do I come up with a solution that's both efficient in terms of time and space complexity? Two words...

### List Comprehensions

```python
def aParticularSum(ar,k):
    return ({x*(k-x) for x in ar if (k-x) in ar})
```


Thus, my complete code (and by complete, I mean "composable," like my partner says.... so it can be executed by anyone via the Terminal given you've set the input and output paths):

```python
#!/bin/python3

import math
import os
import random
import re
import sys

def aParticularSum(ar,k):
    return ({x*(k-x) for x in ar if (k-x) in ar})


fptr = open(os.environ['OUTPUT_PATH'], 'w')
with open(os.environ['INPUT_PATH']) as ar_count:
    ar = [int(x) for x in ar_count.read().split()]
k = int(input("What do you want your sum to be? ")) 
result = aParticularSum(ar,k)
print(result)
fptr.write(str(result) + '\n')
fptr.close()
```
## Part 2: Three numbers
The challenge was to find THREE numbers from a list that sum to 2020, then to report their product. We can take our previous solution and tweak it a little to add another variable.

```python
#!/bin/python3

import math
import os
import random
import re
import sys

def aParticularSum(ar,k):
    return ({(x*y*(k-x-y)) for x in ar for y in ar if (k-x-y) in ar})

fptr = open(os.environ['OUTPUT_PATH'], 'w')
with open(os.environ['INPUT_PATH']) as ar_count:
    ar = [int(x) for x in ar_count.read().split()]
k = int(input("What do you want your sum to be? ")) 
result = aParticularSum(ar,k)
print(result)
fptr.write(str(result) + '\n')
fptr.close()
```

<p>
<a id='day2'></a>
</p>

Day 2: [Password Philosophy](https://adventofcode.com/2020/day/2)
-----------------------------------------------------------

[My day 2 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day2/input)

## Part 1: 

<p>
<a id='day3'></a>
</p>

Day 3: [Toboggan Trajectory](https://adventofcode.com/2020/day/3)
-----------------------------------------------------------

[My day 3 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day3/input)

## Part 1: 


<p>
<a id='day4'></a>
</p>

Day 4: [Passport Processing](https://adventofcode.com/2020/day/4)
-----------------------------------------------------------

[My day 4 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day4/input)

[My day 4 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day4/exercise4.testinput.txt)


## Part 1: 

<p>
<a id='day5'></a>
</p>

Day 5: [Binary Boarding](https://adventofcode.com/2020/day/5)
-----------------------------------------------------------

[My day 5 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day5/input)



## Part 1: 

<p>
<a id='day6'></a>
</p>

Day 6: [Custom Customs](https://adventofcode.com/2020/day/6)
-----------------------------------------------------------

[My day 6 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day6/input)

[My day 6 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day6/exercise6.testinput.txt)


## Part 1: 

<p>
<a id='day7'></a>
</p>

Day 7: [Handy Haversacks](https://adventofcode.com/2020/day/7)
-----------------------------------------------------------

[My day 7 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day7/input)


## Part 1: 


<p>
<a id='day8'></a>
</p>

Day 8: [Handheld Halting](https://adventofcode.com/2020/day/8)
-----------------------------------------------------------

[My day 8 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day8/input)

[My day 8 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day8/exercise8.testinput.txt)


## Part 1: 

<p>
<a id='day9'></a>
</p>

Day 9: [Encoding Error](https://adventofcode.com/2020/day/9)
-----------------------------------------------------------

[My day 9 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day9/input)

[My day 9 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day9/exercise9.testinput.txt)


## Part 1: 


<p>
<a id='day10'></a>
</p>

Day 10: [Adapter Array](https://adventofcode.com/2020/day/10)
-----------------------------------------------------------

[My day 10 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day10/input)

[My day 10 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day10/exercise10.testinput.txt)


## Part 1:   


<p>
<a id='day11'></a>
</p>

Day 11: [Seating System](https://adventofcode.com/2020/day/11)
-----------------------------------------------------------

[My day 11 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day11/input)

[My day 11 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day11/exercise11.testinput.txt)


## Part 1:   

<p>
<a id='day12'></a>
</p>

Day 12: [Rain Risk](https://adventofcode.com/2020/day/12)
-----------------------------------------------------------

[My day 12 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day12/input)

[My day 12 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day12/exercise12.testinput.txt)


## Part 1:   



<p>
<a id='day13'></a>
</p>

Day 13: [Shuttle Search](https://adventofcode.com/2020/day/13)
-----------------------------------------------------------

[My day 13 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day13/input)

[My day 13 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day13/exercise13.testinput.txt)


## Part 1:   

<p>
<a id='day14'></a>
</p>

Day 14: [Docking Data](https://adventofcode.com/2020/day/14)
-----------------------------------------------------------

[My day 14 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day14/input)

[My day 14 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day14/exercise14.testinput.txt)


## Part 1:   



<p>
<a id='day15'></a>
</p>

Day 15: [Rambunctious Recitation](https://adventofcode.com/2020/day/15)
-----------------------------------------------------------

[My day 15 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day15/input)

[My day 15 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day15/exercise15.testinput.txt)


## Part 1:   



<p>
<a id='day16'></a>
</p>

Day 16: [Ticket Translation](https://adventofcode.com/2020/day/16)
-----------------------------------------------------------

[My day 16 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day16/input)

[My day 16 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day16/exercise16.testinput.txt)


## Part 1:   


<p>
<a id='day17'></a>
</p>

Day 17: [Conway Cubes](https://adventofcode.com/2020/day/17)
-----------------------------------------------------------

[My day 17 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day17/input)

[My day 17 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day17/exercise17.testinput.txt)


## Part 1:   


<p>
<a id='day18'></a>
</p>

Day 18: [Operation Order](https://adventofcode.com/2020/day/18)
-----------------------------------------------------------

[My day 18 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day18/input)

[My day 18 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day18/exercise18.testinput.txt)


## Part 1:   

<p>
<a id='day19'></a>
</p>

Day 19: [Monster Messages](https://adventofcode.com/2020/day/19)
-----------------------------------------------------------

[My day 19 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day19/input)

[My day 19 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day19/exercise19.testinput.txt)


## Part 1:   

<p>
<a id='day20'></a>
</p>

Day 20: [Jurassic Jigsaw](https://adventofcode.com/2020/day/20)
-----------------------------------------------------------

[My day 20 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day20/input)

[My day 20 test data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day20/exercise20.testinput.txt)


## Part 1:   


<p>
<a id='day21'></a>
</p>

Day 21: [Handheld Halting](https://adventofcode.com/2121/day/21)
-----------------------------------------------------------

[My day 21 data](https://pritikadasgupta.github.io/post/advent-of-code-2121/data/Day21/input)

[My day 21 test data](https://pritikadasgupta.github.io/post/advent-of-code-2121/data/Day21/exercise21.testinput.txt)


## Part 1:   



<p>
<a id='day22'></a>
</p>

Day 22: [Handheld Halting](https://adventofcode.com/2222/day/22)
-----------------------------------------------------------

[My day 22 data](https://pritikadasgupta.github.io/post/advent-of-code-2222/data/Day22/input)

[My day 22 test data](https://pritikadasgupta.github.io/post/advent-of-code-2222/data/Day22/exercise22.testinput.txt)


## Part 1:   


<p>
<a id='day23'></a>
</p>

Day 23: [Handheld Halting](https://adventofcode.com/2323/day/23)
-----------------------------------------------------------

[My day 23 data](https://pritikadasgupta.github.io/post/advent-of-code-2323/data/Day23/input)

[My day 23 test data](https://pritikadasgupta.github.io/post/advent-of-code-2323/data/Day23/exercise23.testinput.txt)


## Part 1:   



<p>
<a id='day24'></a>
</p>

Day 24: [Handheld Halting](https://adventofcode.com/2424/day/24)
-----------------------------------------------------------

[My day 24 data](https://pritikadasgupta.github.io/post/advent-of-code-2424/data/Day24/input)

[My day 24 test data](https://pritikadasgupta.github.io/post/advent-of-code-2424/data/Day24/exercise24.testinput.txt)


## Part 1:   


<p>
<a id='day25'></a>
</p>

Day 25: [Handheld Halting](https://adventofcode.com/2525/day/25)
-----------------------------------------------------------

[My day 25 data](https://pritikadasgupta.github.io/post/advent-of-code-2525/data/Day25/input)

[My day 25 test data](https://pritikadasgupta.github.io/post/advent-of-code-2525/data/Day25/exercise25.testinput.txt)


## Part 1:   



----

I've completed all 25 challenges of Advent of Code. However, I am slow to put up my thought process throughout the whole thing. This post will be updated as I code/work/blog through the rest of the challenges.

