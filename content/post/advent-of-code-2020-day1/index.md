---
output: hugodown::md_document
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Advent of Code 2020 Day 1"
subtitle: ""
summary: "Working through [Advent of Code](https://adventofcode.com) 2020!"
authors: []
tags: ["python", "code"]
categories: ["python"]
date: 2020-12-01
lastmod: 2020-12-01
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

----

I've completed all 25 challenges of Advent of Code. However, I am slow to put up my thought process throughout the whole thing. This blog will be updated as I code/work/blog through the rest of the challenges.

