# mkdoc

[![Release](https://img.shields.io/github/v/release/mittelmark/mkdoc.svg?label=current+release)](https://github.com/mittelmark/mkdoc/releases)
[![license](https://img.shields.io/badge/license-BSD-lightgray.svg)](https://opensource.org/license/bsd)

Source code documentation tool using embedded Markdown for programming
languages supporting either multiline comments or at least the # character for comments.

* standalone Tcl application for document conversion
* Tcl library for programmers

Can be as well  used to  convert  Markdown  code into HTML  optionally  adding
header, footer, stylesheets and Javascript code. The latter can be used to add
syntax   highlighting   for   instance   using   the  
[Highlight.js   syntax   highlighter](https://github.com/highlightjs).   Since
version 0.9.0 it as well supports embedding LaTeX equations using the 
[MathJax Javascript library](https://www.mathjax.org/)

* current code and manuals:  [mkdoc.zip](https://github.com/mittelmark/mkdoc/archive/refs/heads/main.zip)
* Manual pagee (version 0.9.0) [mkdoc.html](http://htmlpreview.github.io/?https://github.com/mittelmark/mkdoc/blob/master/mkdoc/mkdoc.html)

Here an example of an embedded mkdoc comment for a Python script:

```python

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

## Installation

For the  binary  just  copy  the file  mkdoc-version.bin  as mkdoc to a folder
belonging to your PATH, make the file executable.

## Changes in Comparison to the Tcllib packages

- fix for image tag
- adding header and footer support
- adding javascript (single and multiple file support)
- adding code highlight support
- adding css support for multiple files
- fix for library Markdown bugs in handling of code fences
- adding standalone binary mkdoc.bin

I will try to integrate this into Tcllib package as well but currently it goes
slowly. Submitted two issues about the mkdoc and the markdown bugs.


  
