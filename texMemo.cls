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

% Font Settings
\usepackage{fontspec}
% Set Roman Font
% \setmainfont{Ubuntu Mono}[
% 			Ligatures		= TeX,
% 			ItalicFont		= UbuntuMono-RI,
% 			BoldFont		= UbuntuMono-B,
% 			BoldItalicFont	= UbuntuMono-BI]

% Set Sans font
\setsansfont{Alegreya Sans SC}[
			Ligatures 		= 	TeX,
			ItalicFont		=	AlegreyaSansSC-Italic,
			BoldFont		=	AlegreyaSansSC-ExtraBold,
			BoldItalicFont	=	AlegreyaSansSC-ExtraBoldItalic]

\setmonofont[Ligatures = TeX]{Fira Code}

% Header Formatting
\usepackage{titlesec}

\titleformat*{\section}{\normalsize \bfseries \sffamily}
\titleformat*{\subsection}{\normalsize \slshape \sffamily}
\titleformat*{\subsubsection}{\normalsize \sffamily}
\titleformat*{\paragraph}{\sffamily}
\titleformat*{\subparagraph}{\slshape \sffamily}

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
		\ifthenelse{\equal{\@memoto}{\relax}}{}{\item [{\sffamily TO:}] \tabto{24 pt} \@memoto}
		\ifthenelse{\equal{\@memofrom}{\relax}}{}{\item [{\sffamily FROM:}] \tabto{24 pt} \@memofrom}
		\ifthenelse{\equal{\@memosubject}{\relax}}{}{\item [{\sffamily SUBJECT:}] \tabto{24 pt} \@memosubject}
		\ifthenelse{\equal{\@memodate}{\relax}}{}{\item [{\sffamily DATE:}] \tabto{24 pt} \@memodate}
	\end{description} \vspace{-1em}
	\decorativeline
}