# mkdoc

Source code documentation tool using embedded Markdown for programming
languages supporting either multiline comments or at least the # character for comments.


* Download current code and manuals:  [mkdoc.zip](https://downgit.github.io/#/home?url=https://github.com/mittelmark/mkdoc/tree/master/mkdoc)
* Short Manual generated from doctools manpage [mkdoc.html](http://htmlpreview.github.io/?https://github.com/mittelmark/mkdoc/blob/master/mkdoc/mkdoc.html)
* Long Manual generated from mkdoc.tcl directly [mkdoc-mkdoc.html](http://htmlpreview.github.io/?https://github.com/mittelmark/mkdoc/blob/master/mkdoc/mkdoc-mkdoc.html)

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
    for i in xrange(0,n):  
       print("Hello World!")
    
```

A more extended example can be seen within the script
[mkdoc/mkdoc.tcl](https://github.com/mittelmark/mkdoc/blob/main/mkdoc/mkdoc.tcl)
itself.


  
