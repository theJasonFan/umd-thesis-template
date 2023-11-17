\NeedsTeXFormat{LaTeX2e} % https://www.latex-project.org/help/documentation/usrguide.pdf
\newcommand{\classname}{thesis}
\ProvidesClass{\classname}[2023/11/23 UMD PhD Dissertation Class]

% `report' class has \chapter{...}, `article' does not
\providecommand{\baseclass}{report}
\LoadClass[twoside, 12pt]{\baseclass} % twoside option for book, set to 12pt font
\RequirePackage[letterpaper, margin=1in]{geometry}
\RequirePackage{tocloft} 


\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand\@advisor{}
\newcommand\@department{}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand\@committee{}
\newcommand{\committee}[1]{\def\@committee{#1}}

% Abstract page
\renewenvironment{abstract}
{ % Before
  \pagenumbering{gobble}
  \thispagestyle{empty}
  \hbox{\ } \vspace{.7in}
  \renewcommand{\baselinestretch}{1}
  \normalsize

  \begin{center}
    {\Large ABSTRACT}\\
    \vspace{2em}
    \noindent\begin{minipage}[t]{0.3\textwidth}
      Title of Dissertatation:
    \end{minipage}
    \begin{minipage}[t]{0.6\textwidth}
      \MakeUppercase \@title\\
      \@author\\
      Doctor of Philosophy, \the\year\\
    \end{minipage}
    \vspace{1em}
    \noindent\begin{minipage}[t]{0.3\textwidth}
      Dissertation directed by:
    \end{minipage}
    \begin{minipage}[t]{0.6\textwidth}
      \@advisor\\
      \@department\\
    \end{minipage}

  \end{center}

  \renewcommand{\baselinestretch}{2}
  \normalsize
}{ % After
  \clearpage
  \renewcommand{\baselinestretch}{1}
  \normalsize
}

% Titlepage
\newcommand{\maketitlepage}{
  \begin{center}
    ~\vfill
    {\Large \MakeUppercase \@title}\\
    \vspace{2em}
    by\\
    \vspace{2em}
    \@author\\
    \vspace{4em}
    Dissertation submitted to the Faculty of the Graduate School of the \\
    University of Maryland, College Park in partial fulfillment \\
    of the requirements for the degree of \\
    Doctor of Philosophy \\
    \the\year
  \end{center}
  \vspace{7.5em}
  \noindent Advisory Committee:
  \@committee
  \vfill
  \clearpage
}

\newcommand{\makecopyrightpage}{
  ~\vfill
  \begin{center}
    \large{\copyright~Copyright by\\
    \@author
    \\
    \the\year}
  \end{center}
  \vfill
  \clearpage
}

\renewcommand{\contentsname}{Table of Contents}

\newcommand{\maketoc}{
  \phantomsection %create the correct anchor for the bookmark
  \addcontentsline{toc}{chapter}{Table of Contents}
      \renewcommand{\contentsname}{Table of Contents}
  \renewcommand{\baselinestretch}{1}
  \normalsize
  \tableofcontents %(required, lower-case Roman)
  \clearpage
}

\newcommand{\frontmatter}{
  % Pages from this point start at lower-case Roman number ii)
  \pagestyle{plain}
  \pagenumbering{roman}
  \setcounter{page}{2}
  \renewcommand{\baselinestretch}{2}
  \normalsize
}
\newcommand{\frontsection}[1]{
  \addcontentsline{toc}{chapter}{#1}
  \begin{center}
    \Large #1
  \end{center}
}

\newcommand{\mainmatter}{
  % Pages from this point start at lower-case Roman number ii)
  \pagestyle{plain}
  \pagenumbering{arabic}
  \setcounter{page}{2}
  \renewcommand{\baselinestretch}{2}
  \normalsize
}

