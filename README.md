# What is besti_master_thesis_LaTeX?

besti_master_thesis_LaTeX is an *unofficial* XeLaTeX template for preparing master thesis in BESTI.

# 北京电子科技学院学位论文LaTex模板

本模板根据北京电子科技学院研究生院发布的word模版修改而成，旨在帮助北京电子科技学院的毕业生高效地完成毕业论文的写作，综合西安电子科技大学和成电的学位论文LaTeX模版，并满足其规定的格式要求。模板采用UTF-8编码，支持Linux和Windows TeX Live。

由于旧版本模板跟学校最新的模板相比有些许不同，对一些不熟悉LATEX的同学来说修改有些困难，故做出以下修正，使之与学校最新（截至2019年6月）的模板同步。

***声明：参考模版:：https://github.com/103yiran/XDUthesis_xelatex ***


## 如何使用

* 本模板的默认封面为工学硕士封面。

* 论文和作者的相关信息可在BESTIthesis.cfg文件中进行修改。

* 参考文献在./bib/tex.bib文件中录入。百度学术和谷歌学术均支持BibTeX格式导出，但其中夹杂很多不规范的条目，应注意进行检查。


## 系统需求

本模板需要使用 XeTeX 引擎编译。Linux下编译时需首先配置windows系统中提供的SimSun和SimHei字体。模板验证无问题的平台为Windows下的TeX Live 2020。

## 已知问题
使用XeTeX时，AutoFakeBold选项导致复制乱码。模板中在`\begin{document}`后插入一个日文的空格'　'，使得除章节一级标题外其他内容可复制。

## 查重问题
本模板生成的PDF在知网查重符合学校标准，不会产生乱码。如若出现任何查重问题，本人概不负责。

## 技术交流

邮件联系《[xcharles@foxmail.com](mailto:xcharles@foxmail.com)》



