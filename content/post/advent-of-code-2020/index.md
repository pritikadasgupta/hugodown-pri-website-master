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
lastmod: 2020-12-18
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

| Challenge                                                                        | Status |
| -------------------------------------------------------------------------------- | :----: |
| <a href="#day1">Day 01: [Day 1: Report Repair](https://adventofcode.com/2020/day/1)              |  \*\*  |
| <a href="#day2">Day 02: [Day 2: Password Philosophy](https://adventofcode.com/2020/day/2)  |  \*\*  |
| <a href="#day3">Day 03: [Day 3: Toboggan Trajectory](https://adventofcode.com/2020/day/3)    |  \*\*  |
| <a href="#day4">Day 04: [Day 4: Passport Processing](https://adventofcode.com/2020/day/4)    |  \*\*  |
| <a href="#day5">Day 05: [Day 5: Binary Boarding](https://adventofcode.com/2020/day/5)    |  \*\*  |
| <a href="#day6">Day 06: [Day 6: Custom Customs](https://adventofcode.com/2020/day/6)    |  \*\*  |
| <a href="#day7">Day 07: [Day 7: Handy Haversacks](https://adventofcode.com/2020/day/7)    |  \*\*  |
| <a href="#day8">Day 08: [Day 8: Handheld Halting](https://adventofcode.com/2020/day/8)    |  \*\*  |
| <a href="#day9">Day 09: [Day 9: Encoding Error](https://adventofcode.com/2020/day/9)    |  \*\*  |
| <a href="#day10">Day 10: [Day 10: Adapter Array](https://adventofcode.com/2020/day/10)    |  \*\*  |
| <a href="#day11">Day 11: [Day 11: Seating System](https://adventofcode.com/2020/day/11)    |  \*\*  |
| <a href="#day12">Day 12: [Day 12: Rain Risk](https://adventofcode.com/2020/day/12)    |  \*\*  |
| <a href="#day13">Day 13: [Day 13: Shuttle Search](https://adventofcode.com/2020/day/13)    |  \*\*  |
| <a href="#day14">Day 14: [Day 14: Docking Data](https://adventofcode.com/2020/day/14)    |  \*\*  |
| <a href="#day15">Day 15: [Day 15: Rambunctious Recitation](https://adventofcode.com/2020/day/15)    |  \*\*  |
| <a href="#day16">Day 16: [Day 16: Ticket Translation](https://adventofcode.com/2020/day/16)    |  \*\*  |
| <a href="#day17">Day 17: [Day 17: Conway Cubes](https://adventofcode.com/2020/day/17)    |  \*\*  |
| <a href="#day18">Day 18: [Day 18: Operation Order](https://adventofcode.com/2020/day/18)    |  \*\*  |
| <a href="#day19">| Day 19: [Day 19: Monster Messages](https://adventofcode.com/2020/day/19)    |  \*\*  |
| <a href="#day20">| Day 20: [Day 20: Jurassic Jigsaw](https://adventofcode.com/2020/day/20)    |  \*\*  |
| <a href="#day21">| Day 21: [Day 21: Allergen Assessment](https://adventofcode.com/2020/day/21)    |  \*\*  |
| <a href="#day22">| Day 22: [Day 22: Crab Combat](https://adventofcode.com/2020/day/22)    |  \*\*  |
| <a href="#day23">| Day 23: [Day 23: Crab Cupst](https://adventofcode.com/2020/day/23)    |  \*\*  |
| <a href="#day24">| Day 24: [Day 24: Lobby Layout](https://adventofcode.com/2020/day/24)    |  \*\*  |
| <a href="#day25">| Day 25: [Day 25: Combo Breaker](https://adventofcode.com/2020/day/25)    |  \*\*  |

<p>
<a id='day1'></a>
</p>

Day 1: [Report Repair](https://adventofcode.com/2020/day/1)
-----------------------------------------------------------

[My day 1 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/exercise1.input.txt)

#### Part 1: Two numbers

The challenge is to find two numbers from a list that sum to 2020, then to report their product.

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
k = int(input("What do you want your sum to be? ")) #What do you want your sum to be?
result = aParticularSum(ar,k)
print(result)
fptr.write(str(result) + '\n')
fptr.close()
```
#### Part 2: Three numbers
The challenge is to find THREE numbers from a list that sum to 2020, then to report their product.

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
k = int(input("What do you want your sum to be? ")) #What do you want your sum to be?
result = aParticularSum(ar,k)
print(result)
fptr.write(str(result) + '\n')
fptr.close()
```
----

This post will be updated as I code/work through the rest of the challenges.

