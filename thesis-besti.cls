%
%  Copyright 2021 jianguo Xie <jgxie2020@sinano.ac.cn>
%
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license or (at your option) any later version.
%
%  This work has the LPPL maintenance status `maintained'.
%
%  The Current Maintainer of this work is Wen Wang <wwzvd@mst.edu>.
%



\ProvidesClass{thesis-besti}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage{ifxetex}
\RequireXeTeX

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6pt]{caption}

\RequirePackage{array}
\RequirePackage{booktabs}
\setlength{\heavyrulewidth}{0.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\arrayrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}

\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{lmodern}
\RequirePackage[nopostdot]{glossaries}
\RequirePackage{mathspec}

\usepackage{afterpage}
\RequirePackage{xeCJK}
\RequirePackage{ifplatform}

\ifwindows
  \setCJKmainfont[AutoFakeBold=true]{SimSun}
  \newCJKfontfamily{\heiti}{SimHei}
  \newfontfamily{\heiti@letter}{SimHei}
  \setallmainfonts{Times New Roman}
\else
\ifmacosx
  \setCJKmainfont[AutoFakeBold=true]{Songti SC}
  \newCJKfontfamily{\heiti}{STHeiti}
  \newfontfamily{\heiti@letter}{STHeiti}
  \setallmainfonts{Times New Roman}
\else
  \setCJKmainfont[AutoFakeBold=true]{fzsong.ttf}
  \newCJKfontfamily{\heiti}{fzhei.ttf}
  \newfontfamily{\heiti@letter}{fzhei.ttf}
  \setallmainfonts[
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf,
  ]{times.ttf}
\fi
\fi

\DeclareMathAlphabet{\mathbf}{\eu@enc}{\eu@mathrm}{\bfdefault}{it}
\DeclareMathAlphabet{\mathbd}{\eu@enc}{\eu@mathrm}{\bfdefault}{n}
\newcommand{\bm}{\mathbf}

\RequirePackage{zhnumber}
\RequirePackage{pifont}

\RequirePackage[hyphens]{xurl}
\RequirePackage[hyperfootnotes=false,
    bookmarksnumbered,
    bookmarksdepth=4
]{hyperref}
\hypersetup{
  colorlinks=true,
  citecolor=black,
  linkcolor=black,
  urlcolor=black
}

\RequirePackage{indentfirst}
\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{appendix}
\RequirePackage{cite}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}

 
\RequirePackage[algochapter, boxruled, linesnumbered]{algorithm2e}

\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage[resetlabels]{multibib}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{everypage}
\RequirePackage{ifoddpage}
\RequirePackage{pdfpages}

\graphicspath{{./pic/}}

\RequirePackage[titles]{tocloft}
\RequirePackage[labelformat=simple]{subfig}
\captionsetup[subfigure]{font=small, belowskip=6pt, width=36pt}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\newcommand{\floatcontinue}{\end{figure}\clearpage\begin{figure}[tb]\ContinuedFloat}

\urlstyle{rm}
\raggedbottom

% \AtBeginDocument{\pretocmd{\ref}{~}{}{}\apptocmd{\ref}{}{}{}}


\RequirePackage[a4paper,
  inner=3cm, outer=3cm, top=3cm, bottom=3cm,
  bindingoffset=0cm]{geometry}

\setlength{\headheight}{15pt}

\pagestyle{fancy}
\linespread{1.391}
\setlength\parindent{24pt}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\captionsetup{format=hang}
\captionsetup{width=\textwidth - 42pt}
\captionsetup[figure]{aboveskip=6pt, belowskip=0pt}
\captionsetup[table]{aboveskip=9pt, belowskip=0pt}

\setlength{\intextsep}{9pt}

\AtBeginEnvironment{figure}{%
  \def\@floatboxreset{\centering}%
}

\AtBeginEnvironment{table}{%
  \def\@floatboxreset{\centering}%
}

\AtBeginEnvironment{tabular}{\small}

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\titleformat{\chapter}[block]
  {\centering\fontsize{15pt}{15pt}\selectfont\strong\thispagestyle{fancy}}{\thechapter}{7.5pt}{}

\titleformat{\section}[block]
  {\fontsize{14pt}{14pt}\selectfont\strong}
  {\thesection}{7pt}{}

\titleformat{\subsection}[block]
  {\fontsize{14pt}{14pt}\selectfont\strong}
  {\thesubsection}{7pt}{}

\titleformat{\subsubsection}[block]
  {\fontsize{12pt}{12pt}\selectfont\strong}
  {\thesubsubsection}{6pt}{}

\RequirePackage[hang, perpage]{footmisc}
\addtolength{\footnotesep}{0pt}
\setlength{\footnotemargin}{13.5pt}

\renewcommand{\footnotesize}{\fontsize{9pt}{10.8pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{11.7}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}

\renewcommand{\footnoterule}{\vfill\noindent\vspace{0.9mm}\hspace{27pt}\rule{5.05cm}{0.02cm}\vspace*{2.6pt}}

\def\@makefntext #1{
  \ifFN@hangfoot
      \bgroup \setbox \@tempboxa \hbox {
          \ifdim
        \footnotemargin >0pt \hb@xt@
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else
              \hbox { \normalfont \@thefnmark}
      \fi
    }
        \leftmargin \wd \@tempboxa
        \rightmargin \z@ \linewidth \columnwidth
          \advance \linewidth -\leftmargin\parshape \@ne
    \leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
    \leavevmode \llap {\box \@tempboxa }\parskip
        \hangfootparskip \relax \parindent
    \hangfootparindent \relax
        \else
          \parindent 1em \noindent
            \ifdim
                \footnotemargin >\z@ \hb@xt@
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
        \ifdim \footnotemargin =\z@
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
          \llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
        \fi
            \fi
    \fi
        \footnotelayout #1\ifFN@hangfoot \par \egroup
  \fi
}

\newcounter{pseudopage}
\setcounter{pseudopage}{0}
\AddEverypageHook{\stepcounter{pseudopage}}

\newcommand\blankpage{%
  \newpage
  \null
  \thispagestyle{empty}%
  \addtocounter{pseudopage}{-1}%
  \newpage
}

\newenvironment{chineseabstract}{
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \pagenumbering{Roman}
  \ifchinesebook{
    \pdfbookmark{中文摘要}{chineseabstract}
  }{
    \pdfbookmark{Chinese Abstract}{chineseabstract}
  }
  \chapter*{\heiti{摘\chinesespace 要}}
  \thispagestyle{fancy}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 摘要}
}{
%  \checkoddpage
%  \ifoddpage
%      \blankpage
%    \else
%      \newpage
%    \fi
}

\newcommand{\chinesekeyword}[1]{
  \vspace{\baselineskip}
  \noindent
  \@hangfrom{\makebox[48pt][l]{\textbf{关键词\chinesecolon}}}#1
}

\newenvironment{englishabstract}{
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \pagenumbering{Roman}
  \ifchinesebook{
    \pdfbookmark{英文摘要}{englishabstract}
  }{
    \pdfbookmark{English Abstract}{englishabstract}
  }
  \chapter*{\bfseries ABSTRACT}
    \thispagestyle{fancy}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont ABSTRACT}
}{
%  \checkoddpage
%  \ifoddpage
%      \blankpage
%    \else
%      \newpage
%    \fi
}

\newcommand{\englishkeyword}[1]{
  \vspace{\baselineskip}
  \noindent
  \@hangfrom{\makebox[2.1cm][l]{\textbf{Keywords:}}}#1
}

\AddEverypageHook{\addtocontents{toc}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lof}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lot}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\tocloftpagestyle{fancy}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.4}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}
\setlength{\cftbeforechapskip}{0pt}

\addtolength{\cftchapnumwidth}{25pt}

\cftsetindents{section}{21pt}{22pt}
\cftsetindents{subsection}{44pt}{31pt}
\cftsetindents{subsubsection}{76pt}{41pt}

\renewcommand{\cfttoctitlefont}{\fontsize{15pt}{15pt}\selectfont\strong}
\renewcommand\cftchapfont{\strong}

\newcommand{\zh@thetitle}{\chinesespace}
\newcommand{\zh@theauthor}{\chinesespace}
\newcommand{\zh@thedate}{\chinesespace}
\newcommand{\zh@theschool}{\chinesespace}
\newcommand{\zh@themajor}{\chinesespace}
\newcommand{\zh@theadvisor}{\chinesespace}

\newcommand{\en@thetitle}{\chinesespace}
\newcommand{\en@theauthor}{\chinesespace}
\newcommand{\en@thedate}{\chinesespace}
\newcommand{\en@theschool}{\chinesespace}
\newcommand{\en@themajor}{\chinesespace}
\newcommand{\en@theadvisor}{\chinesespace}

\newcommand{\thestudentnumber}{\chinesespace}

\renewcommand{\title}[2]{
  \renewcommand{\zh@thetitle}{#1}
  \renewcommand{\en@thetitle}{#2}
}

\renewcommand{\author}[2]{
  \renewcommand{\zh@theauthor}{#1}
  \renewcommand{\en@theauthor}{#2}
}

\renewcommand{\date}[2]{
  \renewcommand{\zh@thedate}{#1}
  \renewcommand{\en@thedate}{#2}
}

\newcommand{\major}[2]{
  \renewcommand{\zh@themajor}{#1}
  \renewcommand{\en@themajor}{#2}
}

\newcommand{\school}[2]{
  \renewcommand{\zh@theschool}{#1}
  \renewcommand{\en@theschool}{#2}
}

\newcommand{\advisor}[2]{
  \renewcommand{\zh@theadvisor}{#1}
  \renewcommand{\en@theadvisor}{#2}
}

\newcommand{\studentnumber}[1]{
  \renewcommand{\thestudentnumber}{#1}
}

\newcommand{\thedateoral}{}
\newcommand{\thedatesubmit}{}
\newcommand{\thedateconfer}{年\chinesespace 月}

\newcommand{\setdate}[2][]{ 
\ifthenelse{\equal{#1}{oral}}{
  \renewcommand{\thedateoral}{#2}
}{}
\ifthenelse{\equal{#1}{submit}}{
  \renewcommand{\thedatesubmit}{#2}
}{}
\ifthenelse{\equal{#1}{confer}}{
  \renewcommand{\thedateconfer}{#2}
}{}
}

\renewcommand{\strong}{\heiti}
\DeclareOption{english} {
  \newcommand{\englishbook}{}
  \renewcommand{\thechapter}{Chapter \arabic{chapter}}
  \addtolength{\cftchapnumwidth}{12pt}
  \renewcommand{\strong}{\bfseries}
}

\newcommand{\ifchinesebook}[2]{
  \ifthenelse{\isundefined{\englishbook}}{#1}{#2}
}

\DeclareOption{bachelor}{
  \def\chinesedegreename{本科}
  \def\englishdegreename{Bachelor}
  \def\chinesebooktitle{学士学位论文}
  \def\englishbooktitle{Bachelor Thesis}
  \def\display@chineseheader{北京电子科技学院学士学位论文}
  \def\display@englishheader{Bachelor Thesis of University of
    Electronic Science and Technology of China}
}

\newcommand{\ifbachelor}[2]{
  \ifthenelse{\equal{\englishdegreename}{Bachelor}}{#1}{#2}
}

\DeclareOption{master}{
  \def\chinesedegreename{硕士}
  \def\englishdegreename{Master}
  \def\chinesebooktitle{硕士学位论文}
  \def\englishbooktitle{Master Thesis}
  \def\display@chineseheader{北京电子科技学院硕士学位论文}
  \def\display@englishheader{Master Thesis of University of
    Electronic Science and Technology of China}
}

\DeclareOption{promaster}{
  \def\chinesedegreename{专业硕士}
  \def\englishdegreename{Professional Master}
  \def\chinesebooktitle{专业学位硕士学位论文}
  \def\englishbooktitle{Master Thesis for Professional Degree}
  \def\display@chineseheader{北京电子科技学院硕士学位论文}
  \def\display@englishheader{Professional Master Thesis of University 
    of Electronic Science and Technology of China}
}

\DeclareOption{doctor}{
  \def\chinesedegreename{博士}
  \def\englishdegreename{Doctor}
  \def\chinesebooktitle{博士学位论文}
  \def\englishbooktitle{Doctoral Dissertation}
  \def\display@chineseheader{北京电子科技学院博士学位论文}
  \def\display@englishheader{Doctoral Dissertation of University of
    Electronic Science and Technology of China}
}

\DeclareOption{engdoctor}{
  \def\chinesedegreename{工程博士}
  \def\englishdegreename{Engineering Doctor}
  \def\chinesebooktitle{工程博士学位论文}
  \def\englishbooktitle{Engineering Doctoral Dissertation}
  \def\display@chineseheader{北京电子科技学院博士学位论文}
  \def\display@englishheader{Engineering Doctoral Dissertation of
    University of Electronic Science and Technology of China}
}

\ExecuteOptions{master}

\ProcessOptions\relax

\ifchinesebook{
  \renewcommand{\contentsname}{目\hspace{6pt}录}
  \renewcommand{\bibname}{参考文献}
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\listfigurename}{插图索引}
  \renewcommand{\listtablename}{表格索引}
}{}

\pretocmd{\listoffigures}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont\listfigurename}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \ifchinesebook{
    \addtolength{\cftfignumwidth}{12pt}
    \renewcommand{\cftfigpresnum}{\figurename}
  }{
    \addtolength{\cftfignumwidth}{32pt}
    \renewcommand{\cftfigpresnum}{\figurename~}
  }
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
}{}{}

\newcommand{\thesisfigurelist}{
	%\newpage
	%\addcontentsline{toc}{chapter}{插图索引}
  \listoffigures
}

\pretocmd{\listoftables}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont\listtablename}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  
  \ifchinesebook{
    \addtolength{\cfttabnumwidth}{12pt}
    \renewcommand{\cfttabpresnum}{\tablename}
  }{
    \addtolength{\cfttabnumwidth}{32pt}
    \renewcommand{\cfttabpresnum}{\tablename~}
  }
  \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
}{}{}

\newcommand{\thesistablelist}{
	%\newpage
	%\addcontentsline{toc}{chapter}{表格索引}
	\listoftables
}


\ifchinesebook{
  \SetAlgorithmName{算法}{算法}{算法列表}
}{
  \SetAlgorithmName{Algorithm}{Algorithm}{List of Algorithms}
}
\renewcommand\thealgocf{\arabic{chapter}-\arabic{algocf}}
\SetAlgoCaptionSeparator{\null}
\AtBeginEnvironment{algorithm}{\vspace{9pt}}
\AfterEndEnvironment{algorithm}{\vspace{9pt}}

\renewcommand*{\glossarypreamble}{\vspace{-9pt}}
\newacronymstyle{acronym-besti}{
  \ifglshaslong{\glslabel}{\glsgenacfmt}{\glsgenentryfmt}
}{
  \renewcommand*{\GenericAcronymFields}{
    first={\the\glslongtok\space\protect\paren{\the\glsshorttok}},
    description={\the\glslongtok}}
  \renewcommand*{\genacrfullformat}[2]{%
    \glsentrydesc{##1}~(\glsentrylong{##1},\space%
    \glsentryshort{##1})%
  }
  \renewcommand*{\acronymentry}[1]{%
    \acronymfont{\glsentryshort{##1}}%
  }
}
\setacronymstyle{acronym-besti}

\newglossarystyle{long-besti}{
  \renewenvironment{theglossary}%
    {\begin{longtable}{lp{.7\textwidth}}}%
    {\end{longtable}}%

  \renewcommand*{\glossaryheader}{}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \ifglshaslong{##1}{\glsentrylong{##1}\ifglshasdesc{##1}{, \glsentrydesc{##1}}{}}
    {\glsentrydesc{##1}} \\
  }
  \renewcommand*{\subglossentry}[3]{
  \glossentry{##2}{##3}}
}

\defglsentryfmt{%
  \ifglshaslong{\glslabel}{%
    \glsgenacfmt%
  }{%
    \ifglsused{\glslabel}{%
      \glsgenentryfmt%
    }{%
      \glsgenentryfmt%
    }%
  }%
}

\newcommand{\thesisglossarylist}{
  \newpage
  
  \fancyhf{}
  \newpage
  \addcontentsline{toc}{chapter}{缩略语对照表}
  \chapter*{缩略语对照表}
  
  \ifchinesebook{
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 缩略语对照表}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
    \setlength\glsdescwidth{.7\textwidth}
    \pdfbookmark{缩略语对照表}{glossary}
    \printglossary[style=long-besti, title={\protect\centering 缩略语对照表}, nonumberlist, nogroupskip]
  }{
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont Glossary}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
    \setlength\glsdescwidth{.7\textwidth}
    \pdfbookmark{Glossary}{glossary}
    \printglossary[style=long-besti, title={\protect\centering Glossary}, nonumberlist, nogroupskip]
  }
  
}

\newcommand{\thesisalphabetlist}{
	\newpage
	\fancyhf{}
	\newpage
	\addcontentsline{toc}{chapter}{符号对照表}
	\chapter*{符号对照表}
	\ifchinesebook{
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 符号对照表}
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
		\setlength\glsdescwidth{.7\textwidth}
		\pdfbookmark{符号对照表}{glossary}
		\printglossary[style=long-besti, title={\protect\centering 符号对照表}, nonumberlist, nogroupskip]
	}{
		\fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont Glossary}
		\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
		\setlength\glsdescwidth{.7\textwidth}
		\pdfbookmark{Glossary}{glossary}
		\printglossary[style=long-besti, title={\protect\centering Symbol}, nonumberlist, nogroupskip]
	}
  

}
% \makeglossaries


\newcommand{\makecover}{
\thispagestyle{empty}
\setlength{\extrarowheight}{9pt}
\ifchinesebook{\pdfbookmark{封面}{cover}}{\pdfbookmark{Cover}{cover}}
\begin{center}
  \ifbachelor{\includegraphics{bachelor_font.pdf} \\}{
    \fontsize{22pt}{22pt}\selectfont 北\hspace{0.5em}京\hspace{0.5em}电\hspace{0.5em}子%
    \hspace{0.5em}科\hspace{0.5em}技\hspace{0.5em}学\hspace{0.5em}院 \\[7bp]}
  \fontsize{12pt}{12pt}\selectfont BEIJING ELECTRONIC SCIENCE AND TECHNOLOGY INSTITUTE  \\[36bp]
  \ifbachelor{\fontsize{42pt}{42pt}\selectfont{\bfseries\chinesebooktitle} \\[24bp]}{
    \fontsize{42pt}{42pt}\selectfont\chinesebooktitle \\[24bp]}
  \fontsize{16pt}{16pt}\selectfont
    \textbf{\MakeUppercase{\englishbooktitle}} \\[48bp]
  \ifbachelor{
    \vspace{0.5cm}
    \includegraphics[width=5cm]{logo.png} \\[66bp]
  }{\includegraphics[width=170bp]{logo.png} \\[48bp]}
  \begin{tabular}{lp{4.6in}}
    \heiti\fontsize{16pt}{16pt}\selectfont 论文题目 & \multirow[t]{2}{4.6in}{
        \centering
          \heiti\fontsize{16pt}{19pt}\selectfont
          \zh@thetitle
    } \\
    \cline{2-2}
            & \\
    \cline{2-2}
  \end{tabular}\hspace*{\fill} \\[\baselineskip]
  \begin{tabular}{>{\heiti\fontsize{16pt}{16pt}\selectfont}l
      >{\centering\arraybackslash\heiti\fontsize{16pt}{16pt}\selectfont}
      p{3.77in}p{15pt}}
    学科专业 & \zh@themajor &\\
    \cline{2-2}
    学\chinesespace\chinesespace 号 & \thestudentnumber & \\
    \cline{2-2}
    作者姓名 & \zh@theauthor &\\
    \cline{2-2}
    指导老师 & \zh@theadvisor &\\
    \cline{2-2}
    提交日期 & \zh@thedate &\\
    \cline{2-2}
  \end{tabular}
\end{center}


\afterpage{\blankpage}

\ifbachelor{}{\thetitlepage}

\afterpage{\blankpage}

\originalitydeclaration
%\newpage
%\setcounter{page}{0}
%\setcounter{pseudopage}{0}
%\setlength{\extrarowheight}{2pt}

}

\newcommand{\thetitlepage}{
  \newpage
  \thispagestyle{empty}

\noindent 学校代码  \uline{\hspace{0.5in}10018\hspace{0.5in}} \hspace{1.5in} \noindent 学\hspace{0.1in}号 \uline{\hspace{0.5in}20199101\hspace{0.5in}} \\
\noindent 分\hspace{0.1in}类\hspace{0.1in}号 \uline{\hspace{0.5in}TN82\hspace{0.5in}} \hspace{1.5in}  \noindent 密\hspace{0.1in}级 \uline{\hspace{0.5in}公开\hspace{0.82in}} \\[12bp]


\begin{center}
  \fontsize{36pt}{36pt}\selectfont{\heiti
    学\chinesespace 位\chinesespace 论\chinesespace 文
  } \\[48bp]

  \fontsize{16pt}{16pt}\selectfont{\heiti\zh@thetitle} \\
  \vspace{-15pt}
  \rule{5.9in}{.4pt} \\[36bp]
  %\fontsize{12pt}{12pt}\selectfont（题名和副题名）\\[36bp]
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
  		>{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
  		p{4.45in}}
  	作者姓名 & {\heiti\zh@theauthor} \\
  	\cline{2-2}

  	% & \fontsize{12pt}{12pt}\selectfont（姓名、职称、单位名称）
  \end{tabular}  \\[36bp]

  %\fontsize{16pt}{16pt}\selectfont{\heiti\zh@theauthor} \\
  %\vspace{-15pt}
  %\rule{1.63in}{.4pt} \\[36bp]
  %\fontsize{12pt}{12pt}\selectfont（作者姓名） \\[36bp]

  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\selectfont}
      p{4.45in}}
      指导老师 & {\heiti\zh@theadvisor} \\
    \cline{2-2}
      & {\heiti 北京电子科技学院\chinesespace 北京} \\
    \cline{2-2}
    % & \fontsize{12pt}{12pt}\selectfont（姓名、职称、单位名称）
  \end{tabular}  \\[36bp]
\end{center}

  \noindent
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\heiti\selectfont}
      p{1.0in}
      >{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\heiti\selectfont}
      p{2.48in}}
      申请学位级别 & \chinesedegreename &
      学科专业 & \zh@themajor \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\heiti\selectfont}
      p{1.0in}
      >{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\heiti\selectfont}
      p{2.0in}}
      提交论文日期 & \thedatesubmit &
      论文答辩日期 & \thedateoral   \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\heiti\selectfont}
      p{4.45in}}
      学位授予单位 & 北京电子科技学院  \\
    \cline{2-2}
    学位授予日期 &  \thedateconfer \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\heiti\selectfont}
      p{4.27in}}
      答辩委员会主席 & \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16pt}\heiti\selectfont}
      p{4.93in}}
      评阅人 & \\
    \cline{2-2}
  \end{tabular}

%\vspace{0.54in}
%\noindent
%\hspace{12pt}注1：注明《国际十进分类法UDC》的类号。

\afterpage{\blankpage}
\newpage
\thispagestyle{empty}\null
\par{\vspace{2.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{18pt}{20pt}\selectfont
  \bfseries\centering\en@thetitle
\end{minipage}
\par{\vspace{5.3cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
  \fontsize{15pt}{17pt}\selectfont
  \centering\noindent
  \textbf{A \englishbooktitle{} Submitted to} \\
  \textbf{Beijing Electronic Science and Technology Institute} \\
  in partial fulfillment of the requirements\\
  for the degree of Master \\
  in \textbf{Cyberspace security}
  
\end{minipage}
\par{\vspace{9.2cm}}
\noindent
\begin{minipage}[t][1.52cm][t]{\textwidth}
	\fontsize{15pt}{17pt}\selectfont
	\centering\noindent
	By \\
	\en@theauthor \\
	Supervisor: \en@theadvisor \\
	\en@thedate \\
	
	
\end{minipage}
%\begin{tabular}{>{\bfseries\fontsize{16pt}{16pt}\selectfont}r
%  >{\centering\arraybackslash\bfseries\fontsize{16pt}{16pt}\selectfont}
%  p{10.6cm}}
%  Discipline: & \multirow[t]{2}{*}{\en@themajor} \\
%\cline{2-2}
%& \\
%\cline{2-2}
%Author: & \en@theauthor \\
%\cline{2-2}
%Supervisor: & \en@theadvisor \\
%\cline{2-2}
%School: & \en@theschool \\
%\cline{2-2}
%\end{tabular}
}

\newcommand{\bindpdfcover}[1]{
  \ifchinesebook{\pdfbookmark{封面}{cover}}{\pdfbookmark{Cover}{cover}}
  \includepdf[pages=-]{#1}
  \newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
}

\newcommand{\originalitydeclaration}{
\newpage
\thispagestyle{empty}
\begin{spacing}{2.142}
  \ifchinesebook{\pdfbookmark{独创性声明}{originalitydeclaration}}
    {\pdfbookmark{Originality Declaration}{originalitydeclaration}}
  \noindent\begin{center}
  \fontsize{18pt}{20pt}\selectfont\heiti 独创性声明
  \end{center}
    \par{\fontsize{12pt}{14pt}\selectfont\noindent\null\hspace{20pt}%
    秉承学校严谨的学风和优良的科学道德，本人声明所呈交的论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢中所罗列的内容以外，论文中不包含其他人已经发表或撰写过的研究成果；也不包含为获得北京电子科技学院或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中做了明确的说明并表示了谢意。
    申请学位论文与资料若有不实之处，本人承担一切的法律责任。
}
  \\[12pt]
  \fontsize{12pt}{14pt}\selectfont\noindent\null\hspace{20pt}作者签名：\uline{\hspace{4.1cm}}\hspace{42pt}%
  日期：\chinesespace\chinesespace 年\hspace{21pt}月\hspace{21pt}日 \\
  \noindent\begin{center}
    \fontsize{18pt}{20pt}\selectfont\heiti 论文使用授权
  \end{center}
  \par{\fontsize{12pt}{14pt}\selectfont\noindent\null\hspace{20pt}%
    本人完全了解北京电子科技学院有关保留和使用学位论文的规定，即：研究生在校攻读学位期间论文工作的知识产权单位属北京电子科技学院。学校有权保留送交论文的复印件，允许查阅和借阅论文；学校可以公布论文的全部或部分内容，可以允许采用影印、缩印或其它复制手段保存论文。同时本人保证，毕业后结合学位论文研究课题再撰写的文章一律署名单位为北京电子科技学院。}
  \par{\fontsize{12pt}{14pt}\selectfont\noindent\null\hspace{20pt}
  \chineseleftparenthesis%
  保密的学位论文在解密后应遵守此规定%
  \chineserightparenthesis} \\
  \fontsize{12pt}{14pt}\selectfont\noindent\null\hspace{20pt}本学位论文属于保密，在\hspace{35pt}年解密后适用本授权书。\\[12pt]
  \fontsize{12pt}{14pt}\selectfont\noindent\null\hspace{20pt}作者签名：\uline{\hspace{4.1cm}}\hspace{12pt}%
  导师签名：\uline{\hspace{4.1cm}} \\
  \fontsize{12pt}{14pt}\selectfont\noindent\null\hspace{20pt}日期：\chinesespace\chinesespace 年\hspace{21pt}月\hspace{21pt}日 \hspace{46pt} 日期：\chinesespace\chinesespace 年\hspace{21pt}月\hspace{21pt}日
\end{spacing}
\newpage\setcounter{page}{0}\setcounter{pseudopage}{0}
}

\setlength{\extrarowheight}{2pt}

\newcommand{\standardhead}{
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[CE]{\fontsize{10.5pt}{12.6pt}\selectfont\display@chineseheader}
    \fancyhead[CO]{\fontsize{10.5pt}{12.6pt}\selectfont\leftmark}
  }{
    \fancyhead[CE]{\fontsize{10.5pt}{12.6pt}\selectfont\nouppercase\display@englishheader}
    \fancyhead[CO]{\fontsize{10.5pt}{12.6pt}\selectfont\nouppercase\leftmark}
  }
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\thepage}
}

\pretocmd{\tableofcontents}{
  \fancyhf{}
  \ifchinesebook{
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 目录}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
    \pdfbookmark{目录}{toc}
  }{
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont Contents}
    \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
    \pdfbookmark{Contents}{toc}
  }
}{}{}


\newcommand{\thesistableofcontents}{
	\newpage
  \tableofcontents
 
}

\renewcommand{\chaptermark}[1]{\markboth{\thechapter \hspace{5.25pt}#1}{}}

\newcommand{\thesisacknowledgement}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \setcounter{section}{0}
  \ifchinesebook{
    \chapter*{致\hspace{12pt}谢}
    \addcontentsline{toc}{chapter}{致\hspace{12pt}谢}
    \markboth{致谢}{致谢}
  }{
    \chapter*{Acknowledgements}
    \addcontentsline{toc}{chapter}{Acknowledgements}
    \markboth{Acknowledgements}{Acknowledgements}
  }
  \thispagestyle{fancy}
}

\newcommand{\thesisintroduction}{
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
	\setcounter{section}{0}
	\ifchinesebook{
		\chapter*{作者简介}
		\addcontentsline{toc}{chapter}{作者简介}
		\markboth{作者简介}{作者简介}
	}{
		\chapter*{Self Introduction}
		\addcontentsline{toc}{chapter}{Self Introduction}
		\markboth{Self Introduction}{Self Introduction}
	}
\renewcommand{\thesection}{\arabic{section}}
	\thispagestyle{fancy}
}

\newcommand{\thesischapterexordium}{
  \checkoddpage
  \ifoddpage
      \blankpage
    \else
      \newpage
  \fi
    \newpage
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \standardhead
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \ifchinesebook{
    \chapter{绪\hspace{6pt}论}
    \chaptermark{绪论}
  }{
    \chapter{Introduction}
    \chaptermark{Introduction}
  }
}

%\renewcommand*{\l@chapter}{\@dottedtocline{1}{1.5em}{2.3em}}

\newcommand{\thesisappendix}{
  \newpage
  \appendix
  \interlinepenalty=0
  \ifchinesebook{}{\addtocontents{toc}{\protect\addtolength{\cftchapnumwidth}{12pt}}}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \titleformat{\chapter}[block]
    {\centering\fontsize{15pt}{15pt}\selectfont\strong\thispagestyle{fancy}}{\thechapter}{7.5pt}{}
  \ifchinesebook{
    \renewcommand{\thechapter}{附录\Alph{chapter}}
    \renewcommand{\appendixname}{附录}
  }{
    \renewcommand{\thechapter}{Appendix \Alph{chapter}}
    \renewcommand{\appendixname}{Appendix}
  }

  \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
  \renewcommand{\theequation}{\alph{chapter}-\arabic{equation}}
  \renewcommand{\thetable}{\alph{chapter}-\arabic{table}}
  \renewcommand{\thefigure}{\alph{chapter}-\arabic{figure}}
  \renewcommand{\thetheorem}{\alph{chapter}.\arabic{theorem}}
  \renewcommand{\theaxiom}{\alph{chapter}.\arabic{axiom}}
  \renewcommand{\thecorollary}{\alph{chapter}.\arabic{corollary}}
  \renewcommand{\thelemma}{\alph{chapter}.\arabic{lemma}}
  \renewcommand{\thedefinition}{\alph{chapter}.\arabic{definition}}
  \renewcommand{\theexample}{\alph{chapter}.\arabic{example}}
}

\newcommand{\thesissingleappendix}{
  \newpage
  \appendix
  \interlinepenalty=0
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \titleformat{\chapter}[block]
    {\centering\fontsize{15pt}{15pt}\selectfont\strong\thispagestyle{fancy}}{附\hspace{12pt}录}{7.5pt}{}
  %\renewcommand{\thechapter}{附\hspace{12pt}录}
  \ifchinesebook{
    \renewcommand{\appendixname}{附录}
  }{
    \renewcommand{\appendixname}{Appendix}
  }
  
  \renewcommand{\thesection}{A.\arabic{section}}
  
  \renewcommand{\theequation}{a-\arabic{equation}}
  \renewcommand{\thetable}{a-\arabic{table}}
  \renewcommand{\thefigure}{a-\arabic{figure}}
  \renewcommand{\thetheorem}{a.\arabic{theorem}}
  \renewcommand{\theaxiom}{a.\arabic{axiom}}
  \renewcommand{\thecorollary}{a.\arabic{corollary}}
  \renewcommand{\thelemma}{a.\arabic{lemma}}
  \renewcommand{\thedefinition}{a.\arabic{definition}}
  \renewcommand{\theexample}{a.\arabic{example}}
  
  \ifchinesebook{
    \chapter*{附\hspace{12pt}录}
    \addcontentsline{toc}{chapter}{附录}
    \markboth{附录}{附录}
  }{
    \chapter*{Appendix}
    \addcontentsline{toc}{chapter}{Appendix}
    \markboth{Appendix}{Appendix}
  }
}






\ifchinesebook{
  \newcommand{\thesisaccomplishtitle}{攻读\chinesedegreename{}学位期间取得的成果}
  \newcommand{\thesisbibname}{参考文献}
}{
  \newcommand{\thesisaccomplishtitle}{Research Results Obtained During the Study for \englishdegreename{} Degree}
  \newcommand{\thesisbibname}{References}
}

\renewcommand{\bibname}{\thesisbibname}
\renewcommand{\@biblabel}[1]{[#1]\hfill}

\newenvironment{thesisthebibliography}{
  \begin{thebibliography}{lo}
    \interlinepenalty=10000
    \begin{spacing}{1.667}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}
  \end{thebibliography}
}

\pretocmd{\bibliography}{
  \thispagestyle{fancy}
  \interlinepenalty=10000
  \begin{spacing}{1.667}
}{}{}

\apptocmd{\bibliography}{
  \end{spacing}
}{}{}

\newcommand{\bstlabelmark}{lo}
\newcommand{\thesisloadbibliography}[2][]{
  \ifthenelse{
    \equal{#1}{large}
  }{
    \setlength{\labelsep}{3pt}
    \renewcommand{\bstlabelmark}{loo}
    \bibliographystyle{thesis-besti}
    \bibliography{#2}
    \setlength{\labelsep}{6pt}
  }{
    \bibliographystyle{thesis-besti}
    \bibliography{#2}
  }
}

\newcommand{\thesisbibliography}{\thesisloadbibliography}

\newcites{accomplish}{\thesisaccomplishtitle}

\newenvironment{thesistheaccomplish}{
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \renewcommand\thesection{\arabic{section}}
  \setcounter{section}{0}
  \nociteaccomplish{*}
  \renewcommand{\bibname}{\thesisaccomplishtitle}
  \begin{thebibliography}{lo}
  \interlinepenalty=10000
  \setlength{\itemsep}{0bp}\setlength{\parskip}{0pt}
  \begin{spacing}{1.667}
  \thispagestyle{fancy}
  \small
}{
  \end{spacing}
  \end{thebibliography}
  \renewcommand{\bibname}{\thesisbibname}
}

\newcommand{\thesisloadaccomplish}[1]{
  \nociteaccomplish{*}
  \renewcommand{\bibname}{\thesisaccomplishtitle}
  \renewcommand{\bstlabelmark}{lo}
  \thispagestyle{fancy}
  \begin{spacing}{1.667}
  \bibliographystyleaccomplish{thesis-besti}
  \bibliographyaccomplish{#1}
  \end{spacing}
  \renewcommand{\bibname}{\thesisbibname}
}

\newcommand{\thesisaccomplish}{\thesisloadaccomplish}

\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\strong}{}{ }{}
\theoremstyle{dotless}
%\renewcommand\@upn{\selectfont\heiti@letter}

\ifchinesebook{
  \newtheorem{theorem}{定理}[chapter]
  \newtheorem{axiom}[theorem]{公理}
  \newtheorem{corollary}[theorem]{推论}
  \newtheorem{lemma}[theorem]{引理}
  \newtheorem{definition}[theorem]{定义}
  \newtheorem{example}[theorem]{例子}
  \newtheorem{proposition}[theorem]{命题}
}{
  \newtheorem{theorem}{Theorem}[chapter]
  \newtheorem{axiom}[theorem]{Axiom}
  \newtheorem{corollary}[theorem]{Corollary}
  \newtheorem{lemma}[theorem]{Lemma}
  \newtheorem{definition}[theorem]{Definition}
  \newtheorem{example}[theorem]{Example}
  \newtheorem{proposition}[theorem]{Proposition}
}


\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\renewcommand{\qedsymbol}{$\blacksquare$}
\ifchinesebook{
  \renewcommand{\proofname}{证明}
}{}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont
  \topsep0pt \partopsep0pt
  \trivlist
  \item[\hskip5\labelsep
    \strong
  #1\@addpunct{:}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}

\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}}
\setlist{noitemsep}
\setlist{nolistsep}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{8pt}
  \setlength{\belowdisplayskip}{8pt}
  \setlength{\belowdisplayshortskip}{8pt}
  \setlength{\abovedisplayshortskip}{8pt}
}

\endinput
