
%%v1.0
%provides following commands
%
%\RNum{NUM} creates uppercase romasn numeral froma NUM

%\maketitle - creates lab table using following data
%   \authorA{name} - sets first author in table
%   \authorB{name} - sets second autot in table
%   \team{year}{group}{team} - sets those fields in table
%   \carryOutDate{date} - sets experiment carryout date
%   \ftHandInDate{date} - sets experiment first hand in date
%   \correctiDate{date} - sets experiment correction date
%   \sdHandInDate{date} - sets experiment second hand in date

%\NeedsTeXFormat{Latex2e}
\ProvidesClass{fizraport}[Provides AGH physics lab raport class v1.0]

\LoadClass[a4paper,10pt,twoside]{article}


\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[polish]{babel}
\RequirePackage[T1,plmath]{polski}
\selectlanguage{polish}
\brokenpenalty=1000
\clubpenalty=1000
\widowpenalty=1000
\addto\captionspolish{%
  \renewcommand{\figurename}{Rys.}%
  \renewcommand{\tablename}{Tab.}%
}
\RequirePackage{indentfirst}
\RequirePackage[top=1.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}% setting margins
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{float}
\RequirePackage{wrapfig}
\RequirePackage{xcolor}
\RequirePackage{amsmath}

%roman numerals
\newcommand{\RNum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}


%cleanup Prev \maketitle Data
\let\@thanks\@empty
\let\@author\@empty
\let\@title\@empty
\let\title\relax
\let\@date\@empty
\let\date\relax

%auhtor Data
\def\@authorA{\phantom{A}}
\def\@authorB{\phantom{B}}
\def\@year{\RNum{2}}
\def\@group{1}
\def\@team{1}
\newcommand{\authorA}[1]{\global\def\@authorA{#1}}
\newcommand{\authorB}[1]{\global\def\@authorB{#1}}
\newcommand{\team}[3]{
\global\def\@year{\RNum{#1}}
\global\def\@group{#2}
\global\def\@team{#3}
}


%Topic Data
\def\@topicName{\phantom{Wahadło fizyczne}}
\def\@topicNumber{\phantom{1}}
\newcommand{\topic}[2]{
\global\def\@topicName{#1}
\global\def\@topicNumber{#2}
}
%Dates
\def\@carryOutDate{\phantom{data}}
\def\@ftHandInDate{\phantom{data}}
\def\@correctiDate{\phantom{data}}
\def\@sdHandInDate{\phantom{data}}

\newcommand{\carryOutDate}[1]{\global\def\@carryOutDate{#1}}
\newcommand{\ftHandInDate}[1]{\global\def\@ftHandInDate{#1}}
\newcommand{\correctiDate}[1]{\global\def\@correctiDate{#1}}
\newcommand{\sdHandInDate}[1]{\global\def\@sdHandInDate{#1}}



\renewcommand{\maketitle}{
  \begingroup
    \newpage
    \begin{center}
    \bgroup
        \def\arraystretch{1.5}
            \begin{tabular}{|c|c|c|c|c|c|}
                \hline
                EAIiIB & \multicolumn{2}{|c|}{\begin{tabular}{@{}c@{}} \@authorA \\ \@authorB \end{tabular}} & Rok \@year & Grupa \@group & Zespół \@team \\
                \hline
                \multicolumn{3}{|c|}{\begin{tabular}{c}Temat: \\ \@topicName \end{tabular}} & 
                \multicolumn{3}{|c|}{\begin{tabular}{c}Numer ćwiczenia: \\ \@topicNumber \end{tabular}} \\
                \hline
                \begin{tabular}{@{}c@{}}Data wykonania:\\ \@carryOutDate\end{tabular} & \begin{tabular}{@{}c@{}}Data oddania:\\\@ftHandInDate\end{tabular} & 
                \begin{tabular}{c}Zwrot do\\poprawki:\\ \@correctiDate \end{tabular} & \begin{tabular}{c}Data oddania:\\ \@sdHandInDate \end{tabular} &
                \begin{tabular}{c}Data zaliczenia:\\\phantom{data}\end{tabular} & \begin{tabular}{c}Ocena:\\\phantom{ocena}\end{tabular} \\[4ex]
                \hline
            \end{tabular}
    \egroup
    \end{center}
    \begin{center}
    \medskip
    {\sffamily \bfseries \LARGE Ćwiczenie~nr~\@topicNumber:~\@topicName}
    \end{center}
  
  \endgroup
  
  \setcounter{footnote}{1}%cleanup Title
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  %cleanup author Data
  \global\let\@authorA\@empty
  \global\let\@authorB\@empty
  \global\let\authorA\relax
  \global\let\authorB\relax
  
  \global\let\@year\@empty
  \global\let\@group\@empty
  \global\let\@team\@empty
  \global\let\team\relax

  %cleanup Topic Data
  \global\let\@topicName\@empty
  \global\let\@topicNumber\@empty
  \global\let\topic\relax
  %cleanup dates
  \global\let\@carryOutDate\@empty
  \global\let\@ftHandInDate\@empty
  \global\let\@correctiDate\@empty
  \global\let\@sdHandInDate\@empty
  \global\let\carryOutDate\relax
  \global\let\ftHandInDate\relax
  \global\let\correctiDate\relax
  \global\let\sdHandInDate\relax
}




\endinput
