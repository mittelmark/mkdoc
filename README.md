# mkdoc

[![license](https://img.shields.io/badge/license-BSD-lightgray.svg)](https://opensource.org/license/bsd)
[![Release](https://img.shields.io/github/v/release/mittelmark/mkdoc.svg?label=current+release)](https://github.com/mittelmark/mkdoc/releases)
![Downloads](https://img.shields.io/github/downloads/mittelmark/mkdoc/total)
![Commits](https://img.shields.io/github/commits-since/mittelmark/mkdoc/latest)
[![Docu](https://img.shields.io/badge/Docu-blue)](http://htmlpreview.github.io/?https://github.com/mittelmark/mkdoc/blob/master/mkdoc/mkdoc.html)

Markdown to HTML converter and source code documentation tool using embedded Markdown for programming
languages supporting either multiline comments or at least the # character for comments.

* Tcl application for document conversion from Markdown to HTML
* Tcl application to extract Markdown documentation from source code tools
* Tcl library for  programmers to accomplish both things above from within the
  Tcl programming language

Derived projects:

- [pantcl document processor](https://github.com/mittelmark/pantcl)
- [pantcl4r R package](https://github.com/mittelmark/pantcl4r)

Mkdoc is part of the  [pantcl](https://github.com/mittelmark/pantcl)  document  processor
which  supports  embedding  and  evaluating  other  documentation  tools  like
[GraphViz](https://www.graphviz.org) or [PlantUML](https://www.plantuml.com) and programming  languages
like Python, R or Octave and is  used  within  the  [pantcl4r](https/github.com/mittelmark/pantcl4r)  R
package.

The mkdoc package/application can be as well  used to  convert  Markdown  code into HTML  optionally  adding
header, footer, stylesheets and Javascript code. The latter can be used to add
syntax   highlighting   for   instance   using   the [Highlight.js syntax   highlighter](https://github.com/highlightjs).
Since version 0.9.0 it as well supports embedding LaTeX equations using the
[MathJax Javascript library](https://www.mathjax.org/)

* current code and manuals:  [mkdoc.zip](https://github.com/mittelmark/mkdoc/archive/refs/heads/main.zip)
* Manual pagee (version 0.9.0) [mkdoc.html](http://htmlpreview.github.io/?https://github.com/mittelmark/mkdoc/blob/master/mkdoc/mkdoc.html)

Here an example of an embedded mkdoc comment for a Python script:

```python
#!/usr/bin/env python3
#' **hw()**
#'  
#' > Function prints "Hello World!" to the terminal!"
#'  
#' > Arguments: 
#'  
#' > - _n_ - how often the string "Hello World!" should be printed, default: 3 
#'  
#' > Returns: None
#'  
#' > Example:
#'  
#' ```
#' hw(5)
#' ```
#'   
def hw(n=3):
    for i in range(0,n):  
       print("Hello World!")
    
```

Markdown  documentation  comments for programming languages which have not the
hash  character  as a  comment  character  can be  embedded  using  multliline
comments. Here an example for a C or C++ programm:

```c
/*
#' **void hw(int n);**
#' ...
*/
void hw(int n) {
    int i = 0;
    for (i = 0 ; i < n; i=i+1) {
        printf("Hello World!\n");
    }
}
```   

A more extended example can be seen within the script
[mkdoc/mkdoc.tcl](https://github.com/mittelmark/mkdoc/blob/main/mkdoc/mkdoc.tcl)
itself. 

These comments are used to create the longer manual which can be seen here: 
[mkdoc-mkdoc.html](http://htmlpreview.github.io/?https://github.com/mittelmark/mkdoc/blob/master/mkdoc/mkdoc-mkdoc.html).

An example using syntax hilighting can be seen here (seems not to work in preview mode):

* [hilight.md](https://github.com/mittelmark/mkdoc/blob/master/examples/hilight.md)
* [hilight.html](http://htmlpreview.github.io/?https://github.com/mittelmark/mkdoc/blob/master/examples/hilight.html).

An example using equation embedding can be seen here (seems not to work in preview mode):

* [equations.md](https://github.com/mittelmark/mkdoc/blob/master/examples/equations.md)
* [equations.html](http://htmlpreview.github.io/?https://github.com/mittelmark/mkdoc/blob/master/examples/equations.html).

## Installation

On Linux, MacOS and on Windows with installed Msys2 or Cyvwin download the latest
[mkdoc-VERSION.bin](https://github.com/mittelmark/mkdoc/releases) binary (90kb in size), rename
it to mkdoc and copy the file to a folder belonging to your PATH variable. 
Thereafter make the file executable and check that it is correctly installed like
this:

```
$ mkdoc --version
0.9.0
```

## Changes in Comparison to the Tcllib packages

- fix for image tag (as well now in Tcllib)
- adding header and footer support
- adding javascript (single and multiple file support)
- adding code highlight support [highligthjs](https://highlightjs.org/)
- adding equation support using [MathJax](https://www.mathjax.org/)
- adding css support for multiple files
- fix for library Markdown bugs in handling of code fences
- adding standalone binary mkdoc.bin

I will try to integrate this into Tcllib package as well but currently it goes
slowly. Submitted two issues about the mkdoc and the markdown bugs.


  
