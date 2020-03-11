---
# Copyright Samantha Kiel, 2020

# Released under the LGPL, version 3. A copy of the LGPL can be found at
# http://www.gnu.org/licenses/lgpl.html

# Standard information
title: 
author: Samantha Kiel
date: \today
variant: markdown+footnotes
output: pdf

# My memo class specific settings
to: 
linespacing: 1

# These don't appear to be working, will need to look into that.
template: mdMemo.tex
pdf-engine: xelatex

# Bibliography
bibliography: sources.bib
biblio-title: References
csl: apa.csl

# Font Options

fontsize: 11pt
mainfont: Alegreya
mainfontoptions:
-	Extension=.ttf
-	UprightFont=*-Regular
-	BoldFont=*-Medium
-	ItalicFont=*-Italic
-	BoldItalicFont=*-MediumItalic

sansfont: AnonymousPro
sansfontoptions:
- 	Extension=.ttf
- 	UprightFont=*-Regular
- 	BoldFont=*-Bold
- 	ItalicFont=*-Italic
- 	BoldItalicFont=*-BoldItalic
---