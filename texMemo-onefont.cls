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
% Font settings using font spec 
\usepackage{fontspec}
% If I have to use Times New Roman
\setmainfont[Ligatures = TeX]{Tex Gyre Termes}

\setmonofont[Ligatures = TeX]{Fira Code}


% Header Formatting
\usepackage{titlesec}

\titleformat*{\section}{\normalsize \bfseries }
\titleformat*{\subsection}{\normalsize \slshape}
\titleformat*{\subsubsection}{\normalsize}
\titleformat*{\paragraph}{\bfseries }
\titleformat*{\subparagraph}{\slshape }

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
		\ifthenelse{\equal{\@memoto}{\relax}}{}{\item [{ TO:}] \tabto{1.5 cm} \@memoto}
		\ifthenelse{\equal{\@memofrom}{\relax}}{}{\item [{ FROM:}] \tabto{24 pt} \@memofrom}
		\ifthenelse{\equal{\@memosubject}{\relax}}{}{\item [{ SUBJECT:}] \tabto{24 pt} \@memosubject}
		\ifthenelse{\equal{\@memodate}{\relax}}{}{\item [{ DATE:}] \tabto{24 pt} \@memodate}
	\end{description} \vspace{-1em}
	\decorativeline
}