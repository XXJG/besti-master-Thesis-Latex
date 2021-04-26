# ThesisBESTI-北京电子科技学院毕业论文LaTeX模板
此项目提供用于排版北京电子科技学院毕业论文的LaTeX模板类，旨在帮助北京电子科技学院的毕业生高效地完成毕业论文的写作。模板提供各种方便的命令，自动化地排版论文的各个部分，使毕业论文轻易地满足学校的格式要求。此项目是基于[成电的毕业论文LaTeX模板](https://gitea.com/Xmagus/ThesisUESTC)和北京电子科技学院的Word模板改动编写而来。

模板由北京电子科技学院网络空间安全专业2019级硕士研究生解建国编写，祝愿此项目能继续发展，解决各位同学毕业论文写作中的困难。此项目并未完全遵循北京电子科技学院的专业硕士的Word模板，相关改动是否合规学术型硕士毕业论文仍然有待研究生部和学院考量。

## 使用方法

### 基本环境
使用模板需要系统安装任意一种TeX环境，如[TeXLive](http://mirror.ctan.org/systems/texlive/Images/)、[MacTeX](https://www.tug.org/mactex/mactex-download.html)和[MiKTeX](https://miktex.org/download)（都自动带有XeLaTeX引擎，但是不推荐CTeX），安装有 SimSun 和 SimHei 字体（其实就是宋体和黑体）以及 Times New Roman 英文字体。在 MacOS 系统下编译会自动识别操作系统，使用 Songti SC 和 STHeiti 字体，但需要启用`--shell-escape`编译选项。

模板采用LaTeX类的形式封装，导入模板只需要把`thesis-besti.cls`文件放在文档所在目录，在文档开头使用`\documentclass{thesis-besti}`命令将文档的类设置成`thesis-besti`即可。使用BibTeX录入参考文献还需要`thesis-besti.bst`风格定义文件。

模板类有bachelor、master、promaster、doctor和engdoctor五个学位选项，对应本科、硕士、专业硕士、博士和工程博士的毕业论文，默认选项为`master`。文档内容的书写参考范例`main.tex`。

### 文档编译
编译文档请使用XeLaTeX引擎。模版提供latexmk设置文件用于自动编译。将命令行工作目录切换到项目文件夹下，执行
```bash
latexmk main.tex
```
命令即可自动调用相关程序进行编译，处理各种文件依赖并自动预览。执行`latexmk -c`命令清理所有缓存文件。

手动编译的话执行
```bash
xelatex main.tex
```
命令即可，若文档内部有交叉引用或录入参考文献则需要编译两次。

使用BibTeX录入参考文献需要先运行一次xelatex，运行一次bibtex，再运行两次xelatex。使用BibTeX录入攻读学位期间的研究成果的情况下还需要额外运行一次`bibtex accomplish.aux`。所以完整地编译包含两个BibTeX文献列表（一个是参考文献，一个是攻读学位期间的研究成果）的文档需要按顺序运行以下命令：

```bash
xelatex main.tex
bibtex main.aux
bibtex accomplish.aux
xelatex main.tex
xelatex main.tex
```

## 论文写作指南

### 论文封面

论文封面和扉页由`\makecover`命令添加，可以显示论文题目，作者，指导老师等。独创性声明可以由`\originalitydeclaration`命令生成。

封面显示的信息可以使用一系列命令进行设置，包括标题、作者、学院等：

此外可以用`\setdate`命令设置扉页所显示的日期。

### 中英文摘要

中英文摘要应包含在`chineseabstract`和`englishabstract`环境中，对应的关键字使用`\chinesekeyword`和`\englishkeyword`命令添加，并包含在相应的环境中。模板自动设置页眉和页脚，其中中文摘要标题中间空一格，页眉不空格。

### 论文目录

论文目录由命令`\thesistableofcontents`添加，并且自动处理标题，页眉以及缩进等问题。

### 论文主体

论文主体的写作参考一般的LaTeX教程，可以自由添加章节，章节内添加所需要的内容，分小节，插入公式、表格和图片。

### 致谢

致谢部分实际上是一个无编号的章节。

### 作者简介

作者简介部分实际上是一个无编号的章节。

### 参考文献

使用BibTeX录入参考文献由`\thesisbibliography`命令导入`*.bib`文件数据库，参考文献风格自动设置为`thesis-besti`。当参考文献数目超过100时，可以使用`large`选项调整编号的宽度，如`\thesisbibliography[large]{reference}`。

在这个命令之前使用`\nocite{*}`命令会在文档中列出数据库中的所有条目，无论是否引用，其他情况下只列出引用过的条目。有些编辑器会识别`\bibliography`命令导入的数据库文件，并提供更好的编辑支持，所以模板也支持原生的`\bibliography`命令导入文献列表，只需要导入之前指定参考文献风格（`\bibliographystyle{thesis-uestc}`）即可。

参考文献的在文中的引用分两种：在原文中作句法成分的为直接引用，使用`\cite`命令，否则为`\citing`命令，在文中文献编号显示为上标。

模版支持所有常用的条目类型，文献条目处理兼容 Google Scholar, IEEE Xplore 和 ScienceDirect 的引用格式，还有其他主流的数据库。获得参考文献条目信息，只需要在对应的文章页面点击下载引用的按钮（Google Scholar 为文献条目下方第二个显示为双引号的按钮；在 IEEE Xplore 中是文章标题下方的 Cite This 按钮；在 ScienceDirect 中为文章标题上面的 Export 链接），选择BibTeX格式，将文本复制到 bib 文件即可。

当引用中文文献，而文献作者超过三位时，后面的作者想使用“等”字省略，可以在文章条目添加语言选项`language = {zh}`。模版会自动按照中文的习惯处理作者信息。

### 附录

附录部分由命令`\thesisappendix`开始。考虑附录是放在最后还是放在哪里？如果只需要单独一个附录则使用`\thesissingleappendix`命令，在后面添加小节，附录本身没有编号。

### 攻读学位期间取得的成果

使用BibTeX录入研究成果由`\thesisaccomplish`命令导入`*.bib`文献列表，方法与参考文献相同。文献列表风格自动设置为`thesis-besti`。此命令没有可选参数，自动在文档中列出数据库中的所有条目。在编译过程中需要注意所使用的编译方式正确执行`bibtex accomplish.aux`命令，否则不会生成研究成果。

手动添加使用`\bibitem`命令将文章条目列在`thesistheaccomplish`环境下，方法与参考文献相同，这种方法优势在于可以在条目间加小标题区分项目或论文成果。

### 插入图片和表格

插入图片使用`figure`环境，自动调整图片前后的间距，添加子图则使用`\subfloat`命令。若子图过多需要跨页则在间断处插入`\floatcontinue`命令。插入表格使用`table`环境，自动调整表格前后的间距和默认的字体大小。

### 定理环境

数学定理请使用模板提供的定义（definition）、公理（axiom）、证明（proof）、定理（theorem）、推论（corollary）、命题（proposition）、引理（lemma）和例子（example）环境。

### 算法描述

算法描述使用`algorithm`环境，模板类自动加载`algorithm2e`宏包，详细的用法请参考[algorithm2e宏包文档](https://www.ctan.org/pkg/algorithm2e)。

### 枚举环境和脚注

枚举使用标准的`enumerate`、`itemize`以及`description`环境。脚注使用标准的`\footnote`命令插入。

### 其他命令
模版提供一些有用的命令方便论文写作，其中包含一些常见的汉语字符：

| 命令名称 | 字符 | Unicode 编号|
|---|---|---|
|\chinesecolon| ： | FF1A |
|\chinesespace|    | 3000 |
|\chineseperiod| 。| 3002 |
|\chinesequestion| ？  | FF1F |
|\chineseexclamation| ！  | FF01 |
|\chinesecomma| ，  | FF0C |
|\chinesesemicolon|  ； | FF1B |
|\chineseleftparenthesis|（ | FF08 |
|\chineserightparenthesis| ）| FF09 |

另外`\blankpage`命令可以强制生成一页空白。

### 图表目录和缩略词

图目录、表目录分别对应`\thesisfigurelist`和`\thesistablelist`命令，出现在目录中。

缩略词表使用`glossaries`宏包实现。生成缩略词表需要在文档导言区加入`\makeglossaries`命令，再在缩略词表显示的位置使用`\thesisglossarylist`命令。定义缩略词使用`\newglossaryentry{<label>}{<description>}`命令，例如：
```latex
\newglossaryentry{Linux}
{
  name=Linux,
  description={is a generic term referring to the family of Unix-like
    computer operating systems that use the Linux kernel},
  plural=Linuces
}
```

或者`\newacronym[description=<chinese>]{<label>}{<abbrv>}{<full>}`命令，例如：
```latex
\newacronym[description=逻辑卷管理器]{lvm}{LVM}{Logical Volume Manager}
```

只有在正文使用命令恰当引用的缩略词才会在缩略词表中列出。正文中引用缩略词时，使用`glossaries`宏包提供的`\gls`、`\Gls`（首字母大写）或`\glspl`（复数形式）等命令引用缩略词的`<label>`。
具体使用方法参考[glossaries宏包文档](https://www.ctan.org/tex-archive/macros/latex/contrib/glossaries/)。

若想在缩略词表中列出所有定义过的条目，无论在正文中是否引用，可以在`\thesisglossarylist`之前使用`\glsaddall`命令。

手动编译包含有缩略词表的文档，执行`xelatex`编译命令后需要执行`makeglossaries main`（注意没有.tex后缀）创建缩略词索引，再执行`xelatex`命令完成编译。所以手动编译一个包含参考文献、研究成果、缩略词表的完整文档命令为：
```bash
xelatex main.tex
bibtex main.aux
bibtex accomplish.aux
makeglossaries main
xelatex main.tex
xelatex main.tex
```
推荐使用latexmk命令进行编译，自动处理以上的问题。

## 常见问题

### 为何论文编译没有生成攻读学位期间所取得的成果？
模版推荐使用latexmk的方式编译。很多编辑器有自己的编译选项，标明使用xelatex方式进行编译的，使用之后没有生成攻读学位期间所取得的成果。这种情况是编译过程中漏掉`bibtex accomplish.aux`命令，在各类编辑器中相当普遍。推荐无论是命令行还是编辑器都明确指定latexmk的编译方式。

### 生成的文档是否可以直接提交查重？
仅以学校认可的标准的知网查重平台来讲，模版生成的PDF文档不需要任何改动就可以提交查重，不会误把页眉、参考文献等当作正文进行审查。



## 技术交流

邮件联系《xcharles@foxmail.com》
# besti-master-Thesis-Latex
