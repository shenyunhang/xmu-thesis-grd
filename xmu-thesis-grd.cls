%%=============================================================================
%% xmu-thesis-grd.cls for Xiamen University Graduate Thesis
%% modified by Yunhang Shen
%% Version: 2.0
%% Last update: 2021/05/30
%% Based on BIT-thesis at https://github.com/BIT-thesis/LaTeX-template
%%==============================================================================

%% math packages -- conflict with xunicode
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,mathrsfs}
\RequirePackage{upgreek} % 直立希腊字母字体
\RequirePackage[final]{pdfpages}
\RequirePackage{ragged2e}
\usepackage{tabularx}

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{xmu-thesis-grd}[2021/05/30 v2.0 xmu-thesis-grd document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifxmu@pdf\xmu@pdffalse
\newif\ifxmu@compact\xmu@compactfalse
\DeclareOption{pdf}{\xmu@pdftrue}
\DeclareOption{compact}{\xmu@compacttrue}

\ProcessOptions\relax
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}


%% 定义一些标签
\def\xmu@label@abstract{摘~~~~要}
\def\xmu@label@compactabstract{摘要}
\def\xmu@label@enabstract{Abstract}
\def\xmu@label@abstractincontent{Abstract-Chinese}
\def\xmu@label@enabstractincontent{Abstract-English}
\def\xmu@label@keywords{关键词：}
\def\xmu@label@enkeywords{Keywords:~}
\def\xmu@label@appendix{附录}
\def\xmu@label@enappendix{Appendix}
\def\xmu@label@publications{在学期间完成的相关学术成果}
\def\xmu@label@enpublications{Relevant Academic Achievements Completed During the Acad-\linebreak emic Period}
\def\xmu@label@reference{参考文献}
\def\xmu@label@enreference{References}
\def\xmu@label@acknowledgements{致~~~~谢}
\def\xmu@label@compactacknowledgements{致谢}
\def\xmu@label@enacknowledgements{Acknowledgements}
\def\xmu@label@contents{目~~~~录}
\def\xmu@label@compactcontents{目录}
\def\xmu@label@encontents{Contents}

\def\xmu@value@templateversion{v2.0}

%% 封面内容
\def\xmu@value@title{资产重组：一个资不抵债国有企业的最佳选择}

%% 设置封面内容的命令
\renewcommand\title[2][\xmu@value@title]{
    \def\xmu@value@title{#2}
    \def\xmu@value@titlemark{\MakeUppercase{#1}}}

%% 绘制封面
\newcommand\makecover{
    \setstretch{1.78889} % 设置行间距
    \newpage
    \cleardoublepage
    \thispagestyle{empty}
    \pdfbookmark[0]{封面}{cover}
    
    \includepdf[pages=-]{pdf_files/cover.pdf}
    
    \clearpage
    \thispagestyle{empty}
    \cleardoublepage
}

%% 绘制原创性声明
\newcommand\makeoriginalitystatement{
    \cleardoublepage
    \pdfbookmark[0]{原创性声明}{originality_statement}
    \thispagestyle{empty}
    
    \setstretch{2.2}
    \includepdf[pages=-]{pdf_files/originality_statement.pdf}
    
    \clearpage
    \thispagestyle{empty}
    \cleardoublepage
}

%% 论文著作权使用声明
\newcommand\makecopyrightstatement{
    \cleardoublepage
    \pdfbookmark[0]{著作权使用声明}{copyright_statement}
    \thispagestyle{empty}
    
    \setstretch{2.2}
    \includepdf[pages=-]{pdf_files/copyright_statement.pdf}
    
    \clearpage
    \thispagestyle{empty}
    \cleardoublepage
}

%% 学位论文答辩委员会名单
\newcommand\makenamelist{
    \cleardoublepage
    \pdfbookmark[0]{学位论文答辩委员会名单}{name_list}
    \thispagestyle{empty}
    
    \includepdf[pages=-]{pdf_files/name_list.pdf}
    
    \clearpage
    \thispagestyle{empty}
    \cleardoublepage
}

%% 设置中文字体
\let\songti\relax
\let\heiti\relax
\let\kaishu\relax
\newCJKfontfamily\songti{SimSun.ttc}[AutoFakeSlant,AutoFakeBold]
\newCJKfontfamily\kaishu{SimKai.ttf}[AutoFakeSlant,AutoFakeBold]
\newCJKfontfamily\heiti{SimHei.ttf}[AutoFakeSlant,AutoFakeBold]

%% 设置英文字体
\RequirePackage{xltxtra} % \XeTeX Logo
\setmainfont{Times New Roman}
\setsansfont{Arial}
\setmonofont{Courier New}

%% 不允许断字（如果设置了断字的话，当英文目录标题过长并出现断字的时候，该标题的页码会跑到左边）
% \tolerance=1
% \emergencystretch=\maxdimen
% \hyphenpenalty=10000
% \hbadness=10000

%% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

%% the setup of ctex package
\def\contentsname{\xmu@label@contents}
\def\encontentsname{\xmu@label@encontents}
\def\listfigurename{\xmu@label@listoffigures}
\def\listtablename{\xmu@label@listoftables}

%% 当前模板的版本
\newcommand{\version}{\xmu@value@templateversion}

%% 页面设置。设置纸张类型、页面边距和页眉、页脚
%%页边距：上—3.0 厘米，下—3.0 厘米，左—3.0 厘米，右—3.0 厘米，装订线 0 厘米；
%%页码范围：普通；
%%页眉距边界：2.2 厘米，页脚距边界：2.2 厘米。
%% https://mirrors.aliyun.com/CTAN/macros/latex/contrib/geometry/geometry.pdf
\RequirePackage[
paper=a4paper,%
top=3.0cm,%
bottom=3.0cm,%
left=3.0cm,%
right=3.0cm,%
headsep=0.3cm,%
headheight=0.5cm,%
footskip=0.6cm,%
bindingoffset=0cm,%
includehead=false,%
includefoot=false,%
]{geometry}

%% 设置段落间距
%% 段前空 0 磅,段后空 0 磅。
%% https://latexref.xyz/_005cparindent-_0026-_005cparskip.html
% \parskip 0.5ex plus 0.25ex minus 0.25ex
\setlength{\parskip}{0pt}

\RequirePackage{layout}

%% https://latexref.xyz/Layout.html
%% Make all text pages the same height.
%\flushbottom
%% Allow text pages of differing height.
\raggedbottom

%% https://mirrors.hit.edu.cn/CTAN/macros/latex/contrib/titlesec/titlesec.pdf
\RequirePackage[bottomtitles]{titlesec}
%\renewcommand{\bottomtitlespace}{-400pt}

\widowpenalty=10000
\clubpenalty=10000

%% 删掉偶数页
\def\cleardoublepage{
    \clearpage
    \ifodd
    \c@page
    \else
    \thispagestyle{empty}%
    \hbox{}
    \newpage
    \if@twocolumn
    \hbox{}
    \newpage
    \fi
    \fi
}
\let\xmu@cleardoublepage\cleardoublepage
\newcommand{\xmu@clearemptydoublepage}{ % 对于 openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚。
    \clearpage{\pagestyle{xmu@empty}\xmu@cleardoublepage}
}
\let\cleardoublepage\xmu@clearemptydoublepage

%% 行距为1.5倍
\RequirePackage{setspace}
\setstretch{1.5}
\linespread{1.5}

%% 设置章节格式（一倍行距为字体大小 × 1.297(1.3) × 1.25）
%% https://mirrors.sjtug.sjtu.edu.cn/ctan/language/chinese/ctex/ctex.pdf
%% 各章标题,例如:“第1章 引言”。 章序号采用阿拉伯数字,章序号与标题名之间空一个汉字符。采用黑体小三号字加粗,居中书写,单倍行距,段前空 24 磅,段后空 18 磅。论文的摘要,目录,参考文献,附录,致谢,在学期间完成的相关学术成果等部分的标题与章标题属于同一等级,也使用上述格式;英文摘要部分的标题“Abstract”以及英文目录“Contents”,采用 Arial 体小三号字加粗。
\ctexset{chapter={
        name = {第,章},
        number = {\arabic{chapter}},
        format = {\bfseries \sffamily \heiti \centering \zihao{-3}},
        pagestyle = {xmu@headings},
        beforeskip = 34pt,
        afterskip = 40pt,
        fixskip = true,
        aftername = ~~~~,
    }
}
\newcommand\reducespacing{
    \vspace{-10pt} %用于临时减少章标题的段后值。
}

%% 设置一级章节格式
%% 一级节标题,例如:“2.1 实验装置与实验方法”。节标题序号与标题名之间空一个汉字符(下同)。采用黑体四号(14pt)字加粗居左书写,行距为1.5倍,段前空 24 磅,段后空 6 磅。
\ctexset{section={
        format={\raggedright \sffamily \bfseries \heiti \zihao{4}},
        beforeskip = 24bp + 7bp + 8pt,
        afterskip = 6bp + 14bp + 0pt,
        fixskip = true,
    }
}

%% 设置二级标题格式 
%% 二级节(目)标题,例如:“2.1.1实验装置”。采用黑体小四号(12pt)字加粗居左书写,行距为1.5倍,段前空 12磅,段后空 6 磅。
\ctexset{subsection={
        format = {\bfseries \sffamily \heiti \raggedright \zihao{-4}},
        beforeskip = 24bp + 14bp,
        afterskip = 6bp + 12bp,
        fixskip = true,
    }
}

%% 设置三节标题格式
%% 三级节(子目)标题,例如:“2.1.2.1 归纳法”。采用黑体小四号(12pt)字加粗居左书写,行距为1.5倍,段前空 12磅,段后空 6 磅。一般情况下不建议使用三级节标题。
\ctexset{subsubsection={
        format = {\heiti \raggedright \zihao{-4}},
        beforeskip = 24bp + 14bp,
        afterskip = 6bp + 12bp,
        fixskip = true,
    }
}

%% 选择编译
\RequirePackage{ifthen}

%% check pdfTeX mode
\RequirePackage{ifpdf}

%% 设置前置
\renewcommand{\frontmatter}{ % 修改 frontmatter 的页码为大写罗马格式，并调整页面风格
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{xmu@headings}
}

%% 设置正文
\RequirePackage{setspace}
\renewcommand{\mainmatter}{ % 修改 mainmatter 的页码为阿拉伯格式，并调整页面风格
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{xmu@headings}
    \setstretch{1.5} %设置正文段落行距
}

%% 设置后置
\renewcommand{\backmatter}{%
    \@mainmatterfalse
    
}

%% 复杂表格
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

%% 定理
\theoremstyle{plain}
\newtheorem{algo}{算法~}[chapter]
\newtheorem{thm}{定理~}[chapter]
\newtheorem{lem}[thm]{引理~}
\newtheorem{prop}[thm]{命题~}
\newtheorem{cor}[thm]{推论~}
\theoremstyle{definition}
\newtheorem{defn}{定义~}[chapter]
\newtheorem{conj}{猜想~}[chapter]
\newtheorem{exmp}{例~}[chapter]
\newtheorem{rem}{注~}
\newtheorem{case}{情形~}
\renewcommand{\proofname}{\bf 证明}

%% graphics packages
\RequirePackage{graphicx}

%% 并列子图
\RequirePackage{subcaption}
\RequirePackage{wrapfig}

%% 设置图表标题选项
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{~~}
\DeclareCaptionFont{captionfont}{\bfseries \songti \zihao{-4}}
\captionsetup{
    font = {captionfont},
    labelsep = zhspace,
}
\captionsetup[table]{
    position = top,
    aboveskip = 6bp,
    belowskip = 6bp,
    skip = -10pt,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
    position = bottom,
    aboveskip = 6bp,
    belowskip = 6bp,
    skip = 2pt,
}

\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

%% 如果插入的图片没有指定扩展名，那么依次搜索下面的扩展名所对应的文件
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

%% 将浮动参数设为较宽松的值
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

%% 表与上下正文之间各空一行。
\setlength{\floatsep}{12pt}
\setlength{\textfloatsep}{12pt}
\setlength{\intextsep}{12pt}

\setlength\intextsep{0mm}

%% 定公式、图、表编号格式
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}

%% 表、图、公式编号里加入章节编号
%\numberwithin{equation}{chapter}
%\counterwithin{equation}{chapter}
%\counterwithin{figure}{chapter}
%\counterwithin{table}{chapter}

%% 颜色宏包
\RequirePackage{xcolor}

%% 设置源代码显示格式
\RequirePackage{listings}
\lstset{tabsize=4, %
    frame=shadowbox, %把代码用带有阴影的框圈起来
    commentstyle=\color{red!50!green!50!blue!50},%浅灰色的注释
    rulesepcolor=\color{red!20!green!20!blue!20},%代码块边框为淡青色
    keywordstyle=\color{blue!90}\bfseries, %代码关键字的颜色为蓝色，粗体
    showstringspaces=false,%不显示代码字符串中间的空格标记
    stringstyle=\ttfamily, % 代码字符串的特殊格式
    keepspaces=true, %
    breakindent=22pt, %
    numbers=left,%左侧显示行号
    stepnumber=1,%
    numberstyle=\tiny, %行号字体用小号
    basicstyle=\footnotesize, %
    showspaces=false, %
    flexiblecolumns=true, %
    breaklines=true, %对过长的代码自动换行
    breakautoindent=true,%
    breakindent=4em, %
    aboveskip=1em, %代码块边框
    %% added by http://bbs.ctex.org/viewthread.php?tid=53451
    fontadjust,
    captionpos=t,
    framextopmargin=2pt,framexbottommargin=2pt,abovecaptionskip=-3pt,belowcaptionskip=3pt,
    xleftmargin=4em,xrightmargin=4em, % 设定listing左右的空白
    texcl=true,
    % 设定中文冲突，断行，列模式，数学环境输入，listing数字的样式
    extendedchars=false,columns=flexible,mathescape=true
    numbersep=-1em
}
\renewcommand{\lstlistingname}{代码} %% 重命名Listings标题头

%% hyperref package
\RequirePackage{hyperref}
\hypersetup{
    bookmarksnumbered,%
    linktoc=all,
    colorlinks=true,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    linkbordercolor=black,
    urlcolor=black,
    plainpages=false,%
    pdfstartview=FitH
}

%% enumerate 列表环境间距调节
\RequirePackage[inline, shortlabels]{enumitem}

%% 页眉页脚
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancypagestyle{xmu@empty}{ %无页眉页脚
    \fancyhf{}}
\fancypagestyle{xmu@headings}{ %有页眉页脚
    \fancyhf{}
    \fancyfoot[C]{\songti\zihao{5} \thepage}
    
    \fancyhead[CO]{\zihao{5} \songti \nouppercase\leftmark}
    \fancyhead[CE]{\zihao{5} \songti {\xmu@value@title}}
}

%% 脚注样式 
% 设置圈型角标
\usepackage{pifont}
\usepackage[hang,flushmargin,perpage,symbol*]{footmisc}
\DefineFNsymbols{circled}{{\ding{192}}{\ding{193}}{\ding{194}}
    {\ding{195}}{\ding{196}}{\ding{197}}{\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}
% 设置角标数字的字体和正文一致，并且1.5字符缩进
\usepackage{scrextend}
\deffootnote{1.6em}{0em}{\thefootnotemark \enskip}

%% 下一页从偶数页开始
\newcommand\beginatevenpage{
    \clearpage
    \thispagestyle{xmu@empty}
    \cleardoublepage
    
}

%% 中文摘要
\newenvironment{abstract}{
    \setstretch{1.38889} % 设置行间距
    \cleardoublepage

    \ctexset{chapter={ %暂时修改标题样式
            format = {\heiti \centering \zihao{-3}},
            afterskip = 32pt,
        }
    }
    
    \chapter*{\xmu@label@abstract}
    
    \ctexset{chapter={ %恢复回默认的格式
            format = {\bfseries \sffamily \heiti \centering \zihao{-3}},
            afterskip = 40pt,
        }
    }
    
    \ifxmu@compact
    \addcontentsline{toc}{chapter}{\xmu@label@compactabstract} % 将摘要加入到目录中
    \markboth{\xmu@label@compactabstract}{\xmu@label@compactabstract} % 页眉
    \else
    \addcontentsline{toc}{chapter}{\xmu@label@abstract} % 将摘要加入到目录中
    \markboth{\xmu@label@abstract}{\xmu@label@abstract} % 页眉
    \fi
    
    \addtocontents{etoc}{\protect\contentsline{chapter}{\sffamily  \xmu@label@abstractincontent}{\sffamily \thepage}{chapter.\thechapter}}	
    \songti\zihao{-4}
}

%% 中文关键词
\newcommand\keywords[1]{\vspace{2ex}\noindent{\bfseries\songti\zihao{-4}\xmu@label@keywords}\setstretch{1.38889} #1}

%% 英文摘要
\newenvironment{enabstract}{
    \setstretch{1.38889}
    \cleardoublepage
    
    \ctexset{chapter={ %暂时修改标题样式
            format = {\bfseries \sffamily \centering \zihao{3}},
            afterskip = 35pt,
        }
    }
    
    \chapter{\xmu@label@enabstract}
    
    \ctexset{chapter={ %恢复回默认的格式
            format = {\bfseries \sffamily \heiti \centering \zihao{-3}},
            afterskip = 40pt,
        }
    }
    
    \addtocontents{etoc}{\protect\contentsline{chapter}{\sffamily \xmu@label@enabstractincontent}{\sffamily \thepage}{chapter.\thechapter}}
    \zihao{-4}
}

%% 英文关键词
\newcommand\enkeywords[1]{\vspace{2ex}\noindent{\bfseries\zihao{-4}\xmu@label@enkeywords}\setstretch{1.38889} #1}

%% 设置目录各级标题样式
\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]
{\contentsmargin{0mm} \bfseries \heiti \zihao{4} \setlength{\baselineskip}{25pt}}
{\thecontentslabel\hspace{\ccwd}}
{\bfseries}
{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} \thecontentspage}
\titlecontents{section}[1\ccwd]
{\contentsmargin{0mm} \bfseries \heiti \zihao{-4} \setlength{\baselineskip}{25pt}}
{\thecontentslabel\hspace{\ccwd}}
{\bfseries}
{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} \thecontentspage}
\titlecontents{subsection}[2\ccwd]
{\contentsmargin{0mm} \songti \zihao{-4} \setlength{\baselineskip}{25pt}}
{\thecontentslabel\hspace{\ccwd}}
{}
{\hspace{.5em}\titlerule*{\zihao{-4} \normalfont.} \thecontentspage}

%% 中英文目录
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{etoc}{\protect\hypersetup{hidelinks}}

%% 中文目录
\renewcommand\tableofcontents{
    \setstretch{1.58889} % 设置行间距
    \if@twocolumn
    \@restonecoltrue\onecolumn
    \else
    \@restonecolfalse
    \fi
    
    \chapter*{\contentsname}
    
    \ifxmu@compact
    \markboth{\xmu@label@compactcontents}{\xmu@label@compactcontents} % 页眉
    \addcontentsline{toc}{chapter}{\xmu@label@compactcontents} %将中文摘要加入到目录中
    \else
    \markboth{\xmu@label@contents}{\xmu@label@contents} % 页眉
    \addcontentsline{toc}{chapter}{\xmu@label@contents} %将中文摘要加入到目录中
    \fi
    
    \makeatletter
    \renewcommand{\@pnumwidth}{0em}
    \makeatother
    \reducespacing
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
}
\setcounter{secnumdepth}{4}  % 目录显示的章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)

%% 添加英文目录条目的命令
\newcommand\enchapter[1]{\addtocontents{etoc}
    {\protect\contentsline{chapter}
        {\protect\numberline{\sffamily Chapter \thechapter}#1}
        {\sffamily \thepage}{chapter.\thechapter}}
}
\newcommand\ensection[1]{\addtocontents{etoc}
    {\protect\contentsline{section}
        {\protect\numberline{\sffamily \thesection}#1}
        {\sffamily \thepage}{section.\thesection}}
}
\newcommand\ensubsection[1]{\addcontentsline{etoc}{subsection}{\protect\numberline{\thesubsection}#1}}
\newcommand\ensubsubsection[1]{\addcontentsline{etoc}{subsubsection}{\protect\numberline{\thesubsubsection}#1}}

%% 英文目录
\newcommand\entableofcontents{
    \setstretch{1.58889} % 设置行间距
    \if@twocolumn
    \@restonecoltrue\onecolumn
    \else
    \@restonecolfalse
    \fi
    
    \addtocontents{etoc}{\protect\contentsline{chapter}{\sffamily Contents}{\sffamily \thepage}{chapter.\thechapter}} %将Contents加入到英文目录中
    \chapter*{\sffamily\encontentsname}
    
    \pdfbookmark[0]{Contents}{english_contents}
    
    \markboth{\encontentsname}{\encontentsname}%修改页眉文字
    
    \makeatletter
    \renewcommand{\@pnumwidth}{0em}% 1.55em
    \makeatother
    
    %\setlength{\baselineskip}{25pt}
    \reducespacing
    %\begingroup
    %\raggedright
    \@starttoc{etoc}%
    %\endgroup
    \if@restonecol\twocolumn\fi
}

%% 参考文献风格
\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-numerical} 
% \bibliographystyle{reference/GBT7714-2005NLang}

%% 引用文献序号的排序与压缩
% \RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} % 上标引用

%% 参考文献环境
\renewenvironment{thebibliography}[1]{
    \zihao{5}
    \setlength{\baselineskip}{16pt}
    \chapter*{\bibname}
    \reducespacing
    \addtocontents{etoc}{\protect\contentsline{chapter}{\sffamily\xmu@label@enreference}{\sffamily \thepage}{chapter.\thechapter}}
    \markboth{\bibname}{\bibname}%
    \addcontentsline{toc}{chapter}{\xmu@label@reference}
    \vspace{3pt}
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \setlength{\parsep}{0mm}
        \setlength{\labelsep}{0.5em}
        \setlength{\itemsep}{3pt}
        \setlength{\listparindent}{0in}
        \setlength{\itemindent}{0in}
        \setlength{\rightmargin}{0in}
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m}
{\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist}

%% 在学期间完成的相关学术成果
\newenvironment{publications}[1]{
    \zihao{-4}
    \setlength{\baselineskip}{21pt}
    \chapter{\xmu@label@publications}
    \addtocontents{etoc}{\protect\contentsline{chapter}{\sffamily\xmu@label@enpublications}{\sffamily {\thepage}}{chapter.\thechapter}}
    \markboth{\MakeUppercase\xmu@label@publications}
    {\MakeUppercase\xmu@label@publications}%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \setlength{\parsep}{0mm}
        \setlength{\labelsep}{0.5em}
        \setlength{\itemsep}{3pt}
        \setlength{\listparindent}{0in}
        \setlength{\itemindent}{0in}
        \setlength{\rightmargin}{0in}
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \sfcode`\.\@m}
{\def\@noitemerr
    {\@latex@warning{Empty `publications' environment}}%
    \endlist}
\newcommand\publicationpreamble[1]{
    \item[]\vspace{0.75cm}\hspace{-\labelwidth}\hspace{-\labelsep}{\heiti  \bfseries #1}
}

%% 致谢 
\newenvironment{acknowledgements}{
    \cleardoublepage
    \chapter*{\xmu@label@acknowledgements}
    \markboth{\xmu@label@compactacknowledgements}{\xmu@label@compactacknowledgements} % 页眉
    \addcontentsline{toc}{chapter}{\xmu@label@compactacknowledgements}
    \addtocontents{etoc}{\protect\contentsline{chapter}{\sffamily\xmu@label@enacknowledgements}{\sffamily \thepage}{chapter.\thechapter}}
    % 	\addcontentsline{etoc}{chapter}{\sffamily\xmu@label@enacknowledgements}
    \songti
}

%% 单位宏包
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}

%% 附录编号样式
\newcommand\setappendixnumberformat{
    \renewcommand\theequation{\Alph{chapter}--\arabic{equation}}  % 附录中编号形式是"A-1"的样子
    \renewcommand\thefigure{\Alph{chapter}--\arabic{figure}}
    \renewcommand\thetable{\Alph{chapter}--\arabic{table}}
    
    \ctexset{chapter={afterskip = 30pt}}
}

\endinput
