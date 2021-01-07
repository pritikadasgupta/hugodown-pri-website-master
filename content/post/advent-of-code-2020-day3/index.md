---
output: hugodown::md_document
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Advent of Code 2020 Day 3 in Python"
subtitle: ""
summary: "Working through [Advent of Code](https://adventofcode.com) 2020!"
authors: []
tags: ["python", "code"]
categories: ["python"]
date: 2020-12-03
lastmod: 2020-12-03
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

Toboggan

[My github repository](https://github.com/pritikadasgupta/adventofcode) contains my solutions to Advent of Code 2019-2020!

Day 3: [Toboggan Trajectory](https://adventofcode.com/2020/day/3)
-----------------------------------------------------------

[My day 3 data](https://pritikadasgupta.github.io/post/advent-of-code-2020/data/Day3/input)

```python
#!/bin/python3

import os

def tobaggan(ar,right,down):
	#start at top-left corner
	idx=0
	trees=0
	for x in range(0,len(ar),down):
		if(ar[x][idx]=='.'):
			trees=trees+0
		elif(ar[x][idx]=='#'):
			trees=trees+1
		idx = (idx+right)%len(ar[x])
	return trees


with open(os.environ['INPUT_PATH']) as ar_count: 
	ar = [x for x in ar_count.read().split()]

#part 1
print("Part 1: ",tobaggan(ar,3,1))


#part 2
print("Part 2: ",tobaggan(ar,1,1)*tobaggan(ar,3,1)*tobaggan(ar,5,1)*tobaggan(ar,7,1)*tobaggan(ar,1,2))
```




----


