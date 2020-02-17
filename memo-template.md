---
# Copyright Samantha Kiel, 2020

# Released under the LGPL, version 3. A copy of the LGPL can be found at
# http://www.gnu.org/licenses/lgpl.html

# Standard information
title:			
author: 		Samantha Kiel
date:			
variant:		markdown+footnotes
output:			pdf

# My memo class specific settings
to:				
spacing:		1

# These don't appear to be working, will need to look into that.
template:		mdMemo.tex
pdf-engine:		lualatex

# Bibliography
bibliography:	sources.bib
bibstyle:		biblatex-chicago
biblio-title:	References
biboptions:
-	isbn=false
-	backend=biber
-	notes


#Roman Font Options
mainfont: 		Alegreya
mainfontoptions:
-	Extension=.ttf
-	UprightFont=*-Regular
-	BoldFont=*-Medium
-	ItalicFont=*-Italic
-	BoldItalicFont=*-MediumItalic

# Sans Font Options
sansfont: 		AnonymousPro
sansfontoptions:
- 	Extension=.ttf
- 	UprightFont=*-Regular
- 	BoldFont=*-Bold
- 	ItalicFont=*-Italic
- 	BoldItalicFont=*-BoldItalic
---