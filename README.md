A paired down LaTeX template 
---

**Please fork and submit PRs if you use this and fix any issues.**

Based on https://terpconnect.umd.edu/~dbrosius/LatexThesisTemplate.
The template is not meant to be pretty, it just attempts to fulfill UMD's not so pretty formatting requirements.

# Build

I build with `tectonic` and it works fine. A `latexmk` or `pdflatex` `Makefile` would be welcome in a PR.

# Old vs New
- `new-template/`: I rewrote and simplified a class template that should be easier to work on and customize for your own needs. The `.cls` is only 130 lines and has basic commands for generating front matter and title pages. Please use this and up
- `old-template/`: The template I (Jason Fan 2023) used for my thesis accepted for electronic submission. The `thesis.cls` file here is very old and stale, and has many unused commands / options. Based on [https://ireap.umd.edu/resources/thesis-templates]