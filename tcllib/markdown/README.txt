This is a version of the Markdown  library which contains fixes for the double
escape bug in code fences and in single backtick code inlines.

Hre an example:

package require Markdown
Markdown::convert {

Indented code (should be OK):

    x > 5 && y < 5
    

Code fences (should be wrong):


```

  x > 5  && y < 5

```

This might be  disallowed in Markdown (but we should not get the HTML codes in
clear text):

`<hello>` 

This might be the legal syntax (but the backslash should be removed):

`\<hello>`

}
  
