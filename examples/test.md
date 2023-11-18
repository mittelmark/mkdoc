
# Syntax hilight demo

This is an example to show the use of the Javascript library hightlightjs.

## Document creation

The Markdown file can be converted with syntax highlighting like this:

```
mkdoc example.md example.html --javascript highlightjs
```

## Code block examples in Tcl

Just indented code block without language marker will work by automatic recognition:

    #!/usr/bin/env tclsh
    puts "Hello"

Now a fenced code block which should support syntax highlighting:

```tcl
puts "hello 1"
puts "hello 2"
echo "Hi"
proc test { } { }
```

Now a fenced block with curly braces.

```{tcl}
proc test {{x 1}} {
    if {$x > 1} {
        puts yes
    }   
}    
puts "hello 1"
puts "hello 2"
```

Now a fenced block with curly braces and attributes.

```{tcl label=test,echo=true}
proc test {{x 1}} {
    if {$x > 1} {
        puts yes
    }   
}    
puts "hello 1"
puts "hello 2"
```
    
## Other languages

Here a Javascript example:

```javascript
function greet() {
      console.log("Hello, world!");
}
greet();
```

And here a Python example:

```python
def test():
    print("testig")

test();
```
