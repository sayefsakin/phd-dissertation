\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{u_template}[2023/11/16 University of Utah LuaLaTeX Template Class]
% Created by Thomas Kelkel | thomaskelkel.de



% START OF USER INTERFACE

% General Settings

\newcommand*{\customfontsize}{12pt}
\newcommand*{\linespacing}{2} % spacing (factor) between lines; "2" for double spacing
\newcommand*{\indentation}{2em} % paragraph indentation
\newcommand*{\israggedbottom}{true} % flushbottom when false
\newcommand*{\israggedright}{true} % justified when false
\newcommand*{\numberingtolevel}{9} % number of subheading levels that get numbered
\newcommand*{\toctolevel}{1} % number of subheading levels that show up in the table of contents (toc)

% Page Layout

\newcommand*{\custompagewidth}{8.5in}
\newcommand*{\custompageheight}{11in}
\newcommand*{\margintop}{1in}
\newcommand*{\marginbottom}{1in}
\newcommand*{\marginleft}{1.25in}
\newcommand*{\marginright}{1.25in}

% Spacing

\newcommand*{\chapterabove}{1in}
\newcommand*{\chapterinner}{0.5in}
\newcommand*{\chapterbelow}{0.5in}
\newcommand*{\sectionabove}{0.5in}
\newcommand*{\parlevelafter}{1em} % horizontal spacing after a paragraph-level subheading
\newcommand*{\chapternumberwidthintoc}{1.6em} % width of the horizontal box in the toc that contains the chapter number
\newcommand*{\sectionindentintoc}{\chapternumberwidthintoc} % width of the indentation of subheadings in the toc

% Preliminary Pages

\newcommand*{\titlepageverticalspace}{0.85in}
\newcommand*{\approvalpagelargespace}{0.75in}
\newcommand*{\approvalpagesmallspace}{0.45in}
\newcommand*{\approvalpagespaceafterlist}{0.5in}
\newcommand*{\approvalpageheadingfontsize}{14pt}
\newcommand*{\dateapprovedlabelfontsize}{6.5pt}

% Bibliography

\newcommand*{\usebiblatex}{true} % select "true" or "false"
\newcommand*{\usebibstyle}{ieee}
% \newcommand*{\bibfile}{bibfiles} % name of the ".bib" file
\newcommand*{\bibfile}{main} % name of the ".bib" file

% Subfolders

\newcommand*{\fontfolder}{./fonts/}
\newcommand*{\imagefolder}{./images/}

% END OF USER INTERFACE



% CONTENTS OF THIS FILE

%   1) General Settings and Calculations
%   2) Loading of Packages
%   3) Table of Contents
%   4) Sectioning
%   5) Block Quotes
%   6) Lists
%   7) Equations
%   8) Figures and Tables
%   9) Insertion of Articles
%  10) Landscape Pages
%  11) Document Initialization



% 1) GENERAL SETTINGS AND CALCULATIONS

\LoadClass[
    fontsize=\customfontsize,%
    listof=totoc,%
    bibliography=totoc,%
    numbers=noenddot,%
    captions=tableheading,%
    overfullrule,%
    headings=optiontotoc,%
    toc=nonumberline,%
    parskip=never,%
    chapterprefix=true
]{scrbook}

\directlua{require ( "lua_code.lua" )} % lua code for advanced functionalities

\def\true{true}

\ifx\true\israggedright
    \raggedright
\else
\fi

\ifx\true\israggedbottom
    \raggedbottom
\else
    \flushbottom
\fi

\newlength{\halfmargintop}
\setlength{\halfmargintop}{.5\margintop}
\newlength{\halfmarginleft}
\setlength{\halfmarginleft}{\directlua{u_template_get_ratio ( "\marginleft", "\margintop" )}\halfmargintop}

\linespread{\linespacing}
\newcommand*{\lsaddition}{%
    \directlua{tex.sprint ( ( \linespacing - 1 ) / \linespacing )}
}

\parindent=\indentation

\setcounter{secnumdepth}{\numberingtolevel}
\setcounter{tocdepth}{\toctolevel}



% 2) LOADING OF PACKAGES

\RequirePackage{verbatim} % for "comment" environments

\RequirePackage{expl3} % for ExplSyntax

\RequirePackage[table]{xcolor} % for color
\newcommand*{\notablecolors}{}
\newcommand*{\tablecolors}{\rowcolors{1}{black!50!white!50}{black!0!white!100}} % for alternating background color in tables

\RequirePackage{graphicx} % for images
\graphicspath{\imagefolder} % set image folder

\RequirePackage{pdfpages} % for inserting external pdf files

\RequirePackage[defaultlines=2,all]{nowidow}

\RequirePackage{luatexbase} % for compatibility

\RequirePackage{luacode} % for lua code blocks

\RequirePackage{unicode-math}

\RequirePackage{fontspec} % for loading fonts

\setmainfont[%
    Path=\fontfolder,%
    Ligatures = {Common, TeX},%
    ItalicFont = Domitian-Italic.otf,%
    BoldFont = Domitian-Bold.otf,%
    BoldItalicFont = Domitian-BoldItalic.otf,%
]{Domitian-Roman.otf} % Palatino clone

\setmathfont[%
    Path=\fontfolder,%
]{Asana-Math.otf}

\RequirePackage{babel} % for language support
\babeltags{lt=latin,gr=ancientgreek,fr=french,nde=ngerman} % only relevant for justified text; sets hyphenation rules for foreign languages; e. g. "\textlt{some text in latin}"; see babel documentation for further information

\RequirePackage{realscripts} % for real (open type) super- and subscripts

\RequirePackage[% for setting page layout
    papersize={\custompagewidth,\custompageheight},%
    layoutsize={\custompagewidth,\custompageheight},%
    twoside=false,%
    left=\marginleft,%
    right=\marginright,%
    top=\margintop,%
    bottom=\marginbottom,%
    headsep=\dimexpr\halfmargintop - \customfontsize\relax,%
    footskip=\halfmargintop,%
]{geometry}

\RequirePackage{ifthen} % for if then macros

\RequirePackage{indentfirst} % for indentation of first paragraph of a section

\RequirePackage{enumitem} % for custom lists

\RequirePackage{chngcntr} % for changing counters

\RequirePackage{lua-ul} % for breakable underlining

\RequirePackage{setspaceenhanced} % for changing lineheight within the document

\RequirePackage{flafter} % for float placement after definition

\RequirePackage{longtable} % for multi-page tables

\RequirePackage{hyperref} % for PDF toc and links
\hypersetup{%
    pdflang=en-US,%
    unicode=true,%
	pdfborder={0 0 0},%
	bookmarksopen=true,%
    bookmarksopenlevel=0,%
	bookmarksnumbered=true,%
    linktoc=all,%
}

\RequirePackage{bookmark} % for bookmark functionalities

\RequirePackage[singlespacing=true,autoenlargeheadfoot=true]{scrlayer-scrpage} % for page header and footer formatting

\RequirePackage{csquotes}

\ifx\true\usebiblatex
    \RequirePackage[backend=biber,style=\usebibstyle,maxnames=99,maxalphanames=99,sorting=anyt,backref=false,url=true]{biblatex}
    \bibliography{\bibfile}
\else
    \bibliographystyle{\usebibstyle}
\fi

\RequirePackage{subcaption}

% 3) TABLE OF CONTENTS

\addto\captionsamerican{%
    \renewcommand{\contentsname}{TABLE OF CONTENTS}%
}

\AfterTOCHead[toc]{\addvspace{\chapterbelow}}

\newlength{\tnwchapter}
\newlength{\tnwsection}
\newlength{\tichapter}
\newlength{\tisection}

\setlength{\tnwchapter}{\chapternumberwidthintoc}
\setlength{\tnwsection}{\tnwchapter}
\addtolength{\tnwsection}{1em}

\setlength{\tichapter}{0em}
\setlength{\tisection}{\sectionindentintoc}

\RedeclareSectionCommands[%
    tocraggedentrytext=true,%
    tocpagenumberwidth+=.08em,%
    tocpagenumberformat=\normalfont\normalsize%
]%
{chapter,section,subsection,subsubsection}

\DeclareTOCStyleEntry[linefill]{tocline}{chapter}

\renewcommand*{\addchaptertocentry}[2]{%
    \IfArgIsEmpty{#1}{%
        \addtocentrydefault{chapter}{}{%
            \MakeUppercase{#2}%
        }%
    }{%
        \addtocentrydefault{chapter}{}{%
            \texorpdfstring{\makebox[\tnwchapter][l]}{}{#1}\texorpdfstring{}{ }\MakeUppercase{#2}%
        }%
    }%
}

\RedeclareSectionCommand[%
    tocentryformat=\normalfont\normalsize\singlespacing,%
    toclevel=-1,%
    tocbeforeskip=\lsaddition\baselineskip,%
    tocpagenumberbox=\@gobble,%
    tocpagenumberwidth=0pt%
]%
{part}

\RedeclareSectionCommand[%
    tocentryformat=\normalfont\normalsize\singlespacing,%
    tocindent=\tichapter,%
    tocnumwidth=\tnwchapter,%
    toclevel=0,%
    tocbeforeskip=\lsaddition\baselineskip%
]%
{chapter}

\RedeclareSectionCommand[%
    tocentryformat=\singlespacing,%
    tocindent=\tisection,%
    tocnumwidth=\tnwsection,%
    toclevel=1,%
    tocbeforeskip=.1\baselineskip,%
    toconstarthigherlevel=\vspace{\dimexpr\lsaddition\baselineskip - .2\baselineskip\relax},%
]%
{section}

\DeclareTOCStyleEntries[%
    raggedentrytext=true,%
    pagenumberwidth+=.08em,%
    pagenumberformat=\normalfont\normalsize,%
    entryformat=\normalfont\normalsize\singlespacing,%
    indent=\tichapter,%
    numwidth=\tnwsection,%
    level=0,%
    beforeskip=\lsaddition\baselineskip%
]{tocline}{figure,table}



% 4) SECTIONING

% General Settings

\renewcommand*{\chapterpagestyle}{empty} % no visible page number on chapter page
\renewcommand*{\raggedsection}{\centering} % center headings

% Spacing

\newcommand*{\chapterbs}{-\chapterabove}
\newcommand*{\chapteris}{\dimexpr \chapterinner - \lsaddition\baselineskip\relax}
\newcommand*{\chapteras}{\dimexpr \chapterbelow - \lsaddition\baselineskip\relax}
\newcommand*{\sectionbs}{\dimexpr -\sectionabove + \lsaddition\baselineskip\relax}
\newcommand*{\sectionas}{.05\baselineskip}
\newcommand*{\sectionulas}{.2\baselineskip} % additional spacing to compensate for underlining
\newcommand*{\subsectionbs}{\sectionbs}
\newcommand*{\subsectionas}{\sectionas}
\newcommand*{\subsubsectionbs}{\sectionbs}
\newcommand*{\subsubsectionas}{\sectionulas}

% Cloning Macros for New Sectioning Commands

\newcommand*{\sectionclone}{%
    style=section,%
    tocstyle=section,%
    font=\normalsize,%
    afterskip=\sectionas,%
    beforeskip=\sectionbs,%
    level=1,%
    toclevel=1,%
    tocindent=\tisection,%
    tocnumwidth=\tnwsection,%
    tocraggedentrytext=true,%
    counterwithin=chapter%
}

\newcommand*{\paragraphclone}{%
    style=section,%
    tocstyle=section,%
    font=\normalsize,%
    afterskip=-\parlevelafter,%
    beforeskip=.0001pt,%
    level=4,%
    toclevel=4,%
    tocindent=\tisection,%
    tocnumwidth=\tnwsection,%
    tocraggedentrytext=true,%
    counterwithin=subsubsection%
}

% Declaring New Sectioning Commands

\DeclareNewSectionCommand[\sectionclone]{levelfoursubheading}
\DeclareNewSectionCommand[\sectionclone]{levelfivesubheading}
\DeclareNewSectionCommand[\sectionclone]{levelsixsubheading}

\DeclareNewSectionCommand[\paragraphclone]{levelsevensubheading}
\DeclareNewSectionCommand[\paragraphclone]{leveleightsubheading}
\DeclareNewSectionCommand[\paragraphclone]{levelninesubheading}

% Format Chapter Heading

\renewcommand*{\chapterformat}{%
    \normalfont%
    \chapapp%
    \space%
    \thechapter%
}

\RedeclareSectionCommand[%
    font=\normalsize\normalfont,%
    beforeskip=\chapterbs,%
    innerskip=\chapteris,%
    afterskip=\chapteras,%
]%
{chapter}

\renewcommand*{\chapterlinesformat}[3]{%
    \MakeUppercase{#3}
}

\renewcommand*{\chapterlineswithprefixformat}[3]{%
    \MakeUppercase{#2#3}
}

% Format Subheadings

\RedeclareSectionCommands[%
    beforeskip=\sectionbs,%
]%
{section,subsection,subsubsection,levelfoursubheading,levelfivesubheading,levelsixsubheading}

\RedeclareSectionCommands[%
    afterskip=\sectionulas,%
]%
{section,subsubsection,levelfoursubheading,levelsixsubheading}

\RedeclareSectionCommands[%
    afterskip=\sectionas,%
]%
{subsection,levelfivesubheading}

\RedeclareSectionCommands[%
    font=\normalsize\normalfont\bfseries,%
]%
{section,subsection,levelfoursubheading,levelfivesubheading,levelsevensubheading,leveleightsubheading}

\RedeclareSectionCommand[%
    font=\normalsize\normalfont,%
]%
{subsubsection}

\RedeclareSectionCommands[%
    font=\normalsize\normalfont\raggedright\bfseries,%
]%
{levelfoursubheading,levelfivesubheading}

\RedeclareSectionCommands[%
    font=\normalsize\normalfont\bfseries,%
]%
{levelsevensubheading,leveleightsubheading}

\RedeclareSectionCommand[%
    font=\normalsize\normalfont\raggedright,%
]%
{levelsixsubheading}

\RedeclareSectionCommand[%
    font=\normalsize\normalfont,%
]%
{levelninesubheading}

% Underlining

\NewCommandCopy{\originalsectionlinesformat}{\sectionlinesformat}
\renewcommand*{\sectionlinesformat}[4]{%
    \originalsectionlinesformat{#1}{#2}{}{%
        \Ifstr{#1}{section}{\underLine{#3#4}}{%
            \Ifstr{#1}{subsubsection}{\underLine{#3#4}}{%
                \Ifstr{#1}{levelfoursubheading}{\underLine{#3#4}}{%
                    \Ifstr{#1}{levelsixsubheading}{\underLine{#3#4}}{%
                        #3#4%
                    }%
                }%
            }%
        }%
    }%
}%

\NewCommandCopy{\originalsectioncatchphraseformat}{\sectioncatchphraseformat}
\renewcommand*{\sectioncatchphraseformat}[4]{%
    \originalsectioncatchphraseformat{#1}{#2}{\hspace*{\indentation}}{%
        \Ifstr{#1}{levelsevensubheading}{\underLine{\setbox0=\hbox{#3\unskip}\ifdim\wd0=0pt\else#3\unskip{}.\enskip{}\fi#4.}}{%
            \Ifstr{#1}{levelninesubheading}{\underLine{\setbox0=\hbox{#3\unskip}\ifdim\wd0=0pt\else#3\unskip{}.\enskip{}\fi#4.}}{%
                \setbox0=\hbox{#3\unskip}\ifdim\wd0=0pt\else#3\unskip{}.\enskip{}\fi#4.%
            }%
        }%
    }%
}%

% Setting Up Levels of New Sectioning Commands

\RedeclareSectionCommand[%
    level=4,%
    toclevel=4,%
    counterwithin=subsubsection%
]%
{levelfoursubheading}

\RedeclareSectionCommand[%
    level=5,%
    toclevel=5,%
    counterwithin=levelfoursubheading%
]%
{levelfivesubheading}

\RedeclareSectionCommand[%
    level=6,%
    toclevel=6,%
    counterwithin=levelfivesubheading%
]%
{levelsixsubheading}

\RedeclareSectionCommand[%
    level=7,%
    toclevel=7,%
    counterwithin=levelsixsubheading%
]%
{levelsevensubheading}

\RedeclareSectionCommand[%
    level=8,%
    toclevel=8,%
    counterwithin=levelsevensubheading%
]%
{leveleightsubheading}

\RedeclareSectionCommand[%
    level=9,%
    toclevel=9,%
    counterwithin=leveleightsubheading%
]%
{levelninesubheading}

% Appendix

\def\nopartappendix{true}

\newcommand*{\appendixaschapter}{}

\newcommand*{\appendixaspart}{%
    \def\nopartappendix{false}
}

\edef\appendixnum{\directlua{u_template_get_number_of ("appendix")}}

\newcounter{currentchapnum}

\NewCommandCopy{\originalappendix}{\appendix}
\renewcommand*{\appendix}{%
    \ifx\true\nopartappendix
    \else
        \RedeclareSectionCommand[%
            style=part,%
            font=\normalfont\MakeUppercase,%
            beforeskip=-3.5in,%
            %prefixfont=\normalfont\MakeUppercase%
            ]%
        {chapter}
    \fi
    \KOMAoptions{chapterprefix=true}
    \renewcommand*{\chapterformat}{%
        \normalfont%
        \chapapp%
        \space%
        \thechapter%
    }
    \renewcommand*{\addchaptertocentry}[2]{%
        \IfArgIsEmpty{##1}{%
            \addtocentrydefault{chapter}{}{%
                \MakeUppercase{##2}%
            }%
        }{%
            \addtocentrydefault{chapter}{}{%
                \texorpdfstring{\makebox[\tnwchapter][l]}{}{##1}\texorpdfstring{}{ }\MakeUppercase{##2}%
            }%
        }%
    }
    \ifx\true\appendixnum
        \bookmarksetup{startatroot}
        \renewcommand*{\chapterformat}{%
            \normalfont%
            Appendix%
        }
        \renewcommand*{\addchaptertocentry}[2]{%
            \addtocentrydefault{chapter}{}{%
                \MakeUppercase{Appendix: ##2}%
            }%
        }
    \else
        \clearpage
        \phantomsection
        \addcontentsline{toc}{part}{Appendices}
    \fi
    \renewcommand*{\chapapp}{Appendix}
    \renewcommand*{\addsectiontocentry}[2]{}
    \originalappendix%
}

\providecommand{\printbibliography}{}
\NewCommandCopy{\originalprintbibliography}{\printbibliography}
\renewcommand*{\printbibliography}[1][]{%
    \RedeclareSectionCommand[%
        style=chapter,%
        font=\normalsize\normalfont,%
        beforeskip=\chapterbs,%
    ]%
    {chapter}
    \ifx\true\usebiblatex
        \def\checkbib{heading=subbibnumbered}
        \renewcommand*{\bibsetup}{\ifx#1\checkbib\else\vspace*{.5\baselineskip}\fi\linespread{1}}
        \setlength{\bibitemsep}{.5\baselineskip}
        \originalprintbibliography[#1]
    \else
        \begingroup
            \setstretch{1}
            \bibliography{\bibfile}
        \endgroup
    \fi
}



% 5) BLOCK QUOTES

\renewcommand*{\quote}{%
    \addvspace{\lsaddition\baselineskip}\singlespacing\noindent%
    \begin{addmargin}[\indentation]{0pt}
}%
\renewcommand*{\endquote}{%
    \end{addmargin}
}%

\renewcommand*{\quotation}{%
    \addvspace{\lsaddition\baselineskip}\singlespacing\noindent%
    \begin{addmargin}[\indentation]{0pt}
}%
\renewcommand*{\endquotation}{%
    \end{addmargin}
}%



% 6) LISTS

\setlist{nosep}
\setlength{\labelsep}{.6em}



% 7) EQUATIONS

\AtBeginDocument{%
    \setlength\abovedisplayskip{0pt}%
    \setlength\belowdisplayskip{0pt}%
    \setlength\abovedisplayshortskip{0pt}%
    \setlength\belowdisplayshortskip{0pt}%
}

\newcommand{\removeparbefore}{\ifvmode\vspace*{-\baselineskip}\setlength{\parskip}{0pt}\fi}

\NewCommandCopy{\originalequation}{\equation}
\renewcommand*{\equation}{%
    \removeparbefore\originalequation%
}%

\NewCommandCopy{\originalmath}{\[}
\renewcommand*{\[}{%
    \removeparbefore\originalmath%
}%



% 8) FIGURES AND TABLES

\newcommand*{\tabstretch}{1.5} % vertical stretch factor in tables

\edef\figurenum{\directlua{u_template_get_number_of ("figure")}}
\edef\tablenum{\directlua{u_template_get_number_of ("table")}}

\renewcommand*{\captionformat}{.~}
\addtokomafont{caption}{\raggedright}
\addtokomafont{captionlabel}{\bfseries}

\setlength{\floatsep}{\sectionabove}
\setlength{\textfloatsep}{\sectionabove}
\setlength{\intextsep}{\sectionabove}
\setlength{\abovecaptionskip}{\lsaddition\baselineskip}
\setlength{\belowcaptionskip}{0pt}

\makeatletter
\setlength{\@fpsep}{\floatsep} % default is 8\p@ \@plus 2fil
\makeatother

\newcommand*{\figtab}{}

\newcommand*{\intext}{%
    \renewcommand*{\figtab}{intext}%
}
\newcommand*{\chapterend}{%
    \renewcommand*{\figtab}{chapterend}%
}
\newcommand*{\withouttext}{%
    \renewcommand*{\figtab}{withouttext}%
}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\AtBeginDocument{%
    \def\figtabwithouttext{withouttext}%
    \def\figtabchapterend{chapterend}%
    \ifx\figtab\figtabwithouttext
        \renewcommand*{\floatpagefraction}{0}
    \else
    \fi
    \newcommand*{\addfigure}[4][]{%
        \directlua{u_template_figures = u_template_figures + 1}
        \ifx\figtab\figtabwithouttext
            \begin{figure}[p!]
        \else
            \begin{figure}[btp!]
        \fi
            \centering%
            \ifx&#1&%
                \includegraphics{#2}%
            \else%
                \includegraphics[#1]{#2}%
            \fi%
            \directlua{u_template_make_caption ( "\luatexluaescapestring{#3}" )}%
            \label{#4}
        \end{figure}%
    }
    \newcommand*{\addpagefigure}[4][]{%
        \directlua{u_template_figures = u_template_figures + 1}
        \begin{figure}[p!]
            \directlua{u_template_make_caption ( "\luatexluaescapestring{#3}" )}%
        \end{figure}
        \begin{figure}[p!]
            \centering%
            \ifx&#1&%
                \includegraphics{#2}%
            \else%
                \includegraphics[#1]{#2}%
            \fi%
            \label{#4}
        \end{figure}%
    }
    \newcommand*{\addtable}[5][]{%
        \directlua{u_template_tables = u_template_tables + 1}
        \ifx&#1&%
        \else%
            \stepcounter{rownum}
        \fi%
        \ifx\figtab\figtabwithouttext
            \begin{table}[p!]
        \else
            \begin{table}[btp!]
        \fi
            \centering{}
            \directlua{u_template_make_caption ( "\luatexluaescapestring{#2}" )}%
            \begin{tabular}{#4}
            \directlua{%
                local string = unicode.utf8.gsub ( "\luatexluaescapestring{#5}", "HLINE", "\\hline" )
                string = unicode.utf8.gsub ( string, "BOLD", "\\bfseries" )
                tex.sprint ( string )%
            }
            \end{tabular}
            \label{#3}%
        \end{table}%
    }
    \newcommand*{\addlongtable}[6][]{%
        \directlua{u_template_tables = u_template_tables + 1}
        \ifx&#1&%
        \else%
            \stepcounter{rownum}
        \fi%
        \vspace*{-1.5\baselineskip}
        \linespread{\directlua{tex.sprint ( \linespacing * 0.5 )}}\normalfont
        \begin{longtable}{#4}
            \directlua{u_template_make_caption ( "\luatexluaescapestring{#2}", "\luatexluaescapestring{#3}" )}

            \hline
            \directlua{%
                local string = unicode.utf8.gsub ( "\luatexluaescapestring{#5}", "HLINE", "\\hline" )
                string = unicode.utf8.gsub ( string, "BOLD", "\\bfseries" )
                tex.sprint ( string )%
            }
            \hline
            \endfirsthead

            Table \ref{#3} continued.\\
            \hline
            \directlua{%
                local string = unicode.utf8.gsub ( "\luatexluaescapestring{#5}", "HLINE", "\\hline" )
                string = unicode.utf8.gsub ( string, "BOLD", "\\bfseries" )
                tex.sprint ( string )%
            }
            \hline
            \endhead

            \directlua{%
                local string = unicode.utf8.gsub ( "\luatexluaescapestring{#6}", "HLINE", "\\hline" )
                string = unicode.utf8.gsub ( string, "BOLD", "\\bfseries" )
                tex.sprint ( string )%
            }
        \end{longtable}
        \linespread{\linespacing}\normalfont
    }
    \ifx\figtab\figtabchapterend
        \renewcommand*{\addfigure}[4][]{%
            \directlua{u_template_figures = u_template_figures + 1}
            \ifx&#1&%
                \directlua{u_template_add_figure ( "", "\luatexluaescapestring{#2}", "\luatexluaescapestring{#3}", "\luatexluaescapestring{#4}" )}
            \else%
                \directlua{u_template_add_figure ( "\luatexluaescapestring{#1}", "\luatexluaescapestring{#2}", "\luatexluaescapestring{#3}", "\luatexluaescapestring{#4}" )}
            \fi%
        }
        \renewcommand*{\addpagefigure}[4][]{%
            \directlua{u_template_figures = u_template_figures + 1}
            \ifx&#1&%
                \directlua{u_template_add_figure ( "", "\luatexluaescapestring{#2}", "\luatexluaescapestring{#3}", "\luatexluaescapestring{#4}", true )}
            \else%
                \directlua{u_template_add_figure ( "\luatexluaescapestring{#1}", "\luatexluaescapestring{#2}", "\luatexluaescapestring{#3}", "\luatexluaescapestring{#4}", true )}
            \fi%
        }
        \renewcommand*{\addtable}[5][]{%
            \directlua{u_template_tables = u_template_tables + 1}
            \directlua{u_template_add_table ( "\luatexluaescapestring{#2}", "\luatexluaescapestring{#3}", "\luatexluaescapestring{#4}", "\luatexluaescapestring{#5}", "\luatexluaescapestring{#1}" )}
        }
        \renewcommand*{\addlongtable}[6][]{%
            \directlua{u_template_tables = u_template_tables + 1}
            \directlua{u_template_add_table ( "\luatexluaescapestring{#2}", "\luatexluaescapestring{#3}", "\luatexluaescapestring{#4}", "\luatexluaescapestring{#6}", "\luatexluaescapestring{#1}", "\luatexluaescapestring{#5}" )}
        }
    \else
    \fi
}



% 9) INSERTION OF ARTICLES

\newcommand*{\articleaschapter}[5][]{%
    \chapter{#2}%
    {%
        \vspace{\lsaddition\baselineskip}%
        \singlespacing%
        \parindent=-\indentation
        \begin{addmargin}[\indentation]{0pt}
        \hspace*{-\indentation}%
        #4\par%
        \end{addmargin}
        \parindent=\indentation
    }%
    \noindent
    #5
    \clearpage%
    \ifx&#1&%
        \includepdf[%
            pages=-,%
            pagecommand={\thispagestyle{scrheadings}},%
            noautoscale,%
            width=\textwidth,%
            height=\textheight,%
            keepaspectratio,%
            frame%
        ]{#3}
    \else%
        \includepdf[%
            pages=-,%
            pagecommand={\thispagestyle{scrheadings}},%
            noautoscale,%
            width=\textwidth,%
            height=\textheight,%
            keepaspectratio,%
            frame,%
            #1%
        ]{#3}
    \fi%
}



% 10) LANDSCAPE PAGES

\newcommand*{\landscapestart}{%
    \clearpage%
    \KOMAoptions{paper=landscape,pagesize}%
    \recalctypearea%
    \newgeometry{
        layoutsize={\custompageheight,\custompagewidth},%
        twoside=false,%
        top=\marginleft,%
        bottom=\marginright,%
        left=\margintop,%
        right=\marginbottom,%
        headsep=\dimexpr\halfmarginleft - \customfontsize\relax,%
        footskip=\halfmarginleft%
    }%
}

\newcommand*{\landscapestop}{
    \clearpage%
    \KOMAoptions{paper=portrait,pagesize}%
    \recalctypearea%
    \restoregeometry%
}



% 11) DOCUMENT INITIALIZATION

\newcommand*{\titletext}{}
\newcommand*{\authortext}{}
\newcommand*{\thesisordiss}{}
\newcommand*{\degree}{}
\newcommand*{\emphasistext}{}
\newcommand*{\monthtext}{}
\newcommand*{\yeartext}{}
\newcommand*{\departmentnametext}{}
\newcommand*{\departmenttext}{}
\newcommand*{\chairtext}{}
\newcommand*{\departmentchairtext}{}
\newcommand*{\nameofdeantext}{}
\newcommand*{\abstracttext}{}
\newcommand*{\acknowledgmentstext}{}
\newcommand*{\prefacetext}{}

\newcommand*{\onechair}{\directlua{u_template_cochairs = false}}
\newcommand*{\cochairs}{\directlua{u_template_cochairs = true}}

\newcommand*{\addcommitteemember}[2]{%
    \directlua{u_template_add_committee_member ( "\luatexluaescapestring{#1}", "\luatexluaescapestring{#2}" )}%
}

\newcommand*{\adddedicationpage}[1]{%
    \directlua{u_template_add_dedication ( "\luatexluaescapestring{#1}" )}%
}

\renewcommand*{\title}[1]{\renewcommand*{\titletext}{#1}}
\renewcommand*{\author}[1]{\renewcommand*{\authortext}{#1}}
\newcommand*{\emphasis}[1]{\renewcommand*{\emphasistext}{#1}}
\renewcommand*{\month}[1]{\renewcommand*{\monthtext}{#1}}
\renewcommand*{\year}[1]{\renewcommand*{\yeartext}{#1}}
\newcommand*{\departmentname}[1]{\renewcommand*{\departmentnametext}{#1}}
\newcommand*{\departmentchair}[1]{\renewcommand*{\departmentchairtext}{#1}}
\newcommand*{\nameofdean}[1]{\renewcommand*{\nameofdeantext}{#1}}
\newcommand*{\abstract}[1]{\renewcommand*{\abstracttext}{#1}}
\newcommand*{\acknowledgments}[1]{\renewcommand*{\acknowledgmentstext}{#1}}
\newcommand*{\preface}[1]{\renewcommand*{\prefacetext}{#1}}

\newcommand*{\thesis}{\renewcommand*{\thesisordiss}{thesis}}
\newcommand*{\diss}{\renewcommand*{\thesisordiss}{dissertation}}
\newcommand*{\phd}{\renewcommand*{\degree}{Doctor of Philosophy}}
\newcommand*{\ms}{\renewcommand*{\degree}{Master of Science}}
\newcommand*{\ma}{\renewcommand*{\degree}{Master of Arts}}
\newcommand*{\may}{\renewcommand*{\monthtext}{May}}
\newcommand*{\august}{\renewcommand*{\monthtext}{August}}
\newcommand*{\december}{\renewcommand*{\monthtext}{December}}
\newcommand*{\department}{\renewcommand*{\departmenttext}{Department}}
\newcommand*{\school}{\renewcommand*{\departmenttext}{School}}
\newcommand*{\college}{\renewcommand*{\departmenttext}{College}}
\newcommand*{\chair}{\renewcommand*{\chairtext}{Chair}}
\newcommand*{\dean}{\renewcommand*{\chairtext}{Dean}}
\newcommand*{\director}{\renewcommand*{\chairtext}{Director}}

\newenvironment{preliminary}{\clearpage\setlength{\topskip}{0pt}%
    \newgeometry{vmargin=0cm,ignoreheadfoot,hmargin=0cm}%
    \thispagestyle{empty}%
    \vspace*{\fill}\nointerlineskip}%
{\vspace*{\fill}\clearpage\restoregeometry}

\newenvironment{dedicationpage}{\clearpage\setlength{\topskip}{0pt}%
    \newgeometry{vmargin=0cm,left=\marginleft,right=\marginright,ignoreheadfoot}%
    \thispagestyle{empty}%
    \vspace*{\fill}\nointerlineskip}%
{\vspace*{\fill}\restoregeometry}

\newenvironment{postpreliminary}{
    \clearpage%
    \newgeometry{top=\margintop,bottom=\marginbottom,left=\marginleft,right=\marginright}%
    \thispagestyle{empty}%
}%
{\restoregeometry}

\newcommand*{\localnumbering}{}

\newcommand*{\nolocalnumbering}{%
    \counterwithout{figure}{chapter}
    \counterwithout{table}{chapter}
    \setcounter{secnumdepth}{0}
    \RedeclareSectionCommand[tocnumwidth=0pt]{section}
    \DeclareTOCStyleEntries[numwidth=\tnwchapter]{tocline}{figure,table}
}

\def\nomainheadings{true}

\newcommand*{\usechapters}{}

\newcommand*{\mainheadings}{%
    \def\nomainheadings{false}
    \KOMAoptions{chapterprefix=false}
}

\newcommand*{\mainheadingsnumbered}{%
    \mainheadings
    \renewcommand*{\chapterformat}{%
        \normalfont%
        \thechapter%
    }
    \renewcommand*{\chapterlinesformat}[3]{%
        ##2\enskip\MakeUppercase{##3}
    }
}

\newcommand*{\mainheadingsunnumbered}{%
    \mainheadings
    \nolocalnumbering
    \renewcommand*{\addchaptertocentry}[2]{%
        \addtocentrydefault{chapter}{}{%
            \MakeUppercase{##2}%
        }%
    }
    \RedeclareSectionCommand[tocnumwidth=0pt]{chapter}
}

\AtBeginDocument{

\renewcommand*{\arraystretch}{\tabstretch} % vertical stretch factor in tables

\frontmatter

\setcounter{page}{0}

\lehead*{}
\cehead*{}
\rehead*{}
\lohead*{}
\cohead*{}
\rohead*{}

\lefoot*{}
\cefoot*{\upshape\thepage}
\refoot*{}
\lofoot*{}
\cofoot*{\upshape\thepage}
\rofoot*{}

\def\none{none}

\begin{preliminary}
    \centering
    \MakeUppercase{\titletext}\par
    \addvspace{\dimexpr\titlepageverticalspace - \lsaddition\baselineskip\relax}
    by\\
    \authortext\par
    \addvspace{\titlepageverticalspace}
    {%
        \singlespacing%
        A \thesisordiss\space{}submitted to the faculty of\\
        The University of Utah\\
        in partial fulfillment of the requirements for the degree of\par%
    }
    \addvspace{\dimexpr\titlepageverticalspace - \lsaddition\baselineskip\relax}
    \degree%
    \ifx\emphasistext\none%
        \par
    \else%
        \setbox0=\hbox{\emphasistext\unskip}%
        \ifdim\wd0=0pt%
            \par
        \else%
            \\in%
            \\\emphasistext\par%
        \fi%
    \fi%
    \addvspace{\dimexpr\titlepageverticalspace - \lsaddition\baselineskip\relax}
    \departmenttext\space{}of \departmentnametext\\
    The University of Utah\\
    \monthtext\space\yeartext\par
\end{preliminary}

\begin{preliminary}
    \centering
    Copyright © \authortext\space\yeartext\\
    All Rights Reserved\par
\end{preliminary}

\newlength{\originaltabcolsep}
\setlength{\originaltabcolsep}{\tabcolsep}
\setlength{\tabcolsep}{0pt}

\begin{preliminary}
    \renewcommand*{\arraystretch}{.5}%
    \rowcolors{1}{black!0!white!100}{black!0!white!100}
    \centering
    {%
        \fontsize{\approvalpageheadingfontsize}{\approvalpageheadingfontsize}\selectfont{}\bfseries{}%
        The University of Utah Graduate School\par%
        \addvspace{\dimexpr\approvalpagelargespace + 2pt - \lsaddition\baselineskip\relax}%
        \MakeUppercase{Statement of \thesisordiss\space{}Approval}\par%
    }%
    \addvspace{\dimexpr\approvalpagelargespace - 2pt - \lsaddition\baselineskip\relax}%
    The \thesisordiss\space{}of \textbf{\underLine{\authortext}}\\%
    has been approved by the following supervisory committee members:\par
    \addvspace{\approvalpagesmallspace}%
    \directlua{u_template_print_committee ()}%
    and by \underLine{\textbf{\departmentchairtext}}\space{}, \chairtext\space{}of\\
    the \departmenttext\space{}of \underLine{\textbf{\departmentnametext}}\\
    and by \underLine{\textbf{\nameofdeantext}}\space{}, Dean of The Graduate School.
    \renewcommand*{\arraystretch}{\tabstretch}%
\end{preliminary}

\setlength{\tabcolsep}{\originaltabcolsep}

\begin{postpreliminary}
    \chapter[nonumber=true]{Abstract}
    \abstracttext
\end{postpreliminary}

\directlua{u_template_print_dedication_pages ()}%

\begin{postpreliminary}
    \tableofcontents
\end{postpreliminary}

\ifx\true\figurenum
    \listoffigures
\else
\fi

\ifx\true\tablenum
    \listoftables
\else
\fi

\ifx\acknowledgmentstext\none%
\else%
    \setbox0=\hbox{\acknowledgmentstext\unskip}%
    \ifdim\wd0=0pt%
    \else%
        \chapter[nonumber=true]{Acknowledgments}
        \acknowledgmentstext
    \fi%
\fi%

\ifx\prefacetext\none%
\else%
    \setbox0=\hbox{\prefacetext\unskip}%
    \ifdim\wd0=0pt%
    \else%
        \chapter[nonumber=true]{Preface}
        \prefacetext
    \fi%
\fi%

\ifx\true\nomainheadings
    \clearpage
    \phantomsection
    \addcontentsline{toc}{part}{Chapters}
\else
\fi

\ifx\true\figurenum
    \addtocontents{lof}{Figures\par}
\else
\fi

\ifx\true\tablenum
    \addtocontents{lot}{Tables\par}
\else
\fi

\mainmatter

% Headings

\NewCommandCopy{\originalchapter}{\chapter}
\renewcommand*{\chapter}[2][]{%
    \clearpage%
    \directlua{u_template_print_figures ()}%
    \clearpage%
    \directlua{u_template_print_tables ()}%
    \ifx&#1&%
        \originalchapter{#2}%
    \else%
        \originalchapter[#1]{#2}%
    \fi%
}%

\NewCommandCopy{\originallevelsevensubheading}{\levelsevensubheading}
\renewcommand*{\levelsevensubheading}[2][]{%
    \ifx&#1&%
        \originallevelsevensubheading{\indent{}#2}%
    \else%
        \originallevelsevensubheading[#1]{\indent{}#2}%
    \fi%
}%

\NewCommandCopy{\originalleveleightsubheading}{\leveleightsubheading}
\renewcommand*{\leveleightsubheading}[2][]{%
    \ifx&#1&%
        \originalleveleightsubheading{\indent{}#2}%
    \else%
        \originalleveleightsubheading[#1]{\indent{}#2}%
    \fi%
}%

\NewCommandCopy{\originallevelninesubheading}{\levelninesubheading}
\renewcommand*{\levelninesubheading}[2][]{%
    \ifx&#1&%
        \originallevelninesubheading{\indent{}#2}%
    \else%
        \originallevelninesubheading[#1]{\indent{}#2}%
    \fi%
}%

\lehead*{}
\cehead*{}
\rehead*{\upshape\thepage}
\lohead*{}
\cohead*{}
\rohead*{\upshape\thepage}

\lefoot*{}
\cefoot*{}
\refoot*{}
\lofoot*{}
\cofoot*{}

\rofoot*{}
}

\AtEndDocument{%
    \directlua{u_template_number_of ( "table", u_template_tables )}%
    \directlua{u_template_number_of ( "figure", u_template_figures )}%
    \directlua{u_template_number_of ( "appendix", "\luatexluaescapestring{\thechapter}" )}%
}
