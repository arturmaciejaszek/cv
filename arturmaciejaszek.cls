%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Based on CV by Adrien Friggeri (adrien@friggeri.net)
% https://github.com/afriggeri/CV

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{arturmaciejaszek}
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%%%%%% COLORS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{light}{HTML}{f7f7f7}
\definecolor{main}{HTML}{2A5BC4}
\definecolor{secondary}{HTML}{0f2a63}
\definecolor{text}{HTML}{252525}
\definecolor{footer}{HTML}{333333}


\ifdefined\@cv@print
  \colorlet{fillheader}{white}
  \colorlet{header}{main}
\else
  \colorlet{fillheader}{main}
  \colorlet{header}{light}
\fi
\colorlet{textcolor}{text}
\colorlet{headercolor}{main}

%%%%%%%%%%%%%%%%%%%%%%%%% FONT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\newfontfamily\bodyfont[]{Tahoma}
\newfontfamily\thinfont[]{Tahoma}
\newfontfamily\headingfont[]{Tahoma Bold}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{Tahoma}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HEADER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\header}[3]{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, left color=main, right color=secondary, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {
      \fontsize{40pt}{72pt}\color{header}
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {
      \fontsize{14pt}{24pt}\color{header}
      \thinfont #3
    };
  \end{tikzpicture}
  \vspace{-2\parskip}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FOOTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\footer}[2]{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=footer, anchor=south, minimum width=\paperwidth, minimum height=1cm] (box) at (current page.south){};
    \node [anchor=center, text width=18cm] (disclaimer) at (box) {
      \color{light}\fontsize{6pt}{1pt}\thinfont #1
    };
  \end{tikzpicture}
  \vspace{-2\parskip}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SECTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{soul}
\setul{10pt}{.4pt}

\renewcommand{\section}[1]{
  \vspace{15pt}
  {%
    \LARGE\color{main}\headingfont\ul{#1}%
  }
  \vspace{15pt}
}

% \setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{
  \end{tabular*}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ITEMS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\edu}[4]{%
  \footnotesize#1&\parbox[t]{11cm}{%
    \large\textbf{#2}
    \hfill
    {\footnotesize\addfontfeature{Color=gray} #3}\par%
    \vspace{5pt}
    #4\\
  }\\}

\newcommand{\work}[4]{%
  \footnotesize#1&\parbox[t]{11cm}{%
    \large\textbf{#2}
    \hfill
    {\footnotesize\addfontfeature{Color=gray} #3}%
    \small#4\vspace{5pt}%
  }\\\\}

\newcommand{\skilllist}[2]{
  #1&\parbox[t]{13cm}{
  #2
  }
}

\newcommand{\skill}[2]{%
\vspace{5pt}
\parbox[c][1.5cm][c]{2.2cm}{%
  \centering\vspace{6pt}\large\textbf{#1}\\
  \vspace{10pt}
  \centering\large{#2}\\
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CONTACT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HEADER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=4.5cm,right=1.5cm,bottom=0.5cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
