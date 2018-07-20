%%
%%% ieej-tec2.cls Version 1.0 for TeX Live compatible system
%%   Modified by Cosy MUTO by using Okumura's `jsarticle.cls'
%%
%% Original contribution
%%% ieej-tec.cls (pLaTeX2e)
%%   for the Paper of Technical Meeting of IEEJ
%%    by Motoaki Sato (ULS and Company), 2005. 
%%     E-mail: teppei@uls.co.jp, http://www.uls.co.jp/
%%
% v2.2以降の変更
% v2.2 \enumerateのパラメタ変更。TM_paper_stylefile_word.docに似せる
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{ieej-tec2}%
[2018/05/07 v2.2, modified by S.Miyoshi by using Okumura's `jsarticle.cls']
%[2016/10/25 v2.1, modified by C.Muto by using Okumura's `jsarticle.cls']
%[2014/09/07 v2.0, modified by C.Muto by using Okumura's `jsarticle.cls']
%  [2005/11/07 v1.0 for ieej-tec]

\newif\if@NTT
\@ifundefined{kanjiskip}{\@NTTtrue
 \let\kanjiskip=\jintercharskip
 \let\xkanjiskip=\jasciikanjiskip
% \def\bf{\protect\pdg\protect\pbf}
 }{\@NTTfalse}
\@ifundefined{burasage}{}{\burasage`，=1\burasage`．=1}

\newif\if@usejistfm \@usejistfmfalse
\DeclareOption{usejistfm}{\@usejistfmtrue}

\def\ieejtec@warning{\ClassWarningNoLine{ieej-tec}}
\def\ieejtecline@warning{\ClassWarning{ieej-tec}}

\newdimen\@JQ
 \@JQ=0.7392507pt
\newdimen\@Q
 \@Q=0.71144pt
%\newdimen\@EM
% \@EM=.03125em

\newif\if@Proof \@Prooffalse
\DeclareOption{Proof}{\@Prooftrue}

\newif\if@english \@englishfalse
\DeclareOption{english}{\@englishtrue}

\newcounter{@paper}
\newcommand{\@ptsize}{}
\newif\if@restonecol
%% for 2.1.4 and non pLaTeX2e compatibility
\@ifundefined{hour}{}{%
 \hour\time \divide\hour by 60\relax
 \@tempcnta\hour \multiply\@tempcnta 60\relax
 \minute\time \advance\minute-\@tempcnta
}
%%\newif\if@stysize \@stysizefalse
\if@NTT\else
 \newif\if@enablejfam \@enablejfamtrue
\fi
\DeclareOption{a4paper}{\setcounter{@paper}{1}%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
%%\DeclareOption{a4j}{\setcounter{@paper}{1}%\@stysizetrue
%%  \setlength\paperheight {297mm}%
%%  \setlength\paperwidth  {210mm}}
\DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1\p@}%
  \@bannertoken{%
     \jobname\space:\space\number\year/\number\month/\number\day
      (\number\hour:\number\minute)}
  \maketombowbox}
\DeclareOption{tombo}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{.1\p@}%
  \maketombowbox}
\DeclareOption{mentuke}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{\z@}%
  \maketombowbox}
\DeclareOption{tate}{%
  \AtBeginDocument{\tate\message{《縦組モード》}%
                   \adjustbaseline}%
}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{% \input{fleqn.clo}
 \ieejtec@warning{fleqn is incorporated into this class file}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}
\DeclareOption{disablejfam}{\@enablejfamfalse}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\newif\ifwinjis
\winjisfalse
\newif\ifmingoth
\mingothfalse
\newif\ifjisfont
\jisfontfalse
\newif\if@jsc@uplatex
\@jsc@uplatexfalse
\DeclareOption{mingoth}{\mingothtrue}
\DeclareOption{winjis}{\winjistrue}
\DeclareOption{jis}{\jisfonttrue}
\DeclareOption{uplatex}{\@jsc@uplatextrue\winjisfalse}
\def\jsc@JYn{\if@jsc@uplatex JY2\else JY1\fi}
\def\jsc@JTn{\if@jsc@uplatex JT2\else JT1\fi}
\def\jsc@pfx@{\if@jsc@uplatex u\else \fi}
\ExecuteOptions{a4paper,10pt,oneside,twocolumn,final,mentuke}
\ProcessOptions\relax

\ifwinjis
  \DeclareFontShape{JY1}{mc}{m}{n}{<-> s * [1.0392687] winjis}{}
  \DeclareFontShape{JY1}{gt}{m}{n}{<-> s * [1.0392687] winjisg}{}
  \DeclareFontShape{JT1}{mc}{m}{n}{<-> s * [1.0392687] winjis-v}{}
  \DeclareFontShape{JT1}{gt}{m}{n}{<-> s * [1.0392687] winjisg-v}{}
\else
  \ifmingoth
    \DeclareFontShape{\jsc@JYn}{mc}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ min10}{}
    \DeclareFontShape{\jsc@JYn}{gt}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ goth10}{}
    \DeclareFontShape{\jsc@JTn}{mc}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ tmin10}{}
    \DeclareFontShape{\jsc@JTn}{gt}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ tgoth10}{}
  \else
    \ifjisfont
      \DeclareFontShape{\jsc@JYn}{mc}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ jis}{}
      \DeclareFontShape{\jsc@JYn}{gt}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ jisg}{}
      \DeclareFontShape{\jsc@JTn}{mc}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ tmin10}{}
      \DeclareFontShape{\jsc@JTn}{gt}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ tgoth10}{}
    \else
      \if@jsc@uplatex
        \DeclareFontShape{JY2}{mc}{m}{n}{<-> s * [0.961] upjisr-h}{}
        \DeclareFontShape{JY2}{gt}{m}{n}{<-> s * [0.961] upjisg-h}{}
        \DeclareFontShape{JT2}{mc}{m}{n}{<-> s * [0.961] upjisr-v}{}
        \DeclareFontShape{JT2}{gt}{m}{n}{<-> s * [0.961] upjisg-v}{}
      \else
        \DeclareFontShape{\jsc@JYn}{mc}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ jis}{}
        \DeclareFontShape{\jsc@JYn}{gt}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ jisg}{}
        \DeclareFontShape{\jsc@JTn}{mc}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ tmin10}{}
        \DeclareFontShape{\jsc@JTn}{gt}{m}{n}{<-> s * [1.0392687] \jsc@pfx@ tgoth10}{}
      \fi
    \fi
  \fi
\fi
\DeclareFontShape{\jsc@JYn}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{\jsc@JYn}{mc}{m}{sl}{<->ssub*mc/m/n}{}
\DeclareFontShape{\jsc@JYn}{mc}{m}{sc}{<->ssub*mc/m/n}{}
\DeclareFontShape{\jsc@JYn}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\jsc@JYn}{gt}{m}{sl}{<->ssub*gt/m/n}{}
\DeclareFontShape{\jsc@JYn}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\jsc@JYn}{mc}{bx}{sl}{<->ssub*gt/m/n}{}
\DeclareFontShape{\jsc@JTn}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{\jsc@JTn}{mc}{m}{sl}{<->ssub*mc/m/n}{}
\DeclareFontShape{\jsc@JTn}{mc}{m}{sc}{<->ssub*mc/m/n}{}
\DeclareFontShape{\jsc@JTn}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\jsc@JTn}{gt}{m}{sl}{<->ssub*gt/m/n}{}
\DeclareFontShape{\jsc@JTn}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{\jsc@JTn}{mc}{bx}{sl}{<->ssub*gt/m/n}{}

% ?pt (実際の大きさ)  (実際の大きさ x 1.0392687)
% 9pt (8.65994pt) →  (8.65994 x [1.0392687] = 9.00008pt)
% 8pt (7.69772pt) →  (7.69772 x [1.0392687] = 8.00006pt)
% 7pt (6.7355pt)  →  (6.7355  x [1.0392687] = 7.00005pt)
% 5pt (4.81108pt) →  (4.81108 x [1.0392687] = 5.00003pt)
%
%\if@usejistfm
%\DeclareFontShape{JY1}{mc}{m}{n}{%
%  <-> s * [1.0392687] jis
%}{}
%\DeclareFontShape{JY1}{mc}{bx}{n}{%
%  <-> s * [1.0392687] jisg
%}{}
%\DeclareFontShape{JY1}{gt}{m}{n}{%
%  <-> s * [1.0392687] jisg
%}{}
%\DeclareFontShape{JY1}{gt}{bx}{n}{%
%  <-> s * [1.0392687] jisg
%}{}
%\else
%\DeclareFontShape{JY1}{mc}{m}{n}{%
%  <-> s * [1.0392687] min10
%}{}
%\DeclareFontShape{JY1}{mc}{bx}{n}{%
%  <-> s * [1.0392687] goth10
%}{}
%\DeclareFontShape{JY1}{gt}{m}{n}{%
%  <-> s * [1.0392687] goth10
%}{}
%\DeclareFontShape{JY1}{gt}{bx}{n}{%
%  <-> s * [1.0392687] goth10
%}{}
%\fi
%
%% JY1 it
%\DeclareFontShape{JY1}{mc}{m}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JY1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
%\DeclareFontShape{JY1}{gt}{m}{it}{<->ssub*gt/m/n}{}
%\DeclareFontShape{JY1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
%%
%\DeclareFontShape{JY1}{mc}{b}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JY1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JY1}{gt}{b}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JY1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JY1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
%% JT1 it
%\DeclareFontShape{JT1}{mc}{m}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JT1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
%\DeclareFontShape{JT1}{gt}{m}{it}{<->ssub*gt/m/n}{}
%\DeclareFontShape{JT1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
%%
%\DeclareFontShape{JT1}{mc}{b}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JT1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JT1}{gt}{b}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JT1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JT1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
%% sc
%\DeclareFontShape{JY1}{mc}{m}{sc}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JT1}{mc}{m}{sc}{<->ssub*mc/m/n}{}

%% from /usr/local/teTeX/share/texmf/tex/latex/base/ot1cmr.fd
\DeclareFontShape{OT1}{cmr}{m}{n}%
     {%
      <-6>cmr5%
      <6-7>cmr6%
      <7-8>cmr7%
      <8-9>cmr8%
      <9-10>cmr9%
      <10-12>cmr10%
      <12-17>cmr12%
      <17->cmr17%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sl}%
     {%
      <-9>cmsl8%
      <9-10>cmsl9%
      <10-12>cmsl10%
      <12->cmsl12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{it}%
     {%
      <-8>cmti7%
      <8-9>cmti8%
      <9-10>cmti9%
      <10-12>cmti10%
      <12->cmti12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sc}%
     {%
      <->cmcsc10%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{ui}
     {%
      <->cmu10%
      }{}
\DeclareFontShape{OT1}{cmr}{b}{n}
     {%
      <->cmb10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{n}
     {%
      <-6>cmbx5%
      <6-7>cmbx6%
      <7-8>cmbx7%
      <8-9>cmbx8%
      <9-10>cmbx9%
      <10-12>cmbx10%
      <12->cmbx12%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{sl}
     {%
      <->cmbxsl10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{it}
     {%
      <->cmbxti10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{ui}
     {%
      <->sub*cmr/m/ui
      }{}

\if@english
 \renewcommand{\normalsize}{%
  \@setfontsize\normalsize\@xpt{15.5\@Q}%
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}

 \newcommand{\small}{%
  \@setfontsize\small\@ixpt{15.5\@Q}%
  \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
	      \topsep 4\p@ \@plus2\p@ \@minus2\p@
	      \parsep 2\p@ \@plus\p@ \@minus\p@
	      \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

 \small
 \setbox0\hbox{\char\euc"A1A1}% "
 \setlength\Cht{\ht0}
 \setlength\Cdp{\dp0}
 \setlength\Cwd{\wd0}
 \setlength\Cvs{\baselineskip}
 \setlength\Chs{\wd0}

 \newcommand{\footnotesize}{%
   \@setfontsize\footnotesize\@viiipt{15\@Q}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
	       \topsep 3\p@ \@plus\p@ \@minus\p@
	       \parsep 2\p@ \@plus\p@ \@minus\p@
	       \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
\else
 \renewcommand{\normalsize}{%
  \@setfontsize\normalsize\@xpt{18.7\@Q}%
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI}

 \newcommand{\small}{%
  \@setfontsize\small\@ixpt{18.7\@Q}%
  \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
	      \topsep 4\p@ \@plus2\p@ \@minus2\p@
	      \parsep 2\p@ \@plus\p@ \@minus\p@
	      \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

 \small
 \setbox0\hbox{\char\euc"A1A1}% "
 \setlength\Cht{\ht0}
 \setlength\Cdp{\dp0}
 \setlength\Cwd{\wd0}
 \setlength\Cvs{\baselineskip}
 \setlength\Chs{\wd0}

 \newcommand{\footnotesize}{%
   \@setfontsize\footnotesize\@viiipt{16.5\@Q}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
	       \topsep 3\p@ \@plus\p@ \@minus\p@
	       \parsep 2\p@ \@plus\p@ \@minus\p@
	       \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip}
\fi

\newcommand{\scriptsize}{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
\newcommand{\large}{\@setfontsize\large\@xiipt{17}}
\newcommand{\Large}{\@setfontsize\Large\@xivpt{36\@Q}}
\newcommand{\LARGE}{\@setfontsize\LARGE\@xviipt{25}}
\newcommand{\huge}{\@setfontsize\huge\@xxpt{28}}
\newcommand{\Huge}{\@setfontsize\Huge\@xxvpt{33}}

\headheight\z@
\headsep\z@
\topskip1\Cht
\footskip8mm

\setlength\maxdepth{.5\topskip}

\@tempdima52zw
\textwidth\@tempdima
\advance \textwidth 10mm
\@settopoint\textwidth
\if@english
 \textheight 59\Cvs
 \advance \textheight \topskip
 %\advance \textheight 0mm
\else
 \textheight 49\Cvs
 \advance \textheight \topskip
 \advance \textheight .3mm % limit .3mm
\fi
\@settopoint\textheight
\topmargin\z@
\@settopoint\topmargin
\if@twocolumn
 \setlength\marginparsep{10\p@}
\else
 \setlength\marginparsep{10\p@}
\fi
\setlength\marginparpush{5\p@}

\iftombow
 \topmargin\paperheight
 \advance \topmargin -\textheight
 \advance \topmargin -\headheight
 \advance \topmargin -\headsep
 \advance \topmargin -\footskip
 \divide \topmargin \tw@
 \advance \topmargin 11.65mm
 \advance \topmargin -1in
 \@settopoint\topmargin
 \oddsidemargin\paperwidth
 \advance \oddsidemargin -\textwidth
 \divide \oddsidemargin \tw@
 \advance \oddsidemargin -1in
 \@settopoint\oddsidemargin
 \evensidemargin\oddsidemargin
 \@settopoint\evensidemargin
\else
 \topmargin \z@
 \@settopoint\topmargin
 \oddsidemargin\z@
 \@settopoint\oddsidemargin
 \evensidemargin\z@
 \@settopoint\evensidemargin
\fi

\marginparwidth 10mm
\@settopoint\marginparwidth

\if@english
 \footnotesep 2.625mm % 15H x .7
\else
 \footnotesep 2.8875mm % 16.5H x .7
\fi
\skip\footins .75\Cvs \@plus 4\p@ \@minus 2\p@
\floatsep 1\Cvs \@plus 2\p@ \@minus 2\p@
\textfloatsep 1.5\Cvs \@plus 2\p@ \@minus 4\p@
\intextsep 1.5\Cvs \@plus 2\p@ \@minus 2\p@
\dblfloatsep 1\Cvs \@plus 2\p@ \@minus 2\p@
\dbltextfloatsep 1.5\Cvs \@plus 2\p@ \@minus 4\p@

\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

\def\@listi{\leftmargin\leftmargini
  \parsep 4\p@ \@plus2\p@ \@minus\p@
  \topsep 8\p@ \@plus2\p@ \@minus4\p@
  \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep  4\p@ \@plus2\p@ \@minus\p@
   \parsep  2\p@ \@plus\p@  \@minus\p@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep 2\p@  \@plus\p@\@minus\p@
   \parsep\z@
   \partopsep \p@ \@plus\z@ \@minus\p@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

\columnsep10mm
\columnseprule0\p@
\lineskip1\p@
\normallineskip1\p@
\renewcommand{\baselinestretch}{}
\parskip\z@
\parindent1zw

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301

\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}
\setcounter{totalnumber}{10}
\setcounter{dbltopnumber}{5}
\renewcommand{\topfraction}{.95}
\renewcommand{\bottomfraction}{.95}
\renewcommand{\textfraction}{.05}
\renewcommand{\floatpagefraction}{.05}
\renewcommand{\dbltopfraction}{.95}
\renewcommand{\dblfloatpagefraction}{.05}

\if@Proof
 \def\@RH{\rlap{\smash{\raisebox{-1\headsep}%
  {\rule{0.01mm}{10mm}\rule{10mm}{0.01mm}}}}}
 \def\@LH{\llap{\smash{\raisebox{-1\headsep}%
  {\rule{10mm}{0.01mm}\rule{0.01mm}{10mm}}}}}
 \def\@RB{\rlap{\smash{\raisebox{1\footskip}%
  {\rule[-10mm]{0.01mm}{10mm}\rule{10mm}{0.01mm}}}}}
 \def\@LB{\llap{\smash{\raisebox{1\footskip}%
  {\rule{10mm}{0.01mm}\rule[-10mm]{0.01mm}{10mm}}}}}
\else
 \let\@RH\relax \let\@LH\relax \let\@RB\relax \let\@LB\relax 
\fi

\def\ps@plain{%
 \let\@mkboth\@gobbletwo
 \def\@oddhead{\@LH\hfil\@RH}%
 \def\@oddfoot{\@LB\hfil
  {\footnotesize\thepage/\pageref{ieej-tec@lastpage}}\@RB}%
 \let\@evenhead\@oddhead
 \let\@evenfoot\@oddfoot
}

\def\ps@IEEJTEC{%
 \let\@mkboth\@gobbletwo
 \def\@oddhead{\@LH\hfil\@Paper@No\@RH}%
 \let\@evenhead\@oddhead
 \def\@oddfoot{\@LB\hfil
  {\footnotesize\thepage/\pageref{ieej-tec@lastpage}}\@RB}%
 \let\@evenfoot\@oddfoot
}

\def\論文番号#1{\gdef\Paper@No{#1}}
\def\Paper@No{}
\def\@Paper@No{\smash{\raise28mm\hbox{\footnotesize\Paper@No}}}

\def\jtitle#1{\gdef\@jtitle{#1}}
\def\@jtitle{}

\def\jsubtitle#1{\gdef\@jsubtitle{#1}}
\def\@jsubtitle{}

\def\etitle#1{\gdef\@etitle{#1}}
\def\@etitle{}

\def\esubtitle#1{\gdef\@esubtitle{#1}}
\def\@esubtitle{}

\if@english
 \let\title\jtitle
 \let\subtitle\jsubtitle
\fi

\newtoks\@authorlist
\newcount\@authorcnt
\newcount\@alcnt
\newcount\total@nr
\newcount\total@alcnt
\newcount\@tempcntc
\newcount\chk@alcnt

\def\authorlist#1{%
 \@authorlist={#1}\the\@authorlist
}

\newif\ifieejtec@rep

\def\authorentry{\@ifstar
 {\ieejtec@reptrue\@ae}{\ieejtec@repfalse\relax\@ae}}

\if@english
 \def\ieejtec@rep{\ifieejtec@rep\kern\z@$^*$\kern-.35ex\fi}
\else
 \def\ieejtec@rep{\ifieejtec@rep\kern\z@$^*$\fi}
\fi

\def\fmt@al#1{%
 \@ifundefined{al@#1}%
  {\global\advance \@alcnt \@ne
   \expandafter\xdef\csname al@#1\endcsname{\the\@alcnt}%
  }{}%
}

\if@english
\def\@ae#1#2{% 
 \advance \@authorcnt \@ne
 %% author's label
 \fmt@al{#2}%
 %% author's name in English
 \@temptokena{#1}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  {\the\@temptokena\ieejtec@rep}{\csname al@#2\endcsname}}%
 \global\total@nr\@authorcnt
 \global\total@alcnt\@alcnt
}
\else
\def\@ae#1#2#3{% 
 \advance \@authorcnt \@ne
 %% author's label
 \fmt@al{#3}%
 %% author's name in Japanese
 \@temptokena{#1}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  {\the\@temptokena\ieejtec@rep}{\csname al@#3\endcsname}}% 
 %% author's name in English
 \@temptokena{#2}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  {\the\@temptokena\ieejtec@rep}{\csname al@#3\endcsname}}%
 \global\total@nr\@authorcnt
 \global\total@alcnt\@alcnt
}
\fi

\def\breakaffiliate#1{% 
 \@for\@breakaffi:=#1\do{%
  \expandafter\gdef\csname br@aff\@breakaffi\endcsname{\inhibitglue\\}% \cr
 }%
}

\def\process@Jauthorlist{\global\@alcnt\z@ \@process@Jauthorlist}

\def\@process@Jauthorlist{%
 \global\advance \@alcnt \@ne
 %%
 \@tempcnta\z@
 \ifnum\@alcnt>\@ne\unskip
  \@tempcnta\@alcnt
  \advance \@tempcnta -\@ne
 \fi
 \expandafter\let\csname br@aff0\endcsname\relax
 \csname br@aff\number\@tempcnta\endcsname
 %%
 \csname Combined@Jan\number\@alcnt\endcsname
 \expandafter\ifx\csname @Jafii\number\@alcnt\endcsname\@empty\else
   （\csname @Jafii\number\@alcnt\endcsname{}）\inhibitglue
 \fi
 %%
 \ifnum \@alcnt < \total@alcnt \expandafter\@process@Jauthorlist\fi
}

\def\@outputJauthorlist{%
 \fmt@Jauthorlist
 %%
 %\begin{tabular}{@{}l@{}}
  \process@Jauthorlist
 %\end{tabular}\par
}

\def\fmt@Jauthorlist{%
 \@authorcnt\z@
 \loop\ifnum\@authorcnt<\total@nr
  \advance \@authorcnt \@ne
   \@ifundefined{@breakJauthorline\number\@authorcnt}%
    {\expandafter\gdef\csname @breakJauthorline\number\@authorcnt\endcsname{%
     \relax}}
    {\relax}%
 \repeat
 %% 
 \@alcnt\z@
 \@tempcnta\m@ne
 \@tempcntb\z@
 \loop\ifnum \@alcnt < \total@alcnt
  \advance \@alcnt \@ne
  \expandafter\let\csname Combined@Jan\number\@alcnt\endcsname\@empty
  {\combine@Jan}%
 \repeat
}

\def\breakJauthorline#1{%
 \@for\@breakauthor:=#1\do{%
  \expandafter\gdef\csname @breakJauthorline\@breakauthor\endcsname{%
   \protect\\}% \cr
 }%
}

\def\combine@Jan{%
 \@authorcnt\z@
 \loop\ifnum \@authorcnt < \total@nr
  \advance \@authorcnt \@ne
  \protected@edef\an@al{\csname @Jauthorname\number\@authorcnt\endcsname}%
  \ifnum\@alcnt=\expandafter\@secondoftwo\an@al
   \global\advance \@tempcntb \@ne
  \fi
 \repeat
 %%
 \@authorcnt\z@
 \@tempswafalse
 \loop\ifnum \@authorcnt < \total@nr
  \advance \@authorcnt \@ne
  \protected@edef\an@al{\csname @Jauthorname\number\@authorcnt\endcsname}%
  \ifnum\@alcnt=\expandafter\@secondoftwo\an@al
   \global\advance \@tempcnta \@ne
   \@tempcntc\@tempcnta \global\advance \@tempcntc \@ne
   \expandafter\protected@xdef\csname Combined@Jan\number\@alcnt\endcsname{%
    \csname Combined@Jan\number\@alcnt\endcsname
    \if@tempswa
     ，
     \csname @breakJauthorline\number\@tempcnta\endcsname
    \fi
    \ignorespaces\expandafter\@firstoftwo\an@al\unskip
    \ifnum\@tempcntc=\@tempcntb
     \csname @breakJauthorline\number\@tempcntb\endcsname
    \fi
   }%
   \@tempswatrue
  \fi
 \repeat
}

\def\process@Eauthorlist{%
 \def\authorlist@newline{\unskip\ifnum\@alcnt=\total@alcnt \else, \fi}%
 \global\@alcnt\z@ \@process@Eauthorlist}
\def\reprocess@Eauthorlist{%
 \def\authorlist@newline{\endgraf}%
 \global\@alcnt\z@ \@process@Eauthorlist}

\def\@process@Eauthorlist{%
 \global\advance \@alcnt \@ne
 \csname Combined@Ean\number\@alcnt\endcsname\space
 \expandafter\ifx\csname @Eafii\number\@alcnt\endcsname\@empty
  \authorlist@newline
 \else
  (\csname @Eafii\number\@alcnt\endcsname)\authorlist@newline
 \fi
 %%
 \ifnum \@alcnt < \total@alcnt \expandafter\@process@Eauthorlist\fi
}

\def\@outputEauthorlist{%
 \fmt@Eauthorlist
 %%
 \setbox\@tempboxa\hbox{\process@Eauthorlist}%
 \@tempdima\wd\@tempboxa
 \ifdim \@tempdima > .8\textwidth
  \reprocess@Eauthorlist
 \else
  \leavevmode\box\@tempboxa
 \fi
}

\def\fmt@Eauthorlist{%
 \@authorcnt\z@
 \loop\ifnum\@authorcnt<\total@nr
  \advance \@authorcnt \@ne
   \@ifundefined{@breakEauthorline\number\@authorcnt}%
    {\expandafter\gdef\csname @breakEauthorline\number\@authorcnt\endcsname{%
     \relax}}
    {\relax}%
 \repeat
 %% 
 \@alcnt\z@
 \@tempcnta\m@ne
 \@tempcntb\z@
 \loop\ifnum \@alcnt < \total@alcnt
  \advance \@alcnt \@ne
  \expandafter\let\csname Combined@Ean\number\@alcnt\endcsname\@empty
  {\combine@Ean}%
 \repeat
}

\def\breakEauthorline#1{%
 \@for\@breakauthor:=#1\do{%
  \expandafter\gdef\csname @breakEauthorline\@breakauthor\endcsname{\endgraf}%
 }%
}

\def\combine@Ean{%
 \@authorcnt\z@
 \loop\ifnum \@authorcnt < \total@nr
  \advance \@authorcnt \@ne
  \protected@edef\an@al{\csname @Eauthorname\number\@authorcnt\endcsname}%
  \ifnum\@alcnt=\expandafter\@secondoftwo\an@al
   \global\advance \@tempcntb \@ne
  \fi
 \repeat
 %%
 \@authorcnt\z@
 \@tempswafalse
 \loop\ifnum \@authorcnt < \total@nr
  \advance \@authorcnt \@ne
  \protected@edef\an@al{\csname @Eauthorname\number\@authorcnt\endcsname}%
  \ifnum\@alcnt=\expandafter\@secondoftwo\an@al
   \global\advance \@tempcnta \@ne
   \@tempcntc\@tempcnta \global\advance \@tempcntc \@ne
   \expandafter\protected@xdef\csname Combined@Ean\number\@alcnt\endcsname{%
    \csname Combined@Ean\number\@alcnt\endcsname
    \if@tempswa
     , 
     \csname @breakEauthorline\number\@tempcnta\endcsname
    \fi
    \ignorespaces\expandafter\@firstoftwo\an@al\unskip
    \ifnum\@tempcntc=\@tempcntb
     \csname @breakEauthorline\number\@tempcntb\endcsname
    \fi
   }%
   \@tempswatrue
  \fi
 \repeat
}

\if@english
\def\affiliate[#1]#2{%
 \advance \chk@alcnt \@ne
 \@ifundefined{al@#1}%
  {\expandafter\def\csname al@#1\endcsname{1}%
   \ieejtec@warning{Check the "#1" label, it does not correspond to
     ^^J\@spaces any labels in \string\authorentry\space command}%
  }{}%
 \@temptokena{#2}%
 \expandafter\xdef\csname @Eafii\number\chk@alcnt\endcsname{%
  \the\@temptokena}%
}
\else
\def\affiliate[#1]#2#3{%
 \advance \chk@alcnt \@ne
 \@ifundefined{al@#1}%
  {\expandafter\def\csname al@#1\endcsname{1}%
   \ieejtec@warning{Check the "#1" label, it does not correspond to
     ^^J\@spaces any labels in \string\authorentry\space command}%
  }{}%
 \@temptokena{#2}%
 \expandafter\xdef\csname @Jafii\number\chk@alcnt\endcsname{%
  \the\@temptokena}%
 \@temptokena{#3}%
 \expandafter\xdef\csname @Eafii\number\chk@alcnt\endcsname{%
  \the\@temptokena}%
}
\fi

\newbox\@abstractbox
\newbox\j@keywordbox
\newbox\e@keywordbox
\def\abstract{\global\setbox\@abstractbox\hbox\bgroup
 \ignorespaces}
\def\endabstract{\egroup}

\def\jkeyword{\global\setbox\j@keywordbox\hbox\bgroup
 \ignorespaces}
\def\endjkeyword{\egroup}

\def\ekeyword{\global\setbox\e@keywordbox\hbox\bgroup
 \ignorespaces}
\def\endekeyword{\egroup}

\if@english 
 \let\keyword\jkeyword
 \let\endkeyword\endjkeyword
\fi

\newdimen\belowtitlesep
\belowtitlesep\z@

\def\maketitle{\par
 \ifnum \chk@alcnt < \@alcnt
  \ieejtec@warning{information of \string\affiliate\space is not specified}%
 \fi
  \begingroup
   \twocolumn[\@maketitle]
   \thispagestyle{IEEJTEC}%
  \endgroup
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@makeenglishtitle\relax
  \global\let\@jtitle\relax
  \global\let\@jsubtitle\relax
  \global\let\@etitle\relax
  \global\let\@esubtitle\relax
  \global\let\@authorlist\relax
  \global\let\affiliate\relax
  \global\let\@outputJauthorlist\relax
  \global\let\@outputEauthorlist\relax
}

\def\@maketitle{%
 \setbox\@tempboxa\hbox{%
  \@tempdima=\textwidth
  \advance \@tempdima -4zw
  \hspace{2zw}%
  \begin{minipage}{\@tempdima}
  {\Large
   \if@english\baselineskip30\@Q\fi
   \centering
   \@jtitle\par
  }%
  \ifx\@jsubtitle\empty\else
   \vskip.5\Cvs
   {\large\centering
    \@jsubtitle\par
   }%
  \fi
  \vskip\Cvs
  \if@english
   \vskip.5\Cvs
  \else
   {\large
    \centering
    \@outputJauthorlist\par
   }%
   \vskip\Cvs
   {\normalsize\normalfont
    \centering \@etitle\par
   }%
   \ifx\@esubtitle\empty\else
    \vskip.5\Cvs
    {\small\normalfont
     \centering \@esubtitle}\par
   \fi
  \fi
  {\small\normalfont
   \centering
   \@outputEauthorlist\par
  }%
  \small
  \vskip\Cvs
  \bgroup
    \leavevmode\hskip1zw
    \unhbox\@abstractbox\par
   \vskip\Cvs
   \if@english
    {\bfseries Keywords:}\ 
    \unhbox\j@keywordbox\par
   \else
    {\bfseries キーワード}\hbox to 1zw{\hss ：\hss}%
    \unhbox\j@keywordbox\par
    \ifvoid\e@keywordbox\else
    (\unhbox\e@keywordbox)
    \fi
   \fi%
  \egroup
  \vspace{\baselineskip}% 1行アキ
  \mbox{}
  \end{minipage}%

 }%
  %%
  \@tempdima \ht\@tempboxa
  \advance \@tempdima \dp\@tempboxa
  \@tempdimb \@tempdima
  \@tempdimc \@tempdima
  \divide \@tempdimc \Cvs
  \@tempcnta=\@tempdimc
  \@tempdimc \@tempcnta\Cvs
  \advance \@tempdimb -\@tempdimc
  \ifdim \@tempdimb > .35\Cvs
   \advance \@tempcnta \tw@
  \else
   \advance \@tempcnta \@ne
  \fi
  {\newpage\null
   \boxmaxdepth\z@
   \lineskiplimit\z@
   \lineskip\z@
   \parindent\z@
   \vbox to \@tempcnta\Cvs{%
    \leavevmode\box\@tempboxa
   \vss}%
  }\par
  \vspace{\belowtitlesep}%
}

\setcounter{secnumdepth}{3}
%\newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]

%\renewcommand{\thepart}{\@Roman\c@part}
\renewcommand{\thesection}{\@arabic\c@section}
\if@english
 \renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}
 \renewcommand{\thesubsubsection}{\thesubsection.\@arabic\c@subsubsection}
\else
 \def\thesubsection{\protect\leavevmode
  \hbox to .5zw{\hss 〈}\kern0pt\thesection\hbox to .5zw{\hss ・\hss}%
  \@arabic\c@subsection\kern0pt\hbox to .5zw{〉\hss}}
 \def\thesubsubsection{\protect\leavevmode
  \hbox to .5zw{\hss 〈}\kern0pt\thesection\hbox to .5zw{\hss ・\hss}%
  \@arabic\c@subsection\hbox to .5zw{\hss ・\hss}%
  \@arabic\c@subsubsection\kern0pt\hbox to .5zw{〉\hss}}
\fi
\renewcommand{\theparagraph}{\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{\@arabic\c@subparagraph}

\def\@afterheading{%
 \global\@nobreaktrue
 \everypar{%
  \if@nobreak
   \global\@nobreakfalse
   \clubpenalty \z@
    \if@afterindent
    \else
     {\setbox\z@=\lastbox}%
    \fi
  \else
   \clubpenalty\@clubpenalty
   \everypar{}%
  \fi}%
}

%% \@startsection{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
%\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
% \par \@tempskipa #4\relax
% \@afterindenttrue
% \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
% \if@nobreak
%  \everypar{}%
% \else
%  \addpenalty\@secpenalty
%  \vskip-\prevdepth \prevdepth\z@ \vskip\Cvs
%  \advance\@tempskipa-\Cvs
%  \vspace*{\@tempskipa}
% \fi
% \@ifstar{\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

\def\sectionnum@font{\sffamily}
\def\subsectionnum@font{\sffamily}
\def\dotafter@section{.}

\newif\ifjidori
\if@english\jidorifalse\else\jidoritrue\fi

%% \ifdim \@tempskipa>\z@ --> \ifdim \@tempskipa<\z@
%% \@sect{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}[ARG1]{ARG2}
\def\@sect#1#2#3#4#5#6[#7]#8{%
 \ifnum #2>\c@secnumdepth
  \let\@svsec\@empty
 \else
  \refstepcounter{#1}%
  %\protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \ifnum#2=\@ne
   \protected@edef\@svsec{%
    {\csname #1num@font\endcsname\csname the#1\endcsname
     \csname dotafter@#1\endcsname\hskip1zw}}%
  \else
   \protected@edef\@svsec{%
    {\noexpand\subsectionnum@font\noexpand\gtfamily
     \csname the#1\endcsname\hskip1zw}}%
  \fi
 \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa<\z@
   \ifjidori
    \setbox\@tempboxa\hbox{\inhibitglue #8}%
    \ifdim \wd\@tempboxa < 4zw
     \def\@svsechd{#6{\hskip #3\relax \@svsec \kintou{4zw}{\inhibitglue #8}}}%
    \else
     \def\@svsechd{#6{\hskip #3\relax \@svsec\inhibitglue #8}}%
    \fi
   \else
    \def\@svsechd{#6{\hskip #3\relax \@svsec\inhibitglue #8}}%
   \fi
  \else
   \begingroup
    #6{%
     \ifjidori
      \@tempdima4zw
      \setbox\@tempboxa\hbox{\inhibitglue #8}%
      \ifdim \wd\@tempboxa < \@tempdima
       \@hangfrom{\hskip #3\relax\@svsec}%
        \interlinepenalty\@M\kintou{\@tempdima}{\inhibitglue #8}\@@par
      \else
       \@hangfrom{\hskip #3\relax\@svsec}\interlinepenalty\@M
         \inhibitglue #8\@@par
      \fi
     \else
      \@hangfrom{\hskip #3\relax\@svsec}\interlinepenalty\@M
       \inhibitglue #8\@@par
     \fi
      }%
   \endgroup
  \fi
  \@xsect{#5}%
}

%% \ifdim \@tempskipa>\z@ --> \ifdim \@tempskipa<\z@
%% \@ssect{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}{ARG} ==
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa<\z@
   \ifjidori
    \setbox\@tempboxa\hbox{#5}%
    \ifdim \wd\@tempboxa < 4zw
     \def\@svsechd{#4{\hskip #1\relax \kintou{4zw}{#5}}}%
    \else
     \def\@svsechd{#4{\hskip #1\relax #5}}%
    \fi
   \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
   \fi
  \else
   \begingroup
    #4{%
    \ifjidori
     \@tempdima4zw
     \setbox\@tempboxa\hbox{#5}%
     \ifdim \wd\@tempboxa < \@tempdima
      \@hangfrom{\hskip #1}\interlinepenalty \@M \kintou{\@tempdima}{#5}\@@par
     \else
      \@hangfrom{\hskip #1}\interlinepenalty \@M #5\@@par
     \fi
    \else
     \@hangfrom{\hskip #1}\interlinepenalty \@M #5\@@par
    \fi
    }%
   \endgroup
  \fi
 \@xsect{#3}%
}

%% \ifdim \@tempskipa>\z@ --> \ifdim \@tempskipa<\z@
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa<\z@
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
        \pagebreak[2]%
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \else
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \fi
  \ignorespaces
}

%\def\@seccntformat#1{\csname the#1\endcsname\hskip1zw}

\newcommand{\section}{\@startsection{section}{1}{0zw}%
   {\z@ \@plus.2\Cvs \@minus.05\Cvs}%
   {\z@ \@plus.1\Cvs \@minus.05\Cvs}%
   {\reset@font\small\bfseries\mathversion{bold}}}
\newcommand{\subsection}{\@startsection{subsection}{2}{0zw}%
   {\z@ \@plus.2\Cvs \@minus.05\Cvs}%
   {-2zw}%
   {\reset@font\small\bfseries\mathversion{bold}}}
\newcommand{\subsubsection}{\@startsection{subsubsection}{3}{1zw}%
   {\z@ \@plus.2\Cvs \@minus.05\Cvs}%
   {-2zw}%
   {\reset@font\small\bfseries\mathversion{bold}}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{1zw}%
   {\z@ \@plus.2\Cvs \@minus.05\Cvs}%
   {-2zw}%
   {\reset@font\small}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{1zw}%
   {\z@ \@plus.2\Cvs \@minus.05\Cvs}%
   {-2zw}%
   {\reset@font\small}}

\newcommand{\appendix}{\par
 \onelineskip
 \setcounter{section}{0}%
 \setcounter{subsection}{0}%
 \setcounter{equation}{0}%
 \setcounter{figure}{0}%
 \setcounter{table}{0}%
 \renewcommand{\thesection}{\@Alph\c@section}%
 \if@english
  \def\theequation{A\arabic{equation}}%
 \else
  \def\theequation{\mbox{付}\arabic{equation}}%
  \def\fnum@figure{付図\thefigure}%
  \def\fnum@table{付表\thetable}%
 \fi
 \def\fnum@efigure{app.\,Fig.\,\thefigure.}%
 \def\fnum@etable{app.\,Table~\thetable.}%
 %%
 \if@english
  \section*{\centering Appendix}
 \else
  \section*{\centering 付\hskip2zw 録}
 \fi
}

\if@twocolumn
 \setlength\leftmargini {2zw}% 2em
\else
 \setlength\leftmargini {2zw}% 2.5em
\fi
\setlength\leftmarginii  {2zw}% 2.2em
\setlength\leftmarginiii {2zw}% 1.87em
\setlength\leftmarginiv  {2zw}% 1.7em
\if@twocolumn
 \setlength\leftmarginv {1zw}% .5em
 \setlength\leftmarginvi{1zw}% .5em
\else
 \setlength\leftmarginv {1zw}% 1em
 \setlength\leftmarginvi{1zw}% 1em
\fi
\setlength  \labelsep  {.5zw}% .5em
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
%\newcommand{\labelenumi}{\theenumi.}
%\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}
\if@english
 \def\labelenumi{(\,\theenumi\,)}
\else
 \def\labelenumi{\leavevmode
  \hbox to .5zw{\hss （}\,\theenumi\,\hbox to .5zw{）\hss}}
\fi
\if@english
 \def\labelenumii{(\,\theenumii\,)}
\else
 \def\labelenumii{\leavevmode
  \hbox to .5zw{\hss （}\,\theenumii\,\hbox to .5zw{）\hss}}
\fi

\renewenvironment{enumerate}
  {\ifnum \@enumdepth >3\relax\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
         \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
	 \leftmargin0zw
	 \labelwidth2zw
	 \labelsep1zw
	 \itemindent4zw
	 \listparindent1zw
         \clubpenalty\z@
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}

\newcommand{\labelitemi}{\leavevmode
 \raise.1zh\hbox to 1zw{\hss\textbullet\hss}}
\newcommand{\labelitemii}{\leavevmode
 \raise.1zh\hbox to 1zw{\hss $\circ$\hss}}
\newcommand{\labelitemiii}{\leavevmode
 \raise.1zh\hbox to 1zw{\hss $\star$\hss}}
\newcommand{\labelitemiv}{\leavevmode
 \raise.1zh\hbox to 1zw{\hss \textasteriskcentered\hss}}

\renewenvironment{itemize}
  {\ifnum \@itemdepth >3\relax\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{%
	 \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
	 \leftmargin2zw
	 \labelwidth1zw
	 \labelsep\z@ %% \itemindent
	 \listparindent1zw
	 \clubpenalty\z@
         \def\makelabel##1{\leavevmode\hbox to 1zw{\hss ##1\hss}}%
   }%
   \fi}{\endlist}

\def\descriptionlabel#1{%
  \setbox0\hbox{\bfseries #1}%
  \dimen0=\wd0 \dimen1=1zw
  \divide \dimen0 \dimen1
  \multiply \dimen0 \dimen1
  \ifdim\dimen0<\wd0 \advance \dimen0 \dimen1\fi
  \hbox to \dimen0{\box0 \hfil}\hfil}

\def\description{\list{}{%
  \leftmargin1zw
  \labelwidth\leftmargin
  \labelsep1zw
  \listparindent1zw
  \advance \labelwidth -\labelsep
  \let\makelabel\descriptionlabel
  \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@}}
\let\enddescription\endlist

\newskip\@hlskip
\@hlskip=.5\baselineskip \@plus 1mm \@minus .5mm

\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@
           \topsep\@hlskip\parsep\z@\partopsep\z@
           \itemindent -1zw
           \listparindent\itemindent
           \rightmargin\leftmargin \advance\leftmargin 1zw}%
           \item\relax}{\endlist}

\newenvironment{quotation}
  {\list{}{\listparindent 1zw
           \itemindent\listparindent
           \rightmargin\leftmargin
           \topsep\@hlskip\parsep\z@\partopsep\z@
           }%
           \item\relax}{\endlist}

\newenvironment{quote}
  {\list{}{%
           \topsep\@hlskip\parsep\z@\partopsep\z@
           \rightmargin\leftmargin}%
           \item\relax}{\endlist}

\gdef\tabbing{\lineskip \z@skip\let\>\@rtab\let\<\@ltab\let\=\@settab
     \let\+\@tabplus\let\-\@tabminus\let\`\@tabrj\let\'\@tablab
     \let\\=\@tabcr
     \@hightab\@firsttab
     \global\@nxttabmar\@firsttab
     \dimen\@firsttab\@totalleftmargin
     \global\@tabpush\z@ \global\@rjfieldfalse
     \topsep\@hlskip \parsep\z@\partopsep\z@
     \trivlist \item\relax
     \if@minipage\else\vskip\parskip\fi
     \setbox\@tabfbox\hbox{%
       \rlap{\hskip\@totalleftmargin\indent\the\everypar}}%
     \def\@itemfudge{\box\@tabfbox}%
     \@startline\ignorespaces}

\newdimen\verbatimleftmargin
  \verbatimleftmargin\z@
\newdimen\verbatimbaselineskip
  \verbatimbaselineskip\baselineskip
\def\verbatimsize{\small}

\def\@verbatim{%
 \topsep\z@ % \@hlskip
 \partopsep\z@\parsep\z@\itemsep\z@
 \trivlist \item\relax
  \if@minipage\else
   \vskip\baselineskip
   \vskip-\verbatimbaselineskip
%  \vskip\parskip
  \fi
  \leftskip\@totalleftmargin
  \if@minipage\else
   \advance \leftskip by \verbatimleftmargin
  \fi
  \rightskip\z@skip
  \parindent\z@\parfillskip\@flushglue\parskip\z@skip
  \@@par
  \@tempswafalse
  \def\par{%
    \if@tempswa
      \leavevmode \null \@@par\penalty\interlinepenalty
    \else
      \@tempswatrue
      \ifhmode\@@par\penalty\interlinepenalty\fi
    \fi}%
  \let\do\@makeother \dospecials
  \obeylines 
   \verbatimsize \baselineskip\verbatimbaselineskip
   \verbatim@font \@noligs
  \everypar \expandafter{\the\everypar \unpenalty}%
}
%\def\verbatim@font{\normalfont\ttfamily}

%% from latex.ltx
\def\@item[#1]{%
  \if@noparitem
    \@donoparitem
  \else
    \if@inlabel
      \indent \par
    \fi
    \ifhmode
      \unskip\unskip \par
    \fi
    \if@newlist
      \if@nobreak
        \@nbitem
      \else
        \addpenalty\@beginparpenalty
        \addvspace\@topsep
        \addvspace{-\parskip}%
      \fi
    \else
      \addpenalty\@itempenalty
      \addvspace\itemsep
    \fi
    \global\@inlabeltrue
  \fi
  \everypar{%
    \@minipagefalse
    \global\@newlistfalse
    \if@inlabel
      \global\@inlabelfalse
      {\setbox\z@\lastbox
       \ifvoid\z@
         \kern-\itemindent
       \fi}%
      \box\@labels
      \penalty\z@
    \fi
    \if@nobreak
      \@nobreakfalse
      \clubpenalty\z@ % \@M --> \z@ 
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}%
  \if@noitemarg
    \@noitemargfalse
    \if@nmbrlist
      \refstepcounter\@listctr
    \fi
  \fi
  \sbox\@tempboxa{\makelabel{#1}}%
  \global\setbox\@labels\hbox{%
    \unhbox\@labels
    \hskip \itemindent
    \hskip -\labelwidth
    \hskip -\labelsep
    \ifdim \wd\@tempboxa >\labelwidth
      \box\@tempboxa
    \else
      \hbox to\labelwidth {\unhbox\@tempboxa}%
    \fi
    \hskip \labelsep}%
  \ignorespaces\inhibitglue
}

\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure.}
\def\fnum@efigure{Fig.\,\thefigure.}
\newenvironment{figure}
               {\@floatenv\capwidth.9\columnwidth\ecapwidth.9\columnwidth
                \abovecaptionskip1.5mm\belowcaptionskip\z@\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@floatenv\capwidth.8\textwidth\ecapwidth.8\textwidth
                \abovecaptionskip1.5mm\belowcaptionskip\z@\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable.}
\def\fnum@etable{Table~\thetable.}
\newenvironment{table}
               {\@floatenv\capwidth.9\columnwidth\ecapwidth.9\columnwidth
                \abovecaptionskip\z@\belowcaptionskip1.5mm\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@floatenv\capwidth.8\textwidth\ecapwidth.8\textwidth
                \abovecaptionskip\z@\belowcaptionskip1.5mm\@dblfloat{table}}
               {\end@dblfloat}

\def\@floatboxreset{%
 \reset@font
 \footnotesize\tabcolsep.5zw
 \@setminipage
}

\def\@floatenv{\let\center\Center}
\def\Center{\topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \trivlist \centering\item\relax}
\def\endCenter{\endtrivlist}

\long\def\@caption#1[#2]#3{\par
 \begingroup
  \@parboxrestore
  \if@minipage
   \@setminipage
  \fi
   \footnotesize
   \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
 \endgroup}

\newdimen\abovecaptionskip
\newdimen\belowcaptionskip
\newdimen\capwidth
\newdimen\ecapwidth

\def\ieej@shortstack{\@ifnextchar[\@ieej@shortstack{\@ieej@shortstack[c]}}
\def\@ieej@shortstack[#1]{%
  \leavevmode
  \vbox\bgroup
%    \baselineskip-\p@\lineskip 3\p@
    \let\mb@l\hss\let\mb@r\hss
    \expandafter\let\csname mb@#1\endcsname\relax
    \let\\\@stackcr
    \@ishortstack}

\long\def\@makecaption#1#2{%
 \vskip\abovecaptionskip
  %\belowcaptionskip1mm
  \def\capnum@font{\normalfont}%
  \let\cap@font\relax
 \setbox\@tempboxa\hbox{\cap@font
  \ieej@shortstack[c]{{\capnum@font #1}\hskip1zw #2}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
 \ifdim \@tempdima > \baselineskip
  \hfil\parbox[t]{\wd\@tempboxa}{\centering\baselineskip4mm\cap@font
   {\capnum@font #1}\hskip1zw #2\strut}%
 \else
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\centering\baselineskip4mm\cap@font
    {\capnum@font #1}\hskip1zw #2\strut}%
  \else
   \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
 \fi
 %\vskip\belowcaptionskip
}

\long\def\ecaption#1{%
 \if@english
  \refstepcounter\@captype 
  \vskip\abovecaptionskip
 \fi
 \bgroup
  \footnotesize
  \setbox\@tempboxa\hbox{%
   \ieej@shortstack[c]{\csname fnum@e\@captype\endcsname\hskip1em #1}}%
  \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
  \ifdim \@tempdima > \baselineskip
   \hfil\parbox[t]{\wd\@tempboxa}{%
    \csname fnum@e\@captype\endcsname\hskip1em #1\strut}%
  \else
   \ifdim \wd\@tempboxa > \ecapwidth
    \hfil\parbox[t]{\ecapwidth}{%
     \csname fnum@e\@captype\endcsname\hskip1em #1\strut}%
   \else
    \hbox to\hsize{\hfil \box\@tempboxa\hfil}%
   \fi
  \fi
  \vspace{\belowcaptionskip}\par
 \egroup
}

\if@english
 \let\caption\ecaption
\fi

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{.5zw}% 6\p@
\setlength\arrayrulewidth{.1mm}% .4\p@
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{.5zw}% 3\p@
\setlength\fboxrule{.1mm}% .4\p@

%% for 2.1.4 compatibility
\@ifundefined{reDeclareMathAlphabet}{%
 \def\reDeclareMathAlphabet#1#2#3{%
  \DeclareRobustCommand{#1}[1]{%
    \ifmmode
      \ifx\math@bgroup\@empty % 2.09 compatibility
        #2\relax#3\relax##1\relax
      \else % native mode
        \ifx\math@bgroup\relax % oldstyle
          #2\relax\@fontswitch\relax{#3}##1\relax
        \else
          #2{#3{##1}}%
        \fi
      \fi
    \else
      #2{##1}%
    \fi
  }%
 }%
 \@onlypreamble\reDeclareMathAlphabet
 }{}

\if@enablejfam
  \DeclareSymbolFont{mincho}{\jsc@JYn}{mc}{m}{n}%{JY1}{mc}{m}{n}%
  \DeclareSymbolFontAlphabet{\mathmc}{mincho}
  \SetSymbolFont{mincho}{bold}{\jsc@JYn}{gt}{m}{n}{%JY1}{gt}{m}{n}%
  \DeclareMathAlphabet{\mathgt}{\jsc@JYn}{gt}{m}{n}%{JY1}{gt}{m}{n}%
  \reDeclareMathAlphabet{\mathrm}{\@mathrm}{\@mathmc}
  \reDeclareMathAlphabet{\mathbf}{\@mathbf}{\@mathgt}
  \jfam\symmincho
\else
  \DeclareRobustCommand{\mathmc}{%
    \@latex@error{Command \noexpand\mathmc invalid with\space
       `disablejfam' class option.}\@eha
  }
  \DeclareRobustCommand{\mathgt}{%
    \@latex@error{Command \noexpand\mathgt invalid with\space
       `disablejfam' class option.}\@eha
  }
\fi
\DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
\DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand{\newblock}{\hskip.11em\@plus.33em\@minus.07em}

\newenvironment{thebibliography}[1]
 {\raggedbottom
  \vskip\Cvs
  \section*{\refname}%
  \footnotesize
   \list{\if@english (\hfil\@arabic\c@enumiv\hfil )\else
     \leavevmode\hbox to .5zw{\hss （}\hfil\@arabic\c@enumiv\hfil
      \hbox to .5zw{）\hss}\fi}%
    {\leftmargin 4zw
     \labelwidth 2zw
     \labelsep 1zw
     \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
     \usecounter{enumiv}%
     \let\p@enumiv\@empty
     \renewcommand\theenumiv{\@arabic\c@enumiv}%
  }%
   \sloppy
   \clubpenalty\z@
   \@clubpenalty\clubpenalty
   \widowpenalty\z@
   \sfcode`\.\@m}
 {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\let\@openbib@code\@empty

\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width \columnwidth
  \kern 2.6\p@}

\@addtoreset{footnote}{page}
\def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}

\newcommand\@makefntext[1]{%
 \ifnum\c@footnote=\thr@@
  \@tempdima2zw
 \else
  \ifnum\c@footnote=4\relax
   \@tempdima2.5zw
  \else
   \@tempdima1.5zw
  \fi
 \fi
 \parindent\@tempdima
 \noindent\hbox to \@tempdima{\hss\@makefnmark\hskip.25zw}#1}

\def\thefootnote{\fnsymbol{footnote}}

\def\@fnsymbol#1{\ensuremath{\ifcase#1\or
 \dagger\or {\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}\or {\dagger}{\dagger}{\dagger}{\dagger}\or
 \dagger 5\or 
 \dagger 6\or 
 \dagger 7\or \dagger 8\or \dagger 9\else\@ctrerr\fi}}%

\renewcommand{\theequation}{\@arabic\c@equation}
\def\@eqnnum{{\normalfont \normalcolor (\theequation)\hspace*{1zw}}}

\if@english
 \def\@begintheorem#1#2{%
  \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
   \trivlist\item[\hskip \labelsep{\bfseries #1\ #2}]}
 \def\@opargbegintheorem#1#2#3{%
  \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
   \trivlist\item[\hskip \labelsep{\bfseries #1\ #2\ (#3)}]}
\else
 \def\@begintheorem#1#2{%
  \settowidth{\labelwidth}{\hbox to .5zw{\hss 〔}\kern0pt #1#2\kern0pt
   \hbox to .5zw{〕\hss}}%
  \begin{description}
  \item[\leavevmode\hbox to .5zw{\hss 〔}\kern0pt #1#2\kern0pt
   \hbox to .5zw{〕\hss}]}
 \def\@opargbegintheorem#1#2#3{\begin{description}
  \item[\leavevmode\hbox to .5zw{\hss 〔}\kern0pt #1#2\kern0pt
   \hbox to .5zw{〕\hss}\hbox to .5zw{\hss （}\kern0pt #3\kern0pt
   \hbox to .5zw{）\hss}]}
  \def\@endtheorem{\end{description}}
%\def\@thmcountersep{.}
\fi

%%% </borrowed from dotseqn.sty by Donald Arseneau>
%%\ProvidesPackage{dotseqn}
%%  [1995/03/22  v1.1 \space Dots leading to equation numbers]
\newcommand\EqnDots{\leaders\hbox{%
 $\m@th \mkern1.5mu\cdot\mkern1.5mu$}\hfill}
\@ifundefined{mathindent}{\newdimen\mathindent \mathindent\leftmargini}{}
\renewcommand{\[}{\relax \ifmmode\@badmath \else
 \begin{trivlist}%
  \@beginparpenalty\predisplaypenalty \@endparpenalty\postdisplaypenalty
  \item[]\leavevmode \hbox to\linewidth\bgroup $\m@th\displaystyle %$
  \hskip\mathindent\bgroup
 \fi}
\renewcommand{\]}{\relax\ifmmode \egroup $\hfil% $
    \egroup \end{trivlist}%
  \else \@badmath \fi}
\renewenvironment{equation}%
 {\@beginparpenalty\predisplaypenalty \@endparpenalty\postdisplaypenalty
     \refstepcounter{equation}\trivlist \item[]\leavevmode
       \hbox to\linewidth\bgroup $\m@th% $
         \displaystyle \hskip\mathindent}%
 {$\EqnDots % $   Replace `\hfil' with dotted leaders `\EqnDots'.
     \displaywidth\linewidth\hbox{\@eqnnum}\egroup \endtrivlist}
\renewenvironment{eqnarray}{%
   \stepcounter{equation}%
   \def\@currentlabel{\p@equation\theequation}%
   \global\@eqnswtrue \m@th \global\@eqcnt\z@  \tabskip\mathindent
   \let\\\@eqncr \setlength\abovedisplayskip\topsep
   \ifvmode \addtolength\abovedisplayskip\partopsep \fi
   \addtolength\abovedisplayskip\parskip
   \setlength\belowdisplayskip\abovedisplayskip
   \setlength\belowdisplayshortskip\abovedisplayskip
   \setlength\abovedisplayshortskip\abovedisplayskip
   $$\everycr{}\halign to\linewidth% $$
   \bgroup
     \hskip\@centering
     $\displaystyle\tabskip\z@skip{##}$\@eqnsel&%
     \global\@eqcnt\@ne \hfil${\DEQ@acs##\DEQ@acs}$\hfil&%
     \global\@eqcnt\tw@ $\displaystyle{##}$\hskip\@centering\cr%
 }% end of "\begin" part
 {\@@eqncr
   \noalign{% vertical skip up to overlay phantom line
      \penalty\@M \vskip-\prevdepth
      \edef\@tempa{\omit\span\omit\span\omit   % span three columns
        \vrule\@depth\the\prevdepth \@width\z@ % strut of proper depth
        \kern-\mathindent \kern\linewidth}%    % full line width
      \nointerlineskip \expandafter % use saved |\@tempa| outside group
   }\@tempa\cr
   \egroup
   \global\advance\c@equation\m@ne$$% $$
   \global\@ignoretrue
 }

%% from latex.ltx
%\def\@@eqncr{\let\reserved@a\relax
%    \ifcase\@eqcnt \def\reserved@a{& & &}\or \def\reserved@a{& &}%
%     \or \def\reserved@a{&}\else
%       \let\reserved@a\@empty
%       \@latex@error{Too many columns in eqnarray environment}\@ehc\fi
%     \reserved@a \if@eqnsw\@eqnnum\stepcounter{equation}\fi
%     \global\@eqnswtrue\global\@eqcnt\z@\cr}
%%

\def\@@eqncr{\let\reserved@a\@empty
   \ifcase\@eqcnt \def\reserved@a{& &}\or \def\reserved@a{&}\fi
   \reserved@a
   \if@eqnsw \egroup $\EqnDots \@eqnnum $\bgroup \stepcounter{equation}%
   \fi \global\@eqnswtrue\global\@eqcnt\z@\cr}
\def\DEQ@acs{\hskip\tw@\arraycolsep}
\DeclareOption{leftjust}{\let\@eqnsel\hfil}
\DeclareOption{nocolsep}{\let\DEQ@acs\null}
\ExecuteOptions{nocolsep}% {leftjust}% 
\ProcessOptions
%% </borrowed from dotseqn.sty>

\def\FRAC#1#2{\leavevmode\kern-.1em
  \raise.5ex\hbox{\the\scriptfont0 #1}\kern-.1em
  /\kern-.15em\lower.25ex\hbox{\the\scriptfont0 #2}}
\def\RN#1{\uppercase\expandafter{\romannumeral#1}}
\def\onelineskip{\par\vspace{\baselineskip}\par}
\def\halflineskip{\par\vspace{.5\baselineskip}\par}
\def\MARU#1{\raisebox{0.1zh}%
 {{\normalfont\ooalign{\hfil\lower.168ex\hbox{#1}\hfil\crcr\mathhexbox20D}}}}
\def\kintou#1#2{\leavevmode\hbox to #1{%
 \kanjiskip\z@ plus 1fill minus 1fill\xkanjiskip\kanjiskip #2\hfil}%
}
\def\ddash{\leavevmode\hbox to 2zw{---\hss ---}}
\def\ruby#1#2{\leavevmode \setbox0=\hbox{#1}\setbox1=\hbox{\tiny#2}%
 \ifdim\wd0>\wd1 \dimen0=\wd0 \else \dimen0=\wd1 \fi
 \hbox{\kanjiskip=\fill
  \vbox{\smash{\hbox to \dimen0{\tiny \hfil#2\hfil}}%
   \nointerlineskip \hbox to \dimen0{\hfil#1\hfil}}}}
\def\QED{{\unskip\nobreak\hfil\penalty50
 \hskip1zw\hbox{}\nobreak\hfil \hbox{$\Box$\hskip1zw}
 \parfillskip\z@ \finalhyphendemerits\z@\par}}

\newif\if西暦 \西暦false
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\newcount\heisei \heisei\year \advance\heisei-1988\relax
\def\today{{%
  \iftdir
    \if西暦
      \kansuji\number\year 年
      \kansuji\number\month 月
      \kansuji\number\day 日
    \else
      平成\ifnum\heisei=1 元年\else\kansuji\number\heisei 年\fi
      \kansuji\number\month 月
      \kansuji\number\day 日
    \fi
  \else
    \if西暦
      \number\year~年
      \number\month~月
      \number\day~日
    \else
      平成\ifnum\heisei=1 元年\else\number\heisei~年\fi
      \number\month~月
      \number\day~日
    \fi
  \fi}}

%%\newcommand{\prepartname}{第}
%%\newcommand{\postpartname}{部}
%%\newcommand{\contentsname}{目 次}
%%\newcommand{\listfigurename}{図 目 次}
%%\newcommand{\listtablename}{表 目 次}
\newcommand{\refname}{参考文献}
%%\newcommand{\indexname}{索 引}
\newcommand{\figurename}{Fig.~}
\newcommand{\tablename}{Table~}
%%\newcommand{\appendixname}{付 録}
%%\newcommand{\abstractname}{概 要}

%% from "citesort.sty", with a little customized
\newcount\@minsofar
\newcount\@min
\newcount\@cite@temp
\def\@citex[#1]#2{%
\if@filesw \immediate \write \@auxout {\string \citation {#2}}\fi
\@tempcntb\m@ne \let\@h@ld\relax \def\@citea{}%
\@min\m@ne
\@cite{%
  \@for \@citeb:=#2\do {\@ifundefined {b@\@citeb}%
    {\@h@ld\@citea\@tempcntb\m@ne{\bfseries ?}%
    \@warning {Citation `\@citeb ' on page \thepage \space undefined}}%
{\@minsofar\z@ \@for \@scan@cites:=#2\do {%
  \@ifundefined{b@\@scan@cites}%
    {\@cite@temp\m@ne}
    {\@cite@temp\number\csname b@\@scan@cites \endcsname \relax}%
\ifnum\@cite@temp > \@min% select the next one to list
    \ifnum\@minsofar = \z@
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\else
    \ifnum\@cite@temp < \@minsofar
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\fi\fi\fi}\@tempcnta\@min
  \ifnum\@minsofar > \z@ % some more
    \advance\@tempcnta\@ne
    \@min\@minsofar
    \ifnum\@tempcnta=\@minsofar %   Number follows previous--hold on to it
      \ifx\@h@ld\relax
        \edef \@h@ld{\@citea\csname b@\@scan@copy\endcsname}%
      \else
       \edef\@h@ld{\ifmmode{)\cite@f@t@(}\else)\cite@f@t@(\fi
        \csname b@\@scan@copy\endcsname}%
      \fi
    \else \@h@ld\@citea\csname b@\@scan@copy\endcsname
          \let\@h@ld\relax
  \fi % no more
\fi}%
\def\@citea{)\penalty\@highpenalty\,(}}\@h@ld}{#1}}
%% end of citesort.sty

\def\cite@f@t@{%
  --%
}

%% from "cite.sty", with a little customized
\def\@cite#1#2{\leavevmode\unskip
  \ifnum\lastpenalty=\z@\penalty\@highpenalty\fi% highpenalty before
  \,$^{\mbox{\tiny ({\multiply\@highpenalty 3 #1% % triple-highpenalties within
      \if@tempswa,\penalty\@highpenalty\ #2\fi % and before note.
    })}}$\spacefactor\@m}
%% end of cite.sty

\let\org@cite\@cite
\def\cite{\@ifnextchar[% ]
 {\@tempswatrue\let\@cite\org@cite\@citex}
 {\@tempswafalse\let\@cite\org@cite\@citex[]}}
\def\Cite{\@ifnextchar[% ]
 {\@tempswatrue\let\@cite\@Cite\@citex}
 {\@tempswafalse\let\@cite\@Cite\@citex[]}}

\def\@Cite#1#2{\leavevmode\unskip
  \ifnum\lastpenalty=\z@\penalty\@highpenalty\fi% highpenalty before
  \,({\multiply\@highpenalty 3 #1%             % triple-highpenalties within
      \if@tempswa,\penalty\@highpenalty\ #2\fi % and before note.
    })\spacefactor\@m}

\if@english
 \def\acknowledgment{\par
  \addpenalty{-\@highpenalty}%
  {\normalfont\bfseries Acknowledgment}\par
  \nopagebreak
 }
\else
 \def\acknowledgment{\par
  \addpenalty{-\@highpenalty}%
  {\normalfont\bfseries 謝\kern1zw 辞}\par
  \nopagebreak
 }
\fi

\if@NTT\else
 \postbreakpenalty`（=10000
 \prebreakpenalty`）=10000
 \postbreakpenalty`［=10000
 \prebreakpenalty`］=10000
 \postbreakpenalty`〈=10000
 \prebreakpenalty`〉=10000
 \prebreakpenalty`"=10000
 \prebreakpenalty`℃=10000
 \prebreakpenalty`　=10000
 \prebreakpenalty`・=10000
 \prebreakpenalty`〜=10000
 \prebreakpenalty`ー=10000
 \prebreakpenalty`？=10000
 \prebreakpenalty`！=10000
 \postbreakpenalty"5C=10000
\fi

\def\sloppy{\tolerance9999\hbadness9999\hfuzz.5\p@ \vfuzz.5\p@}

\hbadness4000
\vbadness10001
\tolerance4000\pretolerance\m@ne
\clubpenalty\z@
\widowpenalty\z@
%\displaywidowpenalty\z@
%\interdisplaylinepenalty\z@ % 100
%\predisplaypenalty\z@       % 1000

\AtBeginDocument{%
 \small
 %%
 \displaywidowpenalty\z@
 \interdisplaylinepenalty\z@
 \predisplaypenalty\z@
 \postdisplaypenalty\z@
 %%
 \@ifundefined{@mathmargin}{\let\@mathmargin\undefined}
  {%
   \@mathmargin\mathindent
   \multlinegap1zw
   %% from /usr/local/teTeX/share/texmf/tex/latex/amsmath/amsmath.sty, v2.13
   \def\maketag@@@#1{\hbox{\m@th\normalfont #1}\hskip1zw}%
   \renewcommand{\eqref}[1]{\textup{\tagform@{\ref{#1}}\unskip}}
   \def\make@display@tag{%
     \if@eqnsw
      \incr@eqnum
      %\print@eqnum
      \EqnDots\tagform@\theequation
     \else \iftag@ \df@tag \global\let\df@tag\@empty \fi
     \fi
     \ifmeasuring@
     \else
       \ifx\df@label\@empty
       \else
	 \@xp\ltx@label\@xp{\df@label}%
	 \global\let\df@label\@empty
       \fi
     \fi
   }
  }%
 %% nidanfloat
 \@ifundefined{dblbotfraction}{}{%
  \renewcommand\dblbotfraction{0.9}% 0.5
  \setcounter{dblbotnumber}{4}% 2
 }%
 %% here.sty
 \@ifundefined{@HHfloat}{}{%
  \def\@HHfloat#1[H]{%
   \expandafter\let\csname end#1\endcsname\end@Hfloat
   \vskip\intextsep
   \vbox\bgroup\def\@captype{#1}\parindent\z@
   \@floatboxreset %% added
   \ignorespaces}%
  \def\end@Hfloat{\egroup\vskip-1zh %% added
   \vskip \intextsep}%
 }%
}

\AtEndDocument{%
 \clearpage
 \addtocounter{page}{-1}%
 \immediate\write\@auxout
  {\string\newlabel{ieej-tec@lastpage}{{}{\thepage}}}%
 %\addtocounter{page}{1}%
}

\pagestyle{plain}
\pagenumbering{arabic}
%\raggedbottom
\flushbottom
\if@twocolumn
  \twocolumn
  \sloppy
\else
  \onecolumn
\fi
\if@twoside
  \@mparswitchtrue
\else
  \@mparswitchfalse
\fi
%
%%%% 文書にハードコーディングされていたのを移設
\hoffset=-1.0in% 左へ 1.0インチ版面全体を移動
\voffset=-1.0in% 上へ 1.0インチ版面全体を移動
%
\endinput
