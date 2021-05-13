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

\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{xmu-thesis-grd}[2021/05/30 v2.0 xmu-thesis-grd document class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\newif\ifxmu@master\xmu@masterfalse
\newif\ifxmu@doctor\xmu@doctorfalse
\newif\ifxmu@istwoside\xmu@istwosidefalse
\newif\ifxmu@pdf\xmu@pdffalse
\DeclareOption{twoside}{\xmu@istwosidetrue}
\DeclareOption{master}{\xmu@mastertrue}
\DeclareOption{doctor}{\xmu@doctortrue}
\DeclareOption{pdf}{\xmu@pdftrue}

\ProcessOptions\relax
\ifxmu@istwoside
\LoadClass[zihao=-4,a4paper,twoside,openright,UTF8,space=auto]{ctexbook}
\else
\LoadClass[zihao=-4,a4paper,oneside,openany,UTF8,space=auto]{ctexbook}
\fi

\let\songti\relax
\let\heiti\relax
\let\kaishu\relax
\newCJKfontfamily\songti{SimSun}[AutoFakeSlant,AutoFakeBold]
\newCJKfontfamily\kaishu{KaiTi}[AutoFakeSlant,AutoFakeBold]
\newCJKfontfamily\heiti{SimHei}[AutoFakeSlant,AutoFakeBold]

%% 定义一些标签
\def\xmu@label@abstract{摘~~要}
\def\xmu@label@compactabstract{摘要}
\def\xmu@label@enabstract{Abstract}
\def\xmu@label@encompactabstract{Abstract}
\def\xmu@label@keywords{关键词：}
\def\xmu@label@enkeywords{Key Words:~}
\def\xmu@label@appendix{附录}
\def\xmu@label@enappendix{Appendix}
\def\xmu@label@publications{在学期间完成的相关学术成果}
\def\xmu@label@enpublications{Relevant Academic Achievements Completed During the Academic Period}
\def\xmu@label@projects{攻读博士学位期间参与的项目清单}
\def\xmu@label@enprojects{Projects}
\def\xmu@label@reference{参考文献}
\def\xmu@label@enreference{Reference}
\def\xmu@label@acknowledgements{致~~谢}
\def\xmu@label@compactacknowledgements{致谢}
\def\xmu@label@enacknowledgements{Acknowledgements}
\def\xmu@label@abbreviations{术语缩写汇总}
\def\xmu@label@enabbreviations{List of Abbreviation}
\def\xmu@label@notations{符号说明}
\def\xmu@label@ennotations{Notations}
\def\xmu@label@content{目~~录}
\def\xmu@label@encontent{Contents}
\def\xmu@label@listoffigures{图索引}
\def\xmu@label@enlistoffigures{List of Figures}
\def\xmu@label@listoftables{表索引}
\def\xmu@label@enlistoftables{List of Tables}

\def\xmu@value@templateversion{v2.0}

%% the setup of ctex package
\def\contentsname{\xmu@label@content}
\def\encontentsname{\xmu@label@encontent}
\def\listfigurename{\xmu@label@listoffigures}
\def\listtablename{\xmu@label@listoftables}

%% 当前模板的版本
\newcommand{\version}{\xmu@value@templateversion}

%% 页面设置。设置纸张类型、页面边距和页眉、页脚
%\RequirePackage[%
%	paper=a4paper,%
%	top=3.5cm,% 上 3.5cm %
%	bottom=2.5cm,% 下 2.5cm %
%	left=2.7cm,% 左 2.7cm %
%	right=2.7cm,% 右 2.7cm %
%	headheight=1.0cm,% 页眉 2.5cm %
%	footskip=0.7cm% 页脚 1.8cm %
%]{geometry}
%%页边距：上—3.0 厘米，下—3.0 厘米，左—3.0 厘米，右—3.0 厘米，装订线 0 厘米；
%%页码范围：普通；
%%页眉距边界：2.2 厘米，页脚距边界：2.2 厘米。
%% https://mirrors.aliyun.com/CTAN/macros/latex/contrib/geometry/geometry.pdf
\RequirePackage[%
paper=a4paper,
top=3.0cm,
bottom=3.0cm,
left=3.0cm,
right=3.0cm,
headsep=0.3cm,
headheight=0.5cm,
footskip=0.6cm,
bindingoffset=0cm,
includehead=false,
includefoot=false,
]{geometry}

%% 段前空 0 磅,段后空 0 磅。
%% https://latexref.xyz/_005cparindent-_0026-_005cparskip.html
%\parskip 0.5ex plus 0.25ex minus 0.25ex
\setlength{\parskip}{0pt}

\RequirePackage{layout}

%% https://latexref.xyz/Layout.html
%% Make all text pages the same height.
%\flushbottom
%% Allow text pages of differing height.
\raggedbottom

%% 删掉偶数页
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

%% 行距为1.5倍
\RequirePackage{setspace}
\setstretch{1.5}
\linespread{1.5}

%% https://mirrors.sjtug.sjtu.edu.cn/ctan/language/chinese/ctex/ctex.pdf
%% 各章标题,例如:“第1章 引言”。 章序号采用阿拉伯数字,章序号与标题名之间空一个汉字符。采用黑体小三号字加粗,居中书写,单倍行距,段前空 24 磅,段后空 18 磅。论文的摘要,目录,参考文献,附录,致谢,在学期间完成的相关学术成果等部分的标题与章标题属于同一等级,也使用上述格式;英文摘要部分的标题“Abstract”以及英文目录“Contents”,采用 Arial 体小三号字加粗。
\ctexset{chapter = {
        name = {第,章},
        number = {\arabic{chapter}},
        format = {\bfseries \heiti \centering \zihao{-3}},
        pagestyle = {xmu@headings},
        beforeskip = 24bp + 8bp,
        afterskip = 18bp + 15bp + 10bp,
        fixskip = true,
    }
}

%% 一级节标题,例如:“2.1 实验装置与实验方法”。节标题序号与标题名之间空一个汉字符(下同)。采用黑体四号(14pt)字加粗居左书写,行距为1.5倍,段前空 24 磅,段后空 6 磅。
\ctexset{section = {
        format = {\raggedright \bfseries \heiti \zihao{4}},
        beforeskip = 24bp + 7bp + 8pt,
        afterskip = 6bp + 14bp + 0pt,
        fixskip = true,
    }
}

%% 二级节(目)标题,例如:“2.1.1实验装置”。采用黑体小四号(12pt)字加粗居左书写,行距为1.5倍,段前空 12磅,段后空 6 磅。
\ctexset{subsection = {
        format = {\bfseries \heiti \raggedright \zihao{-4}},
        beforeskip = 24bp + 14bp,
        afterskip = 6bp + 12bp,
        fixskip = true,
    }
}

%% 三级节(子目)标题,例如:“2.1.2.1 归纳法”。采用黑体小四号(12pt)字加粗居左书写,行距为1.5倍,段前空 12磅,段后空 6 磅。一般情况下不建议使用三级节标题。
\ctexset{subsubsection = {
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

%% fancyhdr 页眉页脚控制
\RequirePackage{fancyhdr}

\let\xmu@cleardoublepage\cleardoublepage
\newcommand{\xmu@clearemptydoublepage}{ % 对于 openright 选项，必须保证章页右开，且如果前章末页内容须清空其页眉页脚。
    \clearpage{\pagestyle{xmu@empty}\xmu@cleardoublepage}}
\let\cleardoublepage\xmu@clearemptydoublepage

\renewcommand{\frontmatter}{ % 修改 frontmatter 的页码为大写罗马格式，并调整页面风格
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{xmu@headings}
}

\renewcommand{\mainmatter}{ % 修改 mainmatter 的页码为阿拉伯格式，并调整页面风格
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{xmu@headings}
}

%% 复杂表格
\RequirePackage{threeparttable}
\RequirePackage{dcolumn}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\newcolumntype{d}[1]{D{.}{.}{#1}}% or D{.}{,}{#1} or D{.}{\cdot}{#1}

%% 定义几个常用的数学常量符号
\newcommand{\me}{\mathrm{e}}
\newcommand{\mi}{\mathrm{i}}
\newcommand{\mj}{\mathrm{j}}
\newcommand{\dif}{\,\mathrm{d}}

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

%% 英文字体使用 Times New Roman
\RequirePackage{xltxtra} % \XeTeX Logo
\RequirePackage{fontspec}
\setmainfont[Ligatures=TeX]{Times New Roman}
\setsansfont[Ligatures=TeX]{Arial}
\setmonofont[Ligatures=TeX]{Courier New}

%% graphics packages
\RequirePackage{graphicx}
\RequirePackage{epsfig}
\RequirePackage{stackengine}

%% 并列子图
%\RequirePackage{subfigure}
\RequirePackage{subcaption}% replace subfigure with subcaption
\RequirePackage{wrapfig}

%% 设置图表标题选项
\RequirePackage{amsmath}
\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{ }
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

%% 引用文献序号的排序与压缩
\RequirePackage[numbers,square,comma,super,sort&compress]{natbib}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} % 上标引用

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

%% 中文破折号
\newcommand{\cndash}{\rule{0.0em}{0pt}\rule[0.35em]{1.4em}{0.05em}\rule{0.2em}{0pt}}

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
\definecolor{navyblue}{RGB}{0,0,128}
\RequirePackage{hyperref}
\hypersetup{
    bookmarksnumbered,%
    linktoc=all,
    colorlinks=true,
    citecolor=navyblue,
    filecolor=cyan,
    linkcolor=navyblue,
    linkbordercolor=navyblue,
    urlcolor=navyblue,
    plainpages=false,%
    pdfstartview=FitH
}

%% enumerate 列表环境间距调节
%\RequirePackage{enumitem}
\RequirePackage[inline, shortlabels]{enumitem}

%% 参考文献风格
\bibliographystyle{reference/GBT7714-2005NLang}
%\bibliographystyle{reference/xmuthesis2}

%% 设置标题
\def\xmu@value@title{}
\renewcommand\title[2][\xmu@value@title]{
    \def\xmu@value@title{#2}
    \def\xmu@value@titlemark{\MakeUppercase{#1}}}

%% 绘制封面
\newcommand\makecover{
    \newpage
    \cleardoublepage
    \thispagestyle{empty}
    %\pdfbookmark[0]{封面}{cover}

    \ifxmu@pdf
    \includepdf[pages=-]{pdf_files/cover.pdf}
    \else

    \fi

    \clearpage
    \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
    \fi
}

%% 绘制原创性声明
\newcommand\makeoriginalitystatement{
    \cleardoublepage
    %\pdfbookmark[0]{原创性声明}{originality_statement}
    \thispagestyle{empty}

    \ifxmu@pdf
    \includepdf[pages=-]{pdf_files/originality_statement.pdf}
    \else

    \fi

    \clearpage
    \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
    \fi
}

%% 论文著作权使用声明
\newcommand\makecopyrightstatement{
    \cleardoublepage
    %\pdfbookmark[0]{著作权使用声明}{copyright_statement}
    \thispagestyle{empty}

    \ifxmu@pdf
    \includepdf[pages=-]{pdf_files/copyright_statement.pdf}

    \else

    \fi

    \clearpage
    \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
    \fi
}

%% 论文答辩委员会名单
\newcommand\makeListofThesisDefenseCommittees{
    \cleardoublepage
    %\pdfbookmark[0]{学位论文答辩委员会名单}{list_of_thesis_defense_committees}
    \thispagestyle{empty}

    \ifxmu@pdf
    \includepdf[pages=-]{pdf_files/list_of_thesis_defense_committees.pdf}

    \else

    \fi

    \clearpage
    \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
    \fi
}

%% 页眉页脚
\pagestyle{fancy}
\fancyhf{}

%% 只有页脚无页眉
\fancypagestyle{plain}{
    \fancyfoot[C]{\songti \zihao{5} {\thepage}} %% 页脚格式
    \fancyhead{}                                %% 去掉页眉
    \renewcommand{\headrulewidth}{0pt}          %% 去掉页眉下面的横线
}

%% 无页眉页脚
\fancypagestyle{xmu@empty}{
    \fancyhf{}
    \fancyfoot{}                                %% 去掉页脚
    \fancyhead{}                                %% 去掉页眉
    \renewcommand{\headrulewidth}{0pt}          %% 去掉页眉下面的横线
}

%% 正文页眉页脚
\fancypagestyle{xmu@headings}{
    \fancyhf{}

    \fancyfoot[C]{\songti\zihao{5} \thepage}                    %% 页脚格式

    \fancyhead[CO]{\zihao{5} \songti \leftmark}                 %% 奇数页眉
    \fancyhead[CE]{\zihao{5} \songti {\xmu@value@title}}        %% 偶数页眉
}

%% 中文摘要
\newenvironment{abstract}{
    \cleardoublepage
    \chapter*{\xmu@label@abstract}
    \markboth{\xmu@label@compactabstract}{\xmu@label@compactabstract} % 页眉
    \addcontentsline{toc}{chapter}{\xmu@label@compactabstract}
    \addcontentsline{etoc}{chapter}{Chinese Abstract} %将中文摘要加入到英文目录中
    \thispagestyle{xmu@headings}
    \songti\zihao{-4}
}

%% 下一页从偶数页开始
\newcommand\beginatevenpage{
    \clearpage
    \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
    \fi
}

%% 中文关键词
\newcommand\keywords[1]{\vspace{2ex}\noindent{\bfseries\songti\zihao{-4}\xmu@label@keywords} #1}

%% 英文摘要
\newenvironment{enabstract}{
    \cleardoublepage
    \chapter*{\xmu@label@enabstract}
    \markboth{\xmu@label@encompactabstract}{\xmu@label@encompactabstract} % 页眉
    \addcontentsline{toc}{chapter}{\xmu@label@encompactabstract}
    \addcontentsline{etoc}{chapter}{English Abstract} %将英文摘要加入到英文目录中
    \thispagestyle{xmu@headings}
    \zihao{-4}
}

%% 英文关键词
\newcommand\enkeywords[1]{\vspace{2ex}\noindent{\bfseries\zihao{-4}\xmu@label@enkeywords} #1}

%% 中文目录
\addtocontents{toc}{\protect\hypersetup{hidelinks}}
\addtocontents{etoc}{\protect\hypersetup{hidelinks}}
\addtocontents{lot}{\protect\hypersetup{hidelinks}}
\addtocontents{lof}{\protect\hypersetup{hidelinks}}

\RequirePackage{titletoc}
\titlecontents{chapter}[0pt]{\bfseries \heiti \zihao{4}}
{\thecontentslabel\hspace{\ccwd}}{\bfseries}
{\hspace{.5em}\titlerule*{.} \contentspage}
\titlecontents{section}[2\ccwd]{\bfseries \heiti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.} \contentspage}
\titlecontents{subsection}[4\ccwd]{\songti \zihao{-4}}
{\thecontentslabel\hspace{\ccwd}}{}
{\hspace{.5em}\titlerule*{.} \contentspage}

\titlecontents{figure}[0pt]{\songti\zihao{-4}}
{\figurename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.} \contentspage}

\titlecontents{table}[0pt]{\songti\zihao{-4}}
{\tablename~\thecontentslabel\quad}{\hspace*{-1.5cm}}
{\hspace{.5em}\titlerule*{.} \contentspage}

\renewcommand\tableofcontents{
    \if@twocolumn
    \@restonecoltrue\onecolumn
    \else
    \@restonecolfalse
    \fi
    \chapter*{\contentsname}
    \thispagestyle{xmu@headings}
    \@mkboth{\contentsname}{\contentsname}%
    \pdfbookmark[0]{目录}{contents}
    \makeatletter
    \renewcommand{\@pnumwidth}{2em}% 1.55em
    \makeatother
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
}
\setcounter{secnumdepth}{4}  % 目录显示的章节编号深度 (part 对应 -1)
\setcounter{tocdepth}{2}     % 目录深度 (part 对应 -1)

%% 英文目录
\newcommand\enchapter[1]{\addcontentsline{etoc}{chapter}{\protect\numberline{Chapter \thechapter}#1}}
\newcommand\ensection[1]{\addcontentsline{etoc}{section}{\protect\numberline{\thesection}#1}}
\newcommand\ensubsection[1]{\addcontentsline{etoc}{subsection}{\protect\numberline{\thesubsection}#1}}
\newcommand\ensubsubsection[1]{\addcontentsline{etoc}{subsubsection}{\protect\numberline{\thesubsubsection}#1}}

\newcommand\entableofcontents{
    \if@twocolumn
    \@restonecoltrue\onecolumn
    \else
    \@restonecolfalse
    \fi
    \chapter*{\encontentsname}
    \thispagestyle{xmu@headings}
    \@mkboth{\encontentsname}{\encontentsname}%
    \pdfbookmark[0]{英文目录}{english_contents}
    \makeatletter
    \renewcommand{\@pnumwidth}{2em}% 1.55em
    \makeatother
    \@starttoc{etoc}%
    \if@restonecol\twocolumn\fi
}

%% 参考文献环境
\renewenvironment{thebibliography}[1]{
    \zihao{5}
    \chapter*{\bibname}
    \addcontentsline{etoc}{chapter}{\xmu@label@enreference}
    \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
    \addcontentsline{toc}{chapter}{\xmu@label@reference}
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \setlength{\parsep}{1mm}
        \setlength{\labelsep}{0.5em}
        \setlength{\itemsep}{0.05pc}
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

%% 论文发表情况
\newenvironment{publications}[1]{
    \chapter*{\xmu@label@publications}
    \addcontentsline{toc}{chapter}{\xmu@label@publications}
    \addcontentsline{etoc}{chapter}{\xmu@label@enpublications}
    \@mkboth{\MakeUppercase\xmu@label@publications}
    {\MakeUppercase\xmu@label@publications}%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \setlength{\parsep}{1mm}
        \setlength{\labelsep}{0.5em}
        \setlength{\itemsep}{0.05pc}
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

%% 项目参与情况
\newenvironment{projects}[1]{
    \chapter{\xmu@label@projects}%
    \addcontentsline{etoc}{chapter}{\xmu@label@enprojects}
    \@mkboth{\MakeUppercase\xmu@label@projects}
    {\MakeUppercase\xmu@label@projects}%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
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
    {\@latex@warning{Empty `projects' environment}}%
    \endlist}

%% 致谢
\newenvironment{acknowledgements}{
    \cleardoublepage
    \chapter*{\xmu@label@acknowledgements}
    \markboth{\xmu@label@compactacknowledgements}{\xmu@label@compactacknowledgements} % 页眉
    \addcontentsline{toc}{chapter}{\xmu@label@compactacknowledgements}
    \addcontentsline{etoc}{chapter}{\xmu@label@enacknowledgements}
    \songti
}

%% 缩写汇总
\newenvironment{abbreviations}[1][2.5cm]{
    \cleardoublepage
    \chapter{\xmu@label@abbreviations} % no tocline
    \addcontentsline{etoc}{chapter}{\xmu@label@enabbreviations}
    \thispagestyle{xmu@headings}
    \noindent\begin{list}{}%
        {\vskip-30bp\zihao{-4}
            \renewcommand\makelabel[1]{##1\hfil}
            \setlength{\labelwidth}{#1} % 标签盒子宽度
            \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
            \setlength{\itemindent}{0cm} % 标签缩进量
            \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
            \setlength{\rightmargin}{0cm}
            \setlength{\parsep}{0cm} % 段落间距
            \setlength{\itemsep}{0cm} % 标签间距
            \setlength{\listparindent}{0cm} % 段落缩进量
            \setlength{\topsep}{0pt} % 标签与上文的间距
    }}{\end{list}}

%% 符号
\newenvironment{notations}[1][2.5cm]{
    \cleardoublepage
    \chapter{\xmu@label@notations} % no tocline
    \addcontentsline{etoc}{chapter}{\xmu@label@ennotations}
    \thispagestyle{plain}
    \noindent\begin{list}{}%
        {\vskip-30bp\zihao{-4}
            \renewcommand\makelabel[1]{##1\hfil}
            \setlength{\labelwidth}{#1} % 标签盒子宽度
            \setlength{\labelsep}{0.5cm} % 标签与列表文本距离
            \setlength{\itemindent}{0cm} % 标签缩进量
            \setlength{\leftmargin}{\labelwidth+\labelsep} % 左边界
            \setlength{\rightmargin}{0cm}
            \setlength{\parsep}{0cm} % 段落间距
            \setlength{\itemsep}{0cm} % 标签间距
            \setlength{\listparindent}{0cm} % 段落缩进量
            \setlength{\topsep}{0pt} % 标签与上文的间距
    }}{\end{list}}

% 图索引
\newcommand\makelistoffigures{
    \cleardoublepage
    \makeatletter
    \renewcommand{\@pnumwidth}{1.55em}% 1.55em
    \makeatother
    \listoffigures
    \addcontentsline{toc}{chapter}{\listfigurename}
    \addcontentsline{etoc}{chapter}{\xmu@label@enlistoffigures}
    \thispagestyle{xmu@headings}
    \@mkboth{\listfigurename}{\listfigurename}%
}

% 表索引
\newcommand\makelistoftables{
    \cleardoublepage
    \makeatletter
    \renewcommand{\@pnumwidth}{1.55em}% 1.55em
    \makeatother
    \listoftables
    \addcontentsline{toc}{chapter}{\listtablename}
    \addcontentsline{etoc}{chapter}{\xmu@label@enlistoftables}
    \thispagestyle{xmu@headings}
    \@mkboth{\listtablename}{\listtablename}%
}

%% 单位宏包
\RequirePackage[version=4]{mhchem}
\RequirePackage{siunitx}

%% 附录编号样式
\newcommand\setappendixnumberformat{
    \renewcommand\theequation{\Alph{chapter}--\arabic{equation}}  % 附录中编号形式是"A-1"的样子
    \renewcommand\thefigure{\Alph{chapter}--\arabic{figure}}
    \renewcommand\thetable{\Alph{chapter}--\arabic{table}}
}

\endinput
