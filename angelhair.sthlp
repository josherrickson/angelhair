{smcl}
{* *! version 0.0.1  02jul2018}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "angelhair##syntax"}{...}
{viewerjumpto "Description" "angelhair##description"}{...}
{viewerjumpto "Examples" "angelhair##examples"}{...}
{title:Title}

{phang}
{bf:angelhair} {hline 2} Generate spaghetti plots that are visible with large data


{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:angelhair} {depvar} {it:{help varname:timevar}} , {cmdab:by}({varname}) [ {it:options} ]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt :{opth by(varname)}}The variable identifying group membership.{p_end}
{synopt :{opth hnum(integer)}}The number of random {bf:by} groups to highlight. Default {bf:20}.{p_end}
{synopt :{opth hcolor(string)}}The color of the highlighted lines. Default {bf:red}.{p_end}
{synopt :{opth bgcolor(string)}}The color of the background (non-highlighted) lines. Default {bf:gs13}.{p_end}
{synopt :{opth seed(integer)}}Setting a seed will select the same random subset of groups to highlight.{p_end}

{synopt :{it:twoway_options}}any options documented in {manhelpi twoway_options G-3} such as label or axis modification{p_end}


{marker description}{...}
{title:Description}

{pstd}
Spaghetti plots are used when visualizing data collected over time; some {depvar} is plotted by individual as a line plot.
However, as the number of individuals or the noise increases, these plots can become very difficult to read, being nothing
more than a messy blob.

{pstd}
To get around this, {cmd:angelhair} colors most of the lines light grey so they do not stand out, but highlights a random
selection of {it:hnum} individual trajectories.

{marker examples}{...}
{title:Examples}

{phang2}{stata webuse pig:. sysuse pig}{p_end}
{phang2}{stata angelhair weight week, by(id) hnum(5) hcolor(blue) xtitle("Week") ytitle("Weight"): . angelhair weight week, by(id) hnum(5) hcolor(blue) xtitle("Week") ytitle("Weight")}{p_end}
