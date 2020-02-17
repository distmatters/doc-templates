---
title:	Document Templates
author:	Samantha Kiel
date:	February 16, 2020
---

These files are templates I've put together for writing memos in various
languages including LaTeX and Pandoc Markdown. A description of each file is 
presented below.

## texMemo.cls

This is a version of Rob Oaks' 2010 texMemo.cls[^1] which I have modified to 
work for my own purposes. The major differences are lining up the information in
the title - i.e. the to, from, date, and subject values are aligned - and
modifies the way section headers are displayed. To use this file copy it into 
the folder with LaTeX memo you are writing.

## texMemo-sans.cls

This is the same as texMemo.cls, but this one uses a sans-serif for the body 
font and a serif font for headers. This was intended for memos which were only
going to be displayed on computer screens as it is believed sans-serif fonts are
easier to read on screens. To use this file copy it into the folder with LaTeX
memo you are writing as  'texMemo.cls'

## texMemo-onefont.cls

This is the same as the previous two texMemo cls files, but uses tex-gyre termes
as the sole font. This is for when you are required to write in Times New Roman.
To use this file copy it into the folder with LaTeX memo you are writing as 
'texMemo.cls'


## mdMemo.latex

This is a template file for pandoc markdown for the creation of a similarly 
styled memo as texMemo.cls. This started out as a modification of Rob Oaks' 2010
texMemo.cls but has grown as I have grown more comfortable with both LaTex and 
writing a pandoc template

## makefile

This provides a basic makefile for building both markdown files and latex files.
Using this file requires pandoc, latexmk, and make to be installed on your 
computer in order to run correctly. 

## memo-template.\{tex,md\}

These two files provide a skeleton for creating your own memos in LaTeX

[^1]: Rob Oaks' website appears to have been shutdown. There are some places 
were texMemo.cls has been reposted but it is no longer possible to give direct
creadit to Rob Oaks himself.