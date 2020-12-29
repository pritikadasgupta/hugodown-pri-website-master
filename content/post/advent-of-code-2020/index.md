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
k = int(input("What do you want your sum to be? ")) 
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

#### Part 1: 

<p>
<a id='day3'></a>
</p>

Day 3: [Toboggan Trajectory](https://adventofcode.com/2020/day/3)
-----------------------------------------------------------

[My day 3 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day3/input)

#### Part 1: 


<p>
<a id='day4'></a>
</p>

Day 4: [Passport Processing](https://adventofcode.com/2020/day/4)
-----------------------------------------------------------

[My day 4 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day4/input)

[My day 4 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day4/exercise4.testinput.txt)


#### Part 1: 

<p>
<a id='day5'></a>
</p>

Day 5: [Binary Boarding](https://adventofcode.com/2020/day/4)
-----------------------------------------------------------

[My day 5 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day4/input)



#### Part 1: 





----

This post will be updated as I code/work through the rest of the challenges.

