---
output: hugodown::md_document
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Advent of Code 2020 Day 2 with Python"
subtitle: ""
summary: "Working through [Advent of Code](https://adventofcode.com) 2020!"
authors: []
tags: ["python", "code"]
categories: ["python"]
date: 2020-12-02
lastmod: 2020-12-02
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

I redid Day 2's challenge in python.

[My github repository](https://github.com/pritikadasgupta/adventofcode) contains my solutions to Advent of Code 2019-2020!


Day 2: [Password Philosophy](https://adventofcode.com/2020/day/2)
-----------------------------------------------------------

The problem asks you to go through a list of password policies and passwords, [my day 2 data](https://pritikadasgupta.github.io/post/advent-of-code-2020-day2-python/data/Day2/input), and then we have to figure out which passwords are valid according to their policies.

## Part 1 & 2: Valid Passwords


```python
#!/bin/python3

import sys
import os

def aPolicy(min_,max_,letter,password): # Part 1
	return(int(min_) <= password.count(letter) <= int(max_))

def aPolicyAgain(min_,max_,letter,password): # Part 2
	rule1 = password[int(min_)-1] == letter
	rule2 = password[int(max_)-1] == letter
	return(rule1 ^ rule2)

fptr = open(os.environ['OUTPUT_PATH'], 'w')
with open(os.environ['INPUT_PATH']) as file:
    data = [line.replace('-',' ').replace(':',' ').strip().split() for line in file]
print(sum(aPolicy(*line) for line in data))
fptr.write(str(sum(aPolicy(*line) for line in data)) + '\n')
print(sum(aPolicyAgain(*line) for line in data))
fptr.write(str(sum(aPolicyAgain(*line) for line in data)) + '\n')
fptr.close()
```


----


