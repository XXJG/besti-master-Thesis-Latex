\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{BESTIthesis}[2022/01/01 BESTI, Thesis document class, version 0.1.0]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   class and packages

%%%%%%%%%%%%%%%%%%%%
%% Options
%%%%%%%%%%%%%%%%%%%%

%% disable oneside option
\DeclareOption{oneside}{\OptionNotUsed}


%% print version or electronic version
\newif\ifBESTI@Option@PrintVersion \BESTI@Option@PrintVersiontrue
\DeclareOption{pversion}{\BESTI@Option@PrintVersiontrue}
\DeclareOption{eversion}{\BESTI@Option@PrintVersionfalse}

%% info
\newif\ifBESTI@Option@info \BESTI@Option@infotrue
\DeclareOption{noinfo}{\BESTI@Option@infofalse}

%% ref
\newif\ifBESTI@Option@ref@sort \BESTI@Option@ref@sortfalse
\newif\ifBESTI@Option@ref@compress \BESTI@Option@ref@compressfalse
\DeclareOption{refsort}{\BESTI@Option@ref@sorttrue}
\DeclareOption{refcompress}
  {\BESTI@Option@ref@sorttrue\BESTI@Option@ref@compresstrue}

%% others
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%
%% load class and packages
%%%%%%%%%%%%%%%%%%%%

%% book
%%
%\LoadClass[zihao=-4,UTF8,twoside,set=windows]{ctexbook}
\LoadClass[zihao=-4,UTF8,twoside,fontset=none]{ctexbook}
\RequirePackage[a4paper]{geometry}

%% calc
\RequirePackage{calc}

%% ifthen
\RequirePackage{ifthen}
\RequirePackage[algochapter, boxruled, linesnumbered]{algorithm2e}


\SetAlgorithmName{算法}{算法}{算法列表}



%\AtBeginEnvironment{algorithm}{\vspace{9pt}}
%\AfterEndEnvironment{algorithm}{\vspace{9pt}}

\RequirePackage[titles]{tocloft}

\RequirePackage{caption}

\RequirePackage{diagbox}

%% natbib
\ifBESTI@Option@ref@sort
  \ifBESTI@Option@ref@compress
    \RequirePackage[numbers,sort&compress,super,square]{natbib}
  \else
    \RequirePackage[numbers,sort,super,square]{natbib}
  \fi
\fi
\newcommand*{\citens}[2][]{%
  \begingroup
  \let\NAT@mbox=\mbox
  \let\@cite\NAT@citenum
  \let\NAT@space\NAT@spacechar
  \let\NAT@super@kern\relax
  \renewcommand\NAT@open{[}%
  \renewcommand\NAT@close{]}%
  \cite[#1]{#2}%
  \endgroup
}


%% hyperref
\RequirePackage[pdfencoding=auto]{hyperref}

%% color
\ifBESTI@Option@PrintVersion\relax\else
  \RequirePackage{color}
\fi

%% config file
\AtEndOfPackage{\makeatletter\input{BESTIthesis.def}\makeatother}
\AtEndOfPackage{\makeatletter\input{BESTIthesis.cfg}\makeatother}
\AtEndOfPackage{\makeatletter\renewcommand{\numberline}[1]{%
\settowidth\@tempdimb{#1\hspace{0.25em}}%
\ifdim\@tempdima<\@tempdimb%
  \@tempdima=\@tempdimb%
\fi
\hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}\makeatother}
\AtEndOfPackage{\makeatletter\@addtoreset{equation}{chapter}\makeatother}
\AtEndOfPackage{\makeatletter \renewcommand{\figurename}{图} \renewcommand{\tablename}{表}
 \def\@caption#1[#2]#3{%
   \\
   \addcontentsline{\csname ext@#1\endcsname}{#1}%
                   {\protect\numberline{\csname #1name\endcsname\hskip0.5em\csname the#1\endcsname}%
                   {\ignorespaces #2}}%
   \begingroup
   \@parboxrestore
   \if@minipage
   \@setminipage
   \fi
   \normalsize
   \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\\
   \endgroup}
 \renewcommand*\l@figure{\@dottedtocline{1}{0em}{4em}}
 \let\l@table\l@figure \makeatother}
 


%%%%%%%%%%%%%%%%%%%%
%% setup packages
%%%%%%%%%%%%%%%%%%%%
%% setup
\ifBESTI@Option@PrintVersion
  \hypersetup{
    CJKbookmarks,
    bookmarksnumbered,
    plainpages    = false,
    pdfstartview  = FitH
  }
\else
  \definecolor{BESTI@hypercolor@darkgreen}{rgb}{0.1,0.5,0.1}
  \hypersetup{
    CJKbookmarks,
    bookmarksnumbered,
    colorlinks,
    linkcolor     = black,
    anchorcolor   = black,
    citecolor     = black,
    urlcolor      = black,
    plainpages    = false,
    pdfstartview  = FitH
  }
\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   utilities

\DeclareRobustCommand{\BESTI@toc@add}[1]
  {\phantomsection\addcontentsline{toc}{chapter}{#1}}

%% underline
\def\CJKunderlinecolor{}
\def\BESTI@@underline[#1]#2{\CJKunderline {\hbox to #1{\hfill{#2}\hfill}}}
\DeclareRobustCommand{\BESTI@underline}
  {\@ifnextchar[\BESTI@@underline\CJKunderline }

\DeclareRobustCommand*{\BESTI@bold}{\bfseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    font
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{mathrsfs}
\RequirePackage{calrsfs}
\@ifpackageloaded{fontspec}{
    \PassOptionsToPackage{no-math}{fontspec}
}{
    \RequirePackage[no-math]{fontspec}
}
\setmainfont{Times New Roman}
\RequirePackage{mathspec}
\setmathsfont{Times New Roman}
%\usepackage{xeCJK}
% 设置文档正文字体为宋体
%\setCJKmainfont[BoldFont=SimHei]{SimSun}
%\setCJKmonofont{SimSun}     % 设置缺省中文字体
%\setCJKfamilyfont{song}[AutoFakeBold=1]{SimSun}                             %宋体 song  
\setCJKfamilyfont{song}[AutoFakeBold=true]{SimSun}                             %宋体 song  
\newcommand{\song}{\CJKfamily{song}}
%\setCJKfamilyfont{hei}{SimHei}                              %黑体  hei 
%\setCJKfamilyfont{hei}[AutoFakeBold=1]{SimHei}                              %黑体  hei  
\setCJKfamilyfont{hei}[AutoFakeBold=true]{SimHei}                              %黑体  hei  
\newcommand{\hei}{\CJKfamily{hei}}

\newCJKfontfamily{\kaishu}{KaiTi}
  
%% family
\DeclareRobustCommand*{\BESTI@font@st}{\song}
\DeclareRobustCommand*{\BESTI@font@ht}{\hei}

%% size
\DeclareRobustCommand*{\BESTI@font@zihao}[1]{\zihao{#1}\setlength{\baselineskip}{20pt}}

\renewcommand*{\baselinestretch}{1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    document setting

%% 参考网址：https://en.wikibooks.org/wiki/LaTeX/Page_Layout
%% page ql head
\setlength{\textwidth}{\paperwidth-5.5cm}% 2.5+2.5+0.5
\setlength{\textheight}{\paperheight-3cm-3cm}%
\setlength\marginparwidth{0cm}%
\setlength\marginparsep{0cm}%
\setlength{\oddsidemargin}{3cm-1in-\hoffset}% hoffset 正文的水平偏移
\setlength{\evensidemargin}{2.5cm-1in-\hoffset}%
%\setlength{\headheight}{31pt}%
%\setlength{\headheight}{10.5pt}%
\setlength{\headheight}{31pt}%
%\setlength{\headsep}{0pt}%
%\setlength{\headsep}{1cm-10.5pt}%
%\setlength{\headsep}{25.5pt}%
\setlength{\headsep}{1cm-\headheight}%
\setlength{\topmargin}{3cm-1in-\voffset-\headheight-\headsep}% voffset 正文的垂直偏移
\setlength{\footskip}{3cm-1.75cm}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    head and foot

\RequirePackage{fancyhdr}
%% remove header from empty page

%\setlength{\headwidth}{\textwidth-4pt-4pt}%
%% label of even page header
\def\BESTI@hdr@thesistitle
  {\BESTI@label@university\BESTI@value@degreemark\BESTI@value@thesis}

%% the double line under header
\renewcommand{\headrulewidth}{0.5pt}
\newcommand{\makeheadrule}{%
\makebox[0pt][l]{\rule[9pt]{\headwidth}{0.5pt}}%
\rule[8pt]{\headwidth}{0.5pt}}
\renewcommand{\headrule}{%
{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\makeheadrule}}
%\renewcommand{\headrule}{%
%    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
%    %\vskip 1pt% 
%    \hrule\@height\headrulewidth\@width\headwidth
%    \hrule\@height\headrulewidth\@width\headwidth
%    \vskip-1\headrulewidth
%    %\vskip-1pt
%    }
%}

%% set header
\fancypagestyle{plain}{
    \pagestyle{fancy}
}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[CE]{{\BESTI@font@st\BESTI@font@zihao{5}\BESTI@hdr@thesistitle}}
\fancyhead[CO]{{\BESTI@font@st\BESTI@font@zihao{5}\nouppercase\leftmark}}
\fancyfoot[C]{{\BESTI@font@st\BESTI@font@zihao{-5}\thepage}}
%% par skip
%\parskip 0pt plus 6pt minus 0pt

%% section level
\setcounter{secnumdepth}{4}

%% chapter
\ctexset { chapter = { 
                        name={\BESTI@chapter@prenumber,\BESTI@chapter@afternumber }, 
                        number={\chinese {chapter}}, 
                        format={\centering \BESTI@font@ht \BESTI@font@zihao {3}}, 
                        nameformat={}, 
                        numberformat={},
                        aftername={\quad },
                        titleformat={}, 
                        beforeskip={6pt}, 
                        afterskip={18pt},
                        indent={0pt} 
                    } 
}

%% chapter without number
\DeclareRobustCommand{\BESTI@nchapter}[1]{\chapter*{#1}\markboth{#1}{}}

%% section
\ctexset { section = {
                      name={,}, 
                      number={\thesection }, 
                      format={\raggedright \BESTI@bold \BESTI@font@st \BESTI@font@zihao {-3}}, 
                      nameformat={},
                      numberformat={}, 
                      aftername={\quad }, 
                      titleformat={}, 
                      beforeskip={18pt plus 0pt minus 0pt}, 
                      afterskip={12pt}, 
                      indent={0pt} 
                     } 
}

%% subsection
\ctexset { subsection = {
                         name={,}, 
                         number={\thesubsection},
                         format={\raggedright \BESTI@bold \BESTI@font@st \BESTI@font@zihao {4}},
                         nameformat={}, 
                         numberformat={}, 
                         aftername={\quad }, 
                         titleformat={},
                         beforeskip={12pt plus 0pt minus 0pt}, 
                         afterskip={6pt}, 
                         indent={2em} 
                        } 
}

%% subsubsection
\ctexset { subsubsection = { 
                            name={,}, 
                            number={\thesubsubsection},
                            format={\raggedright \BESTI@font@st \BESTI@font@zihao {-4}}, 
                            nameformat={},
                            numberformat={}, 
                            aftername={\quad }, 
                            titleformat={}, 
                            beforeskip={6pt plus 0pt minus 0pt}, 
                            afterskip={0pt}, indent={4em} 
                           } 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    figure and table

%% figure name
\ctexset { figurename={\BESTI@font@zihao {5}\BESTI@label@figure@cap } }

%% table name
\ctexset { tablename={\BESTI@font@zihao {5}\BESTI@label@table@cap } } 
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}} %转行

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    chinese  cover
%% ql first
\DeclareRobustCommand{\BESTI@make@cover}
{{\setlength{\parindent}{0pt}\thispagestyle{empty}%
    \normalfont\BESTI@font@st\BESTI@font@zihao{2}\setlength{\baselineskip}{30pt}%
    \makebox[\textwidth]{\rule{0pt}{12cm}}
    \rule[-3.2cm]{0pt}{3.2cm}\parbox[t]{\textwidth}{%
    \begin{center}%
        {\BESTI@bold\BESTI@value@thesis@title}%
    \end{center}%
    }
    \makebox[\textwidth]{\rule{0pt}{3.5cm}}
    \rule[-3.2cm+15pt]{0pt}{3.2cm}\hspace{3cm}\parbox[t]{9cm}{%
    \BESTI@font@zihao{4}\setlength{\baselineskip}{30pt}%
    \newlength{\linelength}
    \setlength{\linelength}{9cm-4.5em}
    \BESTI@bold\BESTI@font@ht{作者姓名~}\BESTI@font@st\BESTI@underline[\linelength]{\BESTI@value@author@name}\\%
    \setlength{\linelength}{9cm-9.5em}
    \BESTI@bold\BESTI@font@ht{指导教师姓名、职称~}\BESTI@font@st\BESTI@underline[\linelength]{\BESTI@value@advisor@name~\BESTI@value@advisor@title}\\%
    \setlength{\linelength}{9cm-6.5em}
    \BESTI@bold\BESTI@font@ht{申请学位类别~}\BESTI@font@st\BESTI@underline[\linelength]{\BESTI@value@degree}%
    }
\clearpage\thispagestyle{empty}\setlength{\parindent}{2\ccwd}\cleardoublepage}}

\DeclareRobustCommand{\BESTI@make@title}
  {{\cleardoublepage\setlength{\parindent}{0pt}\thispagestyle{empty}%

    \normalfont\BESTI@font@st\renewcommand{\baselinestretch}{1.2}\zihao{5}%
    \rule{0pt}{1.35cm}\parbox[b]{4.5cm}{
        \BESTI@bold\BESTI@label@cover@UDC\BESTI@underline[73pt]{\BESTI@value@thesis@UDC}\par%
        \vspace{2pt}%
        \BESTI@bold\BESTI@label@cover@classification\BESTI@underline[73pt]{\BESTI@value@thesis@classification}%
    }
    \hfill\parbox[b]{4.5cm}{
        \BESTI@bold\BESTI@label@cover@studentNo\BESTI@underline[83pt]{\BESTI@value@thesis@studentNo}\par%
        \vspace{2pt}%
        \BESTI@bold\BESTI@label@cover@confidential\BESTI@underline[83pt]{\BESTI@value@thesis@confidential}%
    }

\renewcommand{\baselinestretch}{1}%
    \vspace{2.05cm}%
    \makebox[\textwidth]{\rule{0pt}{4.5cm}\shortstack[c]{
        \BESTI@bold\BESTI@font@ht\BESTI@font@zihao{1}\setlength{\baselineskip}{30pt}\BESTI@label@university\\%
        \vspace{60pt} \\%
        \BESTI@bold\BESTI@font@st\BESTI@font@zihao{-1}\setlength{\baselineskip}{30pt}\BESTI@value@degreemark\BESTI@value@thesis%
    }}
    \rule{0pt}{2.7cm}%
    \rule[-3.2cm]{0pt}{3.2cm}\parbox[t]{\textwidth}{
    \begin{center}%
     \BESTI@bold\BESTI@font@zihao{2}\setlength{\baselineskip}{30pt}\BESTI@value@thesis@title%
    \end{center}%
    }

    \vspace{2.5cm}%
    \hspace{4.5cm}\parbox{10.5cm}{
        \BESTI@font@st\BESTI@font@zihao{4}\setlength{\baselineskip}{32pt}%
        {\BESTI@bold\BESTI@label@cover@author}\BESTI@value@author@name\\%
        {\BESTI@bold\BESTI@label@cover@major}\BESTI@value@author@major\\%
        {\BESTI@bold\BESTI@label@cover@submajor}\BESTI@value@author@submajor\\%
        {\BESTI@bold\BESTI@label@cover@degree}\BESTI@value@degree\\%
        {\BESTI@bold\BESTI@label@cover@advisor}\BESTI@value@advisor@name~\BESTI@value@advisor@title\\%
        %{\BESTI@bold\BESTI@label@cover@school}\BESTI@value@school\\%
        {\BESTI@bold\BESTI@label@cover@submit@date}\BESTI@value@thesis@submit@date%
    }
   \clearpage\thispagestyle{empty}%
   \renewcommand{\baselinestretch}{1}%
   \setlength{\parindent}{2\ccwd}\cleardoublepage}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    english  cover

\DeclareRobustCommand{\BESTI@make@titleenglish}
  {{\cleardoublepage\setlength{\parindent}{0pt}\thispagestyle{empty}%
    \normalfont\BESTI@font@st%

    \rule[-3.5cm]{0pt}{3.5cm}\parbox[t]{\textwidth}{%
    \BESTI@font@zihao{2}\setlength{\baselineskip}{28pt}%
    \begin{center}%
        {\BESTI@bold\BESTI@evalue@thesis@title}%
    \end{center}%
    }
    \rule{0pt}{2.5cm}%
    \rule[-5.5cm]{0pt}{5.5cm}\parbox[t]{\textwidth}{%
    \BESTI@font@zihao{3}\setlength{\baselineskip}{30pt}%
    \begin{center}%
A\space\BESTI@evalue@papertype\space submitted to\\\BESTI@elabel@university\\%
in partial fulfillment of the requirements \\ for the degree of\space\BESTI@evalue@degree%
\\ in\space\BESTI@evalue@author@major%
    \end{center}%
    }
    \rule{0pt}{7.2cm}%
    \rule[-4.5cm]{0pt}{4.5cm}\parbox[t]{\textwidth}{%
    \BESTI@font@zihao{3}\setlength{\baselineskip}{30pt}%
    \begin{center}%
By \\%
\BESTI@evalue@author@name\\%
\BESTI@elabel@cover@advisor\BESTI@evalue@advisor@name~~{Title:}\BESTI@evalue@advisor@title\\%
\BESTI@evalue@thesis@submit@date\\%
    \end{center}%
    }
   \clearpage\thispagestyle{empty}%
   \setlength{\parindent}{2\ccwd}\cleardoublepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    statement and copyright

\DeclareRobustCommand{\BESTI@make@statementandcopyright}
  {{\cleardoublepage\setlength{\parindent}{0pt}\thispagestyle{empty}%
  \normalfont\BESTI@font@st%
   \begin{center}%
   \bfseries\BESTI@font@zihao{4}%
     \BESTI@label@stat@statement%
   \end{center}%
   \BESTI@font@zihao{-4}%
   \hspace*{2em}\setlength{\parindent}{2\ccwd}\BESTI@value@stat@statement\setlength{\parindent}{0pt}%
  \vskip 20pt%
   \hspace*{2em}\BESTI@lable@stat@auther\BESTI@underline[100pt]{}\hspace*{1em}%
    \hfill \BESTI@lable@stat@date\BESTI@underline[100pt]{}\hspace*{1em}
  \vskip \stretch{6}%
   \begin{center}%
     \bfseries\BESTI@font@zihao{4}%
     \BESTI@lable@stat@copyright%
   \end{center}%
   \BESTI@font@zihao{-4}%
   \hspace*{2em}\setlength{\parindent}{2\ccwd}\BESTI@value@stat@copyright\setlength{\parindent}{0pt}%
  \vskip 20pt%
   \normalfont\BESTI@font@st\BESTI@font@zihao{-4}%
   \hspace*{2em}\BESTI@lable@stat@auther\BESTI@underline[100pt]{}\hspace*{1em}%
    \hfill \BESTI@lable@stat@advisor\BESTI@underline[100pt]{}\hspace*{1em}%
  \vskip 20pt%
   \hspace*{2em}\BESTI@lable@stat@date\BESTI@underline[100pt]{}\hspace*{1em}%
    \hfill \BESTI@lable@stat@date\BESTI@underline[100pt]{}\hspace*{1em}%
  \vskip \stretch{1}%
  \clearpage\thispagestyle{empty}%
  \setlength{\parindent}{2\ccwd}\cleardoublepage}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    abstract

%% chinese abstract
\newenvironment{abstract}
  {\BESTI@toc@add{\BESTI@toc@abstract}%
   \BESTI@nchapter{\BESTI@label@abstract}\BESTI@font@zihao{-4}}
  {\cleardoublepage}

%% chinese keywords
\DeclareRobustCommand{\keywords}[1]
  {{\setlength{\parindent}{0pt}\vspace{20pt}%
   \normalfont\BESTI@font@st\bfseries\BESTI@font@zihao{-4}%
   \BESTI@label@keywords%
   \normalfont\BESTI@font@st\BESTI@font@zihao{-4}%
   {#1}\setlength{\parindent}{2\ccwd}}}

%% english abstract
\newenvironment{englishabstract}
  {\BESTI@toc@add{\BESTI@etoc@abstract}\BESTI@nchapter{\BESTI@elabel@abstract}%
   \vspace{-2ex}\setlength{\parindent}{0pt}\normalfont\BESTI@font@zihao{-4}%
   \setlength{\parindent}{0pt}}
  {\cleardoublepage}

%% english keywords
\DeclareRobustCommand{\englishkeywords}[1]
  {{\setlength{\parindent}{0pt}\vspace{2ex}%
   \normalfont\BESTI@font@st\bfseries\BESTI@font@zihao{-4}%
   \BESTI@elabel@keywords~%
   \normalfont\BESTI@font@st\BESTI@font@zihao{-4}%
   {#1}\setlength{\parindent}{2\ccwd}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    content
    \renewcommand{\cftdot}{\ldots}
    \renewcommand{\cftdotsep}{0.1}
    \setlength{\cftbeforechapskip}{0pt}
    \setlength{\cftbeforesecskip}{0pt}
    \setlength{\cftbeforesubsecskip}{0pt}
    \renewcommand{\cftchapfont}{\BESTI@font@ht\BESTI@font@zihao{-4}}
    \renewcommand{\cftsecfont}{\BESTI@font@st\BESTI@font@zihao{-4}}
    \renewcommand{\cftsubsecfont}{\BESTI@font@st\BESTI@font@zihao{-4}}
    \renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
    \renewcommand{\cftchapdotsep}{\cftdotsep}
    \renewcommand{\cftchappagefont}{\BESTI@font@st\BESTI@font@zihao{-4}}
    \renewcommand{\cftsecpagefont}{\BESTI@font@zihao{-4}}
    \renewcommand{\cftsubsecpagefont}{\BESTI@font@zihao{-4}}
    \renewcommand{\cftfigfont}{\BESTI@font@st\BESTI@font@zihao{-4}}
    \renewcommand{\cftloftitlefont}{\BESTI@font@st\BESTI@font@zihao{-4}}
    \renewcommand{\cftfigpagefont}{\BESTI@font@st\BESTI@font@zihao{-4}}
    \renewcommand{\cfttabfont}{\BESTI@font@st\BESTI@font@zihao{-4}}
    \renewcommand{\cftlottitlefont}{\BESTI@font@st\BESTI@font@zihao{-4}}
    \renewcommand{\cfttabpagefont}{\BESTI@font@st\BESTI@font@zihao{-4}}

    \setlength{\abovecaptionskip}{0pt}
    \setlength{\belowcaptionskip}{0pt}
    %%\renewcommand{\captionlabeldelim}{\ ~}%去冒号
    \DeclareCaptionLabelSeparator{twospace}{\ ~}
    \captionsetup{labelsep=twospace} 
    \renewcommand{\captionfont}{\BESTI@font@st\BESTI@font@zihao{5}}

%% list of figures
\ctexset { listfigurename={\BESTI@label@listoffigures } }
\DeclareRobustCommand{\BESTI@listoffigures}
  {\BESTI@toc@add{\BESTI@toc@listoffigures}%
    \listoffigures}

%% list of tables
\ctexset { listtablename={\BESTI@label@listoftables } } 
\DeclareRobustCommand{\BESTI@listoftables}
  {\BESTI@toc@add{\BESTI@toc@listoftables}%
    \listoftables}

%% list of Symbols
\newenvironment{symbollist}
  {\setlength{\parindent}{0pt}\BESTI@toc@add{\BESTI@toc@symbollist@title}%
   \BESTI@nchapter{\BESTI@label@symbollist@title}\setlength{\parindent}{2\ccwd}%
   \begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \setlength{\parindent}{0pt}\normalfont\BESTI@font@st\BESTI@font@zihao{-4}
     \setlength{\leftmargin}{0.5\labelwidth}}}
  {\end{list}\setlength{\parindent}{2\ccwd}\cleardoublepage}


%% list of abbreviations
\newenvironment{abbreviationlist}
  {\setlength{\parindent}{0pt}\BESTI@toc@add{\BESTI@toc@abbreviationlist@title}%
   \BESTI@nchapter{\BESTI@label@abbreviationlist@title}\setlength{\parindent}{2\ccwd}%
   \begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \setlength{\parindent}{0pt}\normalfont\BESTI@font@st\BESTI@font@zihao{-4}
     \setlength{\leftmargin}{0.5\labelwidth}}}
  {\end{list}\setlength{\parindent}{2\ccwd}\cleardoublepage}

%% content
\ctexset { contentsname={\BESTI@label@content } }
\DeclareRobustCommand{\BESTI@tableofcontents}
  {\tableofcontents}
%\renewcommand{\cftdotsep}{0.3pt}
%\newcommand\mydot[1]{\scalebox{#1}{.}}
%\renewcommand\cftdot{\mydot{1}} % change the size of dots
%\renewcommand\cftdotsep{0.3} % change the space between dots

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    referrence
\RequirePackage{url}
\renewcommand{\UrlFont}{\BESTI@font@zihao{5}}
\ctexset { bibname={\BESTI@label@ref@title } }
\bibliographystyle{gbt7714-2005}

\renewenvironment{thebibliography}[1]
  {\BESTI@toc@add{\BESTI@toc@ref@title}%
   \BESTI@nchapter{\bibname}%
   \BESTI@font@zihao{5}%
   \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \settowidth\labelwidth{\@biblabel{#1}}%
     \leftmargin\labelwidth\advance\leftmargin\labelsep%
     \@openbib@code\usecounter{enumiv}\let\p@enumiv\@empty%
     \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy\clubpenalty4000\@clubpenalty\clubpenalty%
   \widowpenalty4000\sfcode`\.\@m}
  {\def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
   \endlist
   \cleardoublepage
   }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    thanks

\renewenvironment{thanks}
  {\BESTI@toc@add{\BESTI@toc@thanks}%
   \BESTI@nchapter{\BESTI@label@thanks}}
  {\cleardoublepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    resume

%% environment
\newenvironment{resume}
  {\setlength{\parindent}{0pt}\BESTI@toc@add{\BESTI@toc@resume@title}%
   \BESTI@nchapter{\BESTI@label@resume@title}%
   \renewcommand{\thesection}{\arabic{section}}\setlength{\parindent}{2\ccwd}}
  {\cleardoublepage}

%% resume list
\newcounter{BESTI@counter@resumelistcounter}
\newenvironment{resumelist}[1]
  {{\subsection*{\textbf{#1}}\setlength{\parindent}{2\ccwd}}%
   \begin{list}{[\arabic{BESTI@counter@resumelistcounter}]}
    {\usecounter{BESTI@counter@resumelistcounter}
     \setcounter{BESTI@counter@resumelistcounter}{0}
     \setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
     \setlength{\parindent}{0pt}\normalfont\BESTI@font@st\BESTI@font@zihao{-4}
     \setlength{\leftmargin}{2\labelwidth}}}
  {\end{list}}

\newenvironment{resumelist*}
  {\begin{list}{}
    {\setlength{\topsep}{0pt}\setlength{\itemsep}{0pt}\setlength{\parsep}{0pt}
    \setlength{\parindent}{0pt}\normalfont\BESTI@font@st\BESTI@font@zihao{-4}
     \setlength{\leftmargin}{\labelwidth}}}
  {\end{list}}

%% resume list item
\DeclareRobustCommand{\resumelistitem}{\item{}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    thesis structure

%% front matter
\DeclareRobustCommand{\BESTIfrontmatter}
  {\BESTI@make@cover%
   \BESTI@make@title%
   \BESTI@make@titleenglish%
   \BESTI@make@statementandcopyright%
   \frontmatter\pagenumbering{Roman}%
   \setlength{\baselineskip}{20pt}
   }

%% premain matter
\DeclareRobustCommand{\BESTIpremainmatter}
  {\BESTI@listoffigures\cleardoublepage%
   \BESTI@listoftables\cleardoublepage%
  }
%% main matter
\DeclareRobustCommand{\BESTImainmatter}
  {\BESTI@tableofcontents\cleardoublepage%
   \mainmatter}

%% back matter
\DeclareRobustCommand{\BESTIbackmatter}[1]
  {\backmatter{}#1{}}


	
	%\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
