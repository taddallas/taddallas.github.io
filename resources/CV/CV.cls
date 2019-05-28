% modified from the CV template by https://github.com/afriggeri

\ProvidesClass{CV}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{2B6C14}
\definecolor{orange}{HTML}{C87002}
\definecolor{purple}{HTML}{64457E}
\definecolor{red}{HTML}{D4044F}
\definecolor{blue}{HTML}{1564B2}



\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{blue}
  \colorlet{header}{white}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{blue}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}


%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{libertine}
%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
%\RequirePackage[defaultsans]{droidsans}

\newfontfamily\bodyfont[]{Linux Biolinum O}
\newfontfamily\thinfont[Scale=0.6, Color=blue]{Linux Biolinum O}
\newfontfamily\headingfont[]{Linux Biolinum O}
\newfontfamily\headfont[]{Ubuntu}

\newfontfamily\mefont[Color=green]{Linux Biolinum O}
\newfontfamily\yearfont[Color=blue]{Linux Biolinum O}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Linux Libertine O}

%\setmathfont{XITS Math}





%%%%%%%%%%%%%%
%% FA icons %%
%%%%%%%%%%%%%%
\RequirePackage{fontawesome}

\newcommand{\OA}{
  \color{blue}%
  \faUnlock \ %
}


\newcommand{\OD}{
  \color{purple}%
  \faCode \ %
}




%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}


%\includegraphics[width=2cm]{favicon.png}
 %\begin{wrapfigure}{l}{0.25\textwidth}
 %   \includegraphics[width=0.3\textwidth]{favicon.png}
 %\end{wrapfigure}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2cm] (box) at (current page.north){};
   \node [anchor=center] (name) at (box) {%
      \fontsize{28pt}{56pt}\color{header}%
      {\thinfont #1}{\headfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{16pt}{32pt}\color{black}%
      \headfont #3%
    };
  \end{tikzpicture}

  \vspace{-2\parskip}
}



%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        green\or%
        green\or%
        green\or%
        green\or%
        green\or%
        green\or%
        green\or%
        green\or%
        green\or%
        green\or%
        green\or%
        green\or%
        purple\else%
        headercolor\fi%
    } #1%
  }%
  \stepcounter{colorCounter}%
}


\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}


\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{blue} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{blue} ##1}
  }
  \begin{textblock}{4}(1.25, 4.6)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection
}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
