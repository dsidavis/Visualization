<div id="wrap"><div class="container"><div class="row row-offcanvas row-offcanvas-right"><div class="contents col-xs-12 col-md-10">---
output:
  knitrBootstrap::bootstrap_document:
    title: "Using the Google Chart Tools with R"
    theme.chooser: TRUE
    highlight.chooser: TRUE
---

<!--
%\VignetteEngine{knitr::rmarkdown}
%\VignetteIndexEntry{Using the Google Chart Tools with R}
-->


Using the Google Chart Tools with R
========================================================

Markus Gesmann and Diego de Castillo




# Overview

The googleVis package provides an interface between R and the
Google Chart Tools.  The Google Chart Tools offer interactive
charts which can be embedded into web pages. The best 
known of these charts is probably the Motion Chart, popularised 
by Hans Rosling in his TED talks. 
 
The functions of the googleVis package allow the user to visualise
data stored in R data frames with the Google Chart Tools
without uploading the data to Google. The output of a `googleVis`
function is html code that contains the data and references to
JavaScript functions hosted by Google.
  
googleVis makes use of the internal R HTTP server to display the
output locally. A modern browser with an Internet connection is
required and for some charts Flash.

# Introduction

## Motivation

More and more data is becoming available, and yet
stories and insights are still often missed: we are lost in the data
jungle and struggle to see the wood for the trees. 

Hence, new tools are required to bring data to life, to engage with
users, to enable them to slice and dice the data, to view it from
various angles and to find stories worth telling: outliers, trends or
even the obvious. 

In 2006 Hans Rosling gave an inspiring talk at
TED (<a href="">Rosling, 2006</a>) about social and economic developments
in the world over the past 50 years, which challenged the views and
perceptions of many listeners. Rosling had used extensive data analysis
to reach his conclusions.  To visualise his talk, he and his team at
Gapminder (<a href="">Foundation, 2010</a>) had developed animated bubble charts, aka
motion charts. 

Rosling's presentation popularised the idea and use of interactive
charts. One year later the software behind
Gapminder was bought by Google and integrated as motion charts into
their Google Chart Tools (<a href="">Inc., 2012</a>), formerly known as Google
Visualisation API.  

In 2010 Sebastian Perez Saaibi (<a href="">Saaibi, 2010</a>) presented at the 
R/Rmetrics Workshop on  Computational Finance and Financial
Engineering, the idea to use Google motion charts to visualise R
output with the R.rsp package (<a href="">Bengtsson, 2012</a>). 

Inspired by those talks and the desire to use interactive data
visualisation tools to foster the dialogue between data analysts and
others the authors of this vignette started the development of the
`googleVis` package (<a href="">Gesmann & Castillo, 2014</a>),
(<a href="http://journal.r-project.org/archive/2011-2/RJournal_2011-2_Gesmann+de~Castillo.pdf">Gesmann & Castillo, 2011</a>) in August 2010. 

![Overview of a Google Motion Chart](./figures/MotionChart.png)

*Overview of a Google Motion Chart.  Screenshot of the output of
`plot(gvisMotionChart(Fruits, idvar='Fruit', timevar='Year'))`*


## Motion Chart Example

Following the documentation of the Google Motion Chart API we need a
data set which has at least four columns: one identifying the
variable we would like to plot, one time variable and at least two
numerical variables, further numerical and character columns are allowed.

As an example we use the `Fruits` data set:

<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r">data(Fruits)
Fruits</code></pre><button class="output R toggle btn btn-xs btn-success"><span class="glyphicon glyphicon-chevron-down"></span> R output</button><pre style=""><code class="output r">##     Fruit Year Location Sales Expenses Profit       Date
## 1  Apples 2008     West    98       78     20 2008-12-31
## 2  Apples 2009     West   111       79     32 2009-12-31
## 3  Apples 2010     West    89       76     13 2010-12-31
## 4 Oranges 2008     East    96       81     15 2008-12-31
## 5 Bananas 2008     East    85       76      9 2008-12-31
## 6 Oranges 2009     East    93       80     13 2009-12-31
## 7 Bananas 2009     East    94       78     16 2009-12-31
## 8 Oranges 2010     East    98       91      7 2010-12-31
## 9 Bananas 2010     East    81       71     10 2010-12-31
</code></pre></div>

Here we will use the columns `Fruit` and
`'Year'` as id and time variable respectively. However we could
have used `'Date'` instead of `'Year'` as well. 


<div class="row"><button class="source R toggle btn btn-xs btn-primary"><span class="glyphicon glyphicon-chevron-down"></span> R source</button><pre style=""><code class="source r"> M <- gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
plot(M)</code></pre><!-- MotionChart generated in R 3.1.0 by googleVis 0.5.3 package -->
<!-- Mon May 26 22:40:11 2014 -->


<!-- jsHeader -->
<script type="text/javascript">
 
// jsData 
function gvisDataMotionChartID48671cf969c () {
var data = new google.visualization.DataTable();
var datajson =
[
 [
 "Apples",
2008,
"West",
98,
78,
20,
"2008-12-31" 
],
[
 "Apples",
2009,
"West",
111,
79,
32,
"2009-12-31" 
],
[
 "Apples",
2010,
"West",
89,
76,
13,
"2010-12-31" 
],
[
 "Oranges",
2008,
"East",
96,
81,
15,
"2008-12-31" 
],
[
 "Bananas",
2008,
"East",
85,
76,
9,
"2008-12-31" 
],
[
 "Oranges",
2009,
"East",
93,
80,
13,
"2009-12-31" 
],
[
 "Bananas",
2009,
"East",
94,
78,
16,
"2009-12-31" 
],
[
 "Oranges",
2010,
"East",
98,
91,
7,
"2010-12-31" 
],
[
 "Bananas",
2010,
"East",
81,
71,
10,
"2010-12-31" 
] 
];
data.addColumn('string','Fruit');
data.addColumn('number','Year');
data.addColumn('string','Location');
data.addColumn('number','Sales');
data.addColumn('number','Expenses');
data.addColumn('number','Profit');
data.addColumn('string','Date');
data.addRows(datajson);
return(data);
}
 
// jsDrawChart
function drawChartMotionChartID48671cf969c() {
var data = gvisDataMotionChartID48671cf969c();
var options = {};
options["width"] =    600;
options["height"] =    500;


    var chart = new google.visualization.MotionChart(
    document.getElementById('MotionChartID48671cf969c')
    );
    chart.draw(data,options);
    

}
  
 
// jsDisplayChart
(function() {
var pkgs = window.__gvisPackages = window.__gvisPackages || [];
var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
var chartid = "motionchart";
  
// Manually see if chartid is in pkgs (not all browsers support Array.indexOf)
var i, newPackage = true;
for (i = 0; newPackage && i < pkgs.length; i++) {
if (pkgs[i] === chartid)
newPackage = false;
}
if (newPackage)
  pkgs.push(chartid);
  
// Add the drawChart function to the global list of callbacks
callbacks.push(drawChartMotionChartID48671cf969c);
})();
function displayChartMotionChartID48671cf969c() {
  var pkgs = window.__gvisPackages = window.__gvisPackages || [];
  var callbacks = window.__gvisCallbacks = window.__gvisCallbacks || [];
  window.clearTimeout(window.__gvisLoad);
  // The timeout is set to 100 because otherwise the container div we are
  // targeting might not be part of the document yet
  window.__gvisLoad = setTimeout(function() {
  var pkgCount = pkgs.length;
  google.load("visualization", "1", { packages:pkgs, callback: function() {
  if (pkgCount != pkgs.length) {
  // Race condition where another setTimeout call snuck in after us; if
  // that call added a package, we must not shift its callback
  return;
}
while (callbacks.length > 0)
callbacks.shift()();
} });
}, 100);
}
 
// jsFooter
</script>
 
<!-- jsChart -->  
<script type="text/javascript" src="https://www.google.com/jsapi?callback=displayChartMotionChartID48671cf969c"></script>
 
<!-- divChart -->
  
<div id="MotionChartID48671cf969c"
  style="width: 600px; height: 500px;">
</div>
</div>

# References

<div class="row">
- Gapminder Foundation,   (2010) Gapminder.
- Markus Gesmann, Diego Castillo,   (2014) googleVis: Using the Google Chart Tools with R.
- Google Inc.,   (2012) Google Chart Tools.
- Hans Rosling,   (2006) TED Talk: Hans Rosling shows the best stats you've ever seen.
- Markus Gesmann, Diego Castillo,   (2011) Using the Google Visualisation API with R.  *The R Journal*  **3**  (2)   40-44  [http://journal.r-project.org/archive/2011-2/RJournal_2011-2_Gesmann+de~Castillo.pdf](http://journal.r-project.org/archive/2011-2/RJournal_2011-2_Gesmann+de~Castillo.pdf)
- Henrik Bengtsson,   (2012) R.rsp: R Server Pages.
- Sebasti\'{a}n Saaibi,   (2010) R/RMETRICS Generator Tool for Google Motion Charts.
</div></div></div>
<div class="navbar navbar-fixed-bottom navbar-inverse"><div class="container"><div class="navbar-header"><button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse"><span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span></button></div>
<div id="bottom-navbar" class="navbar-collapse collapse navbar-responsive-collapse"><ul class="nav navbar-nav navbar-right"><li class="nav"><p class="navbar-text">Toggle</p></li>
<li class="dropup"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Code 
<b class="caret"></b></a>
<ul class="dropdown-menu"><li class="dropdown-header">Languages</li>
<li ><a href="#" class="toggle-global source R" type="source.R">R</a></li>
<li ><a href="#" type="all-source" class="toggle-global">All</a></li></ul></li>
<li class="dropup"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Output
<b class="caret"></b></a>
<ul class="dropdown-menu"><li class="dropdown-header">Type</li>
<li ><a href="#" class="toggle-global output" type="output">output</a></li>
<li ><a href="#" type="all-output" class="toggle-global">All</a></li></ul></li>
<li class="active"><a href="#" type="figure" class="toggle-global">Figures</a></li></ul></div></div></div></div>
<div id="push"></div>
<div id="footer"><div class="container"><p class="text-muted" id="credit">Styled with 
<a href="https://github.com/jimhester/knitrBootstrap">knitrBootstrap</a></p></div></div>
<link rel="stylesheet" id="theme" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" media="screen"></link><link rel="stylesheet" id="highlight" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/7.3/styles/default.min.css" media="screen"></link></div>
