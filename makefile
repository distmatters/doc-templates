# Copyright Samantha Kiel, 2020 

# This Source Code Form is subject to the terms of the Mozilla Public License,
# v. 2.0. If a copy of the MPL was not distributed with this file, You can 
# obtain one at  https://mozilla.org/MPL/2.0/ #
MDC=pandoc
TEXC=latexmk

OUT_EXT=.pdf
OUT_DIR=..

# LaTeX Settings
TEXARGS=-pdflua -outdir=$(OUT_DIR)

TEXSOURCES := $(wildcard *.tex)
TEXTARGETS := $(OUT_DIR)/$(TEXSOURCES:.tex=.pdf)


# Markdown Settings
TEMPLATE=mdMemo.latex
ENGINE=lualatex
TO=latex

MDSOURCES := $(wildcard *.md)
MDOUTPUTS := $(MDSOURCES:.md=.tex)
MDTARGETS := $(OUT_DIR)/$(MDSOURCES:.md=.pdf)

MDARGS=--pdf-engine=$(ENGINE) --template=$(TEMPLATE) --biblatex


all: $(MDTARGETS) $(TEXTARGETS)

$(TEXTARGETS): $(TEXSOURCES)
	$(TEXC) $(TEXARGS) $^

$(MDTARGETS): $(MDOUTPUTS)
	$(TEXC) $(TEXARGS) $^

$(MDOUTPUTS): $(MDSOURCES)
	$(MDC) $^ -o  $@ $(MDARGS)


clean:
	$(TEXC) $(TEXARGS) -c
	rm $(MDOUTPUTS) $(OUT_DIR)/*.run.xml $(OUT_DIR)/*.bbl