\NeedsTeXFormat{LaTeX2e} % https://www.latex-project.org/help/documentation/usrguide.pdf
% \ProvidesClass{umd-thesis}
\newcommand{\classname}{umd-thesis}
\ProvidesClass{\classname}
\providecommand{\baseclass}{report}
\LoadClass[twoside]{\baseclass}

\RequirePackage[letterpaper, margin=1in]{geometry}
\RequirePackage[raggedright]{titlesec}
\RequirePackage{etoolbox}
\RequirePackage{longtable} % Multi-page tables like list of abbrevs
\RequirePackage{tocloft}
\RequirePackage{fancyhdr}

\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage[
labelsep=period,
format=plain,
labelfont={bf},
textfont={small},
margin=10pt,
]{caption}

\newbool{nolistspace}
\newbool{listtoc}
% \booltrue{listtoc}
% \newbool{toctoc}
% \newbool{parskip}
% \newbool{hyperrefsupport}
% \booltrue{hyperrefsupport}
% \newbool{headsepline}
% \newbool{consistentlayout}

% \DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
% \DeclareOption{nolistspacing}{\booltrue{nolistspace}}
\DeclareOption{liststotoc}{\booltrue{listtoc}}
% \DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
% \DeclareOption{toctotoc}{\booltrue{toctoc}}
% \DeclareOption{parskip}{\booltrue{parskip}}
% \DeclareOption{headsepline}{\booltrue{headsepline}}
% \DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

\ProcessOptions\relax

\tocloftpagestyle{plain}
\setlength{\cftbeforetoctitleskip}{0em}
\setlength{\cftbeforepartskip}{3em}
\setlength{\cftbeforechapskip}{0.3em}
\cftpagenumbersoff{part}
% \renewcommand{\cftsecleader}{\bfseries\cftdotfill{\cftdotsep}}


% \NeedsTeXFormat{LaTeX2e}[1996/12/01]
% \newcommand{\classname}{umd-thesis}
% \ProvidesClass{\classname}[2017/08/27 v1.6 LaTeXTemplates.com]
% \providecommand{\baseclass}{report}
% \RequirePackage{etoolbox}
% \RequirePackage{xparse}
% \newbool{nolistspace}
% \newbool{chapteroneline}
% \newbool{listtoc}
% \newbool{toctoc}
% \newbool{parskip}
% \newbool{hyperrefsupport}
% \booltrue{hyperrefsupport}
% \newbool{headsepline}
% \newbool{consistentlayout}

% \DeclareOption{nohyperref}{\boolfalse{hyperrefsupport}}
% \DeclareOption{nolistspacing}{\booltrue{nolistspace}}
% \DeclareOption{liststotoc}{\booltrue{listtoc}}
% \DeclareOption{chapterinoneline}{\booltrue{chapteroneline}}
% \DeclareOption{toctotoc}{\booltrue{toctoc}}
% \DeclareOption{parskip}{\booltrue{parskip}}
% \DeclareOption{headsepline}{\booltrue{headsepline}}
% \DeclareOption{consistentlayout}{\booltrue{consistentlayout}}
% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}

% \ProcessOptions\relax

% \LoadClass{\baseclass}



% Addchap provides unnumbered chapters with an entry in the table of contents as well
% as an updated header
\ProvideDocumentCommand{\addchap}{ s o m }{%
	\chapter*{#3}%
	\markboth{}{}%
	\IfBooleanTF{#1}{%
	}{%
		\IfNoValueTF{#2}{%
			\addchaptertocentry{#3}%
			\markboth{\MakeUppercase{#3}}{\MakeUppercase{#3}}%
		}{%
			\addchaptertocentry{#2}%
			\markboth{\MakeUppercase{#2}}{\MakeUppercase{#2}}%
		}%
	}%
}%

\ProvideDocumentCommand{\addchaptertocentry}{ m }{%
	\addcontentsline{toc}{chapter}{#1}%
}

% \patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
% % \patchcmd{\tableofcontents}{\MakeUppercase}{\MakeMarkcase}{}{}
% % \patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
% % \patchcmd{\listoffigures}{\MakeUppercase}{\MakeMarkcase}{}{}
% % \patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
% % \patchcmd{\listoftables}{\MakeUppercase}{\MakeMarkcase}{}{}
% \RequirePackage{chngcntr}
% \counterwithout{section}{chapter}
% \counterwithout{figure}{chapter}
% \counterwithout{table}{chapter}
% \counterwithout{equation}{chapter}

\titleformat{\chapter}[display]{% Format
  \normalfont\huge\bfseries
}{% Label
  \chaptername\ \thechapter
}{5pt} % Vertical sep between label and title body
{\Huge\raggedright} % Before code

\titlespacing*{\chapter}
{0pt}
{0pt}{20pt}

\pagestyle{fancy}
% \renewcommand{\headrulewidth}{0pt}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\renewcommand{\chaptermark}[1]{%
\markboth{\chaptername\ \thechapter.\ #1}{}}
\fancyhead[LE, RO]{\thepage}
\fancyhead[LO]{\textit{\nouppercase{\rightmark}}}
\fancyhead[RE]{\textit{\nouppercase{\leftmark}}}
\fancyfoot[C]{}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[RO,LE]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}%
}

%% Make sure cleardoublepage / empty pages does not have header
%% See "those blank pages" page 26 in fancyhdr manual
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\begingroup
\mbox{}
\vspace*{\fill}
\begin{center}
This page intentionally left blank.
\end{center}
\vspace{\fill}
\thispagestyle{empty}
\newpage
\if@twocolumn\mbox{}\newpage\fi
\endgroup\fi\fi}

\renewcommand*\contentsname{TABLE OF CONTENTS}

% \def\degreedocumenttype#1{\def\@ThesisOrDissertation{#1}}
% \def\degreetitle#1{\def@\DegreeTitle{#1}}

\let\@DegreeDocType\relax
\def\DegreeDocType#1{\def\@DegreeDocType{#1}}

\let\@DegreeTitle\relax
\def\DegreeTitle#1{\def\@DegreeTitle{#1}}

\let\@DegreeYear\relax
\def\DegreeYear#1{\def\@DegreeYear{#1}}

\let\@committee\relax
\def\committee#1{\def\@committee{#1}}

\newcommand{\runningtitle}{\@DegreeDocType}

\newcommand{\degreestatement}{
  \begin{center}
    \@DegreeDocType\ submitted to the Faculty of the Graduate School of the\\
    University of Maryland, College Park in partial fulfillment\\
    of the requirements of \@DegreeTitle\\
    \@DegreeYear
  \end{center}
}

\renewenvironment{abstract}{%
  \pagenumbering{gobble}
  \thispagestyle{empty}   
  \section*{Abstract}%
}{%
  \clearpage
}

\newcommand{\maketitlepage}{
  \thispagestyle{empty}
  \pagenumbering{gobble}

  \vspace*{\stretch{1}}
  {
    \parindent0pt
    \begin{center}
    \MakeUppercase\@title\\
    by\\
    \@author\\
    \end{center}

    \vspace*{\stretch{1}}
    \degreestatement%

    \vspace*{\stretch{2}}

    Committee:\\
    \@committee
  }
  \vspace*{\stretch{1}}
  \clearpage
}

\newcommand{\makecopyrightpage}
{
  \pagenumbering{gobble}
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{centering}
    \rough{COPYRIGHT STATEMENT}

    \@author\\
    \@DegreeYear\\
  \end{centering}
  \vspace*{\fill}
  \clearpage
}

\newcommand{\frontmatter}{
  \pagenumbering{roman}
  \setcounter{page}{2}
}
\newcommand{\mainmatter}{
  \pagenumbering{arabic}
}

% Chapters

%----------------------------------------------------------------------------------------
%	ABBREVIATIONS PAGE DESIGN
%----------------------------------------------------------------------------------------
% \newbool{listtoc}
\newcommand{\abbrevname}{List of Abbreviations}
% \providecaptionname{english,british,american}{\abbrevname}{List of Abbreviations}
\NewDocumentEnvironment{abbreviations}{ m }{%
	\ifbool{nolistspace}{\begingroup\singlespacing}{}
	\ifbool{listtoc}{\addchap{\abbrevname}}{\addchap*{\abbrevname}}
	\begin{longtable}{#1}
	}{%
	\end{longtable}
	\addtocounter{table}{-1}% Don't count this table as one of the document tables
	\ifbool{nolistspace}{\endgroup}{}
  \cleardoublepage
}