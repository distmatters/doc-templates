% This document class provides a simple memo for LaTeX users.
% It is based on article.cls and inherits most of the functionality
% that class.
% 
% Author: Rob Oakes, Copyright 2010.  Released under the LGPL, version 3.
% A copy of the LGPL can be found at http://www.gnu.org/licenses/lgpl.html
% 
% This version has been further modifed by S. Kiel, whose contributions are
% likewise released under the LGPL, version 3.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texMemo}[2010/07/31 - Simple Memo Class, Including Logo]

\usepackage{graphicx}

% Load the Base Class
\LoadClassWithOptions{article}

% Begin Requirements
\RequirePackage{ifthen}
\usepackage{tabto}
\usepackage{enumitem}

% Set font settings
\usepackage{fontspec}
\setmainfont{Zilla Slab Medium}[
			Ligatures		=	TeX,
			ItalicFont		=	ZillaSlab-MediumItalic,
			BoldFont		=	ZillaSlab-Bold,
			BoldItalicFont	=	ZillaSlab-BoldItalic]

% Set Sans font
% Set Sans font
\setsansfont{Alegreya Sans}[
			Ligatures 		= 	TeX,
			ItalicFont		=	AlegreyaSans-Italic,
			BoldFont		=	AlegreyaSans-Bold,
			BoldItalicFont	=	AlegreyaSans-BoldItalic]

\setmonofont[Ligatures = TeX]{Space Mono}


% Change font to Sans Serif
\renewcommand{\familydefault}{\sfdefault}

% Header Formatting
\usepackage{titlesec}

\titleformat*{\section}{\normalsize \bfseries \rmfamily}
\titleformat*{\subsection}{\normalsize \slshape \rmfamily}
\titleformat*{\subsubsection}{\normalsize \rmfamily}
\titleformat*{\paragraph}{\bfseries \rmfamily}
\titleformat*{\subparagraph}{\slshape \rmfamily}

% Header Spacing
\titlespacing\section{0pt}{16pt plus 6pt minus 4pt}{4pt plus 2pt minus 2pt}
\titlespacing\subsection{0pt}{12pt plus 4pt minus 2pt}{4pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{12pt plus 4pt minus 2pt}{4pt plus 2pt minus 2pt}

% Specialized memo Commands (To, From, Subject, Logo, Letterhead Address)

\def\@memoto{\relax}
\newcommand{\memoto}[1]{\gdef\@memoto{#1}}

\def\@memofrom{\relax}
\newcommand{\memofrom}[1]{\gdef\@memofrom{#1}}

\def\@memosubject{\relax}
\newcommand{\memosubject}[1]{\gdef\@memosubject{#1}}

\def\@memodate{\relax}
\newcommand{\memodate}[1]{\gdef\@memodate{#1}}

\def\@memologo{\relax}
\newcommand{\logo}[1]{\gdef\@memologo{\protect #1}}

\def\@letterheadaddress{\relax}
\newcommand{\lhaddress}[1]{\gdef\@letterheadaddress{#1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Create the Letterhead and To/From Block

\renewcommand{\maketitle}{\makememotitle}
\newcommand\makememotitle{
	\ifthenelse{\equal{\@memologo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			\vspace{-0.6in}
			\@memologo
			\vspace{0.5in}
		\par\end{flushright}%
	\end{minipage}
	}
	% To, From, Subject Block
	\begin{description}[noitemsep]
		\ifthenelse{\equal{\@memoto}{\relax}}{}{\item [{\rmfamily TO:}] \tabto{36 pt} \@memoto}
		\ifthenelse{\equal{\@memofrom}{\relax}}{}{\item [{\rmfamily FROM:}] \tabto{36 pt} \@memofrom}
		\ifthenelse{\equal{\@memosubject}{\relax}}{}{\item [{\rmfamily SUBJECT:}] \tabto{36 pt} \@memosubject}
		\ifthenelse{\equal{\@memodate}{\relax}}{}{\item [{\rmfamily DATE:}] \tabto{36 pt} \@memodate}
	\end{description} \vspace{-1em}
	\decorativeline
}