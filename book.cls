\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{book}

% Load memoir
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\LoadClass[oneside,11pt]{memoir}

% \RequirePackage{etoolbox}

\usepackage{fancyhdr}

% Page geometry
\RequirePackage[letterpaper,top=1in,bottom=1in,left=1.5in,right=1.5in,headsep=\dimexpr 0.25in-1em,marginparwidth=1.25in]{geometry}

% Page style
\fancypagestyle{bottomcenter}{%
	\fancyhf{} % clear all header and footer fields
	\fancyfoot[C]{\makebox[\textwidth][c]{\thepage}} % set the page number in the center of the footer
}
\pagestyle{bottomcenter}
\aliaspagestyle{chapter}{bottomcenter}

% % Page style
% \makeoddhead{headings}{}{\thepage}{}
% \makeevenhead{headings}{}{\thepage}{}

\RequirePackage{graphicx}
\RequirePackage{titlecaps}

%% Overleaf 24 Jan: Formatting of ToC and lists
\setcounter{tocdepth}{0}
\let\listoffigurestables\listoffigures
\appto{\tableofcontents}{\clearpage}
\appto{\listoffigurestables}{\clearpage}
\appto{\listoffigures}{\clearpage}
\appto{\listoftables}{\clearpage}
\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\listfigurename}{List of Figures}
\renewcommand{\listtablename}{List of Tables}


%\addtocontents{toc}{\protect\vskip 35pt}
%\addtocontents{toc}{\protect\SingleSpacing}
%\addtocontents{lof}{\protect\vskip 35pt}
%% In case single spacing is desired later
% \addtocontents{lof}{\protect\SingleSpacing}
% \addtocontents{lot}{\protect\SingleSpacing}
\addtocontents{lof}{{\protect\itshape Number}\protect\hfill{\protect\itshape Page}\protect\par}
\addtocontents{lot}{{\protect\itshape Number}\protect\hfill{\protect\itshape Page}\protect\par}

\setlength{\cftbeforechapterskip}{0pt}

\renewcommand{\chapternumberline}[1]{\chaptername \space {#1}:\space}
% \appto\appendix{\addtocontents{toc}{\protect\reformchapapp}}
% \newcommand{\reformchapapp}{%
	%   \renewcommand{\chapternumberline}[1]{\appendixname\ ##1: }%
	% }
\patchcmd{\cftchapterleader}{\bfseries}{\normalfont}{}{}
\renewcommand{\cftchapterfont}{\normalfont}
\renewcommand{\cftchapterpagefont}{\normalfont}
\renewcommand{\cftchapterdotsep}{\cftdotsep}
\setlength{\cftsectionnumwidth}{2em}

% Add a command to create an extra chapter with entry.
\newcommand{\extrachapter}[2][\@empty]{%
	\chapter*{#2}%
	\addcontentsline{toc}{chapter}{\ifx#1\@empty{#2}\else{#1}\fi}}

% Merged list of figures and tables -- not needed
% \def\table{\def\figurename{Table}\figure}
% \let\endtable\endfigure

\setlength{\cftbeforefigureskip}{0pt}
\renewcommand{\cftfiguredotsep}{\cftdotsep}
\settowidth\cftfigurenumwidth{\itshape Number}
\renewcommand\cftfigurepresnum{\hfill}
\renewcommand\cftfigureaftersnum{\hskip1em}

\setlength{\cftbeforetableskip}{0pt}
\renewcommand{\cfttabledotsep}{\cftdotsep}
\settowidth\cfttablenumwidth{\itshape Number}
\renewcommand\cfttablepresnum{\hfill}
\renewcommand\cfttableaftersnum{\hskip1em}

\apptocmd{\appendix}{%
	\addtocontents{toc}{%
		\protect\renewcommand{\protect\chaptername}{Appendix}
	}%
}{}{}

\RequirePackage{letterspace} % not so heavy...

% Chapter headings
% \renewcommand{\insertchapterspace}{}
% \setlength{\midchapskip}{\onelineskip}
% \setlength{\afterchapskip}{1.5\onelineskip}
% \renewcommand{\chapternamenum}{\space\space}
% \renewcommand{\chapterheadstart}{\clearforchapter}
% \renewcommand{\chapnamefont}{\SingleSpacing\centering\normalfont\large\itshape\textls[250]}
% \renewcommand{\chapnumfont}{\normalfont\large\itshape}
% \renewcommand{\chaptitlefont}{\SingleSpacing\centering\normalfont\large}
% \renewcommand{\printchaptertitle}[1]{\chaptitlefont #1}

% Section headings
\usepackage{titlesec}
%\titleformat{\section}{\Large\bfseries}{\thepart.\arabic{chapter}.\arabic{section}}{10pt}{\Large}
\titleformat{\section}{\Large\bfseries}{\arabic{chapter}.\arabic{section}}{10pt}{\Large}
\titleformat{\subsection}{\large\bfseries}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}{6pt}{\large}
\titleformat{\subsubsection}{\large\bfseries}{\arabic{chapter}.\arabic{section}.\arabic{subsubsection}}{6pt}{\large}
\titleformat{\chapter}{\normalfont\huge\bfseries}{\arabic{chapter}}{20pt}{\Huge}
%\counterwithin{chapter}{part}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}

\cftsetindents{section}{10pt}{25pt}
\cftsetindents{part}{0pt}{30pt}

\def\titleskip{\vskip 4\bigskipamount}
\def\authorskip{\vskip 2\bigskipamount}

\renewcommand{\maketitle}[1][]{%
	\begin{titlingpage}
		\large
		\OnehalfSpacing
		\let\footnotesize\small \let\footnoterule\relax \setcounter{page}{1}
		\begin{center}
			\phantom{Fake title}
			\vskip 10\bigskipamount
			{\SingleSpacing\huge\@title\par}
			\vskip 7\bigskipamount
			{\LARGE \@author}\par
			\vskip 7\bigskipamount
			Regensburg, \today
		\end{center}
	\end{titlingpage}
	\pagenumbering{roman}
	\setcounter{page}{2}
}


\newenvironment{noteByAuthor}{\extrachapter[Note by the author]{ }\begin{center}
		\SingleSpacing\centering\normalfont\Huge Note by the author
		\authorskip
\end{center}}
{\clearpage}

\renewenvironment{abstract}{\extrachapter[Abstract]{ }\begin{center}
		\authorskip
		\SingleSpacing\centering\normalfont\Huge Abstract 
		\authorskip
\end{center}}
{\clearpage}

\newenvironment{acknowledgements}{\extrachapter[Acknowledgements]{ }\begin{center}
		\SingleSpacing\centering\normalfont\Huge Acknowledgements
		\authorskip
\end{center}}
{\clearpage}

%Double space text
\linespread{1.15}

\nobibintoc

\endinput
