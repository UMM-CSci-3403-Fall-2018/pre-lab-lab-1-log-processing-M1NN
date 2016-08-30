# Log-processing-pre-lab

This is the pre-lab for the "Log processing" lab. It gives you some additional readings, along with practice with shell scripting, using Google Charts, and regular expressions.

##Table of Contents

* [Overview](#Overview)
* [Readings](#Pre-lab-readings-and-resources)
* [Exercises](#Exercises)
* [To Turn In](#To-turn-in)

##Overview

The goal of this pre-lab is to help prepare us for the "Log processing lab". In particular we'll provide a set of potentially useful readings on particular topics that might be useful, and do three small exercises:

- [ ] Write a small "helper" shell script that will be useful when doing the lab itself.
- [ ] See how we can use that helper script to construct HTML/Javascript files that use the Google Charts tools to generate a nice graph.
- [ ] Experiment a little with regular expressions.

The *pre-lab* is an *individual* project, but the lab will be done in pairs. You should again fork this repository and do your work in your copy. You should turn in the URL for your repository in whatever way the instructor requests.

## Pre-lab readings and resources

Read the **entire** lab in advance (<https://github.umn.edu/UMM-CSci3403-F15/lab1/wiki>) and definitely ask questions, especially conceptual ones.

Below is a list of some key tools we'll use a lot in this lab. Some were covered in readings associated with the previous lab; others have links to potentially useful material that you should at least skim before lab.

* `bash` command line arguments. These were covered in some of the readings for the previous lab; the top of [this bash tutorial](http://www.ibm.com/developerworks/linux/library/l-bash2/index.html) also covers command line arguments specifically.
* `bash` loops. If loops in `bash` feel like they're from another world, it's really because they are. They rather betray their age and the fact that they're kinda "hacked in" to a tool (`bash`) that wasn't really built with full-on programming in mind. [This tutorial](http://www.cyberciti.biz/faq/bash-for-loop/) and [that tutorial](http://tldp.org/LDP/abs/html/loops1.html) provide nice overviews and examples.
* `awk` is a very powerful Unix tool that can be used to automate loads of shell processes, but it takes some effort to learn. In many ways you'd probably rather use a modern scripting language like Ruby or Python, but `awk` is part of most any Unix installation, where you may not have Python or Ruby by default. You might find [this tutorial](http://www.thegeekstuff.com/2010/01/awk-introduction-tutorial-7-awk-print-examples/) or [that tutorial](http://www.grymoire.com/Unix/Awk.html) useful.
* `sed` (`s`tream `ed`itor) is another powerful, if old-school, standard Unix tools, that is particular useful doing "on-the-fly" editing of files or material coming through shell pipes. [this tutorial](http://www.grymoire.com/Unix/Sed.html) or [that tutorial](http://www.panix.com/~elflord/unix/sed.html) might help.
* `grep` was used in the previous lab, but here are some more `grep` resources in case that's useful: [this tutorial](http://www.panix.com/~elflord/unix/grep.html) and [that tutorial](http://www.ee.surrey.ac.uk/Teaching/Unix/unix2.html)
* [Google's charting tools](http://code.google.com/apis/chart/) support a broad range of sophisticated chart styles and types. In this lab we'll use Google's charting tools to visualize logging information from our lab.
* <http://linux.die.net/abs-guide/textproc.html> has a ton of info on the tools mentioned above along with others that will likely prove useful in the lab (e.g., `wc`, `head`, `sort`, etc.)

There's obviously tons of information on-line about all these tools, so feel free to search for other sources of info if these aren't working for you. You should do some background reading on/playing with these things before lab, though, so you don't spend all of the lab period Googling around for info on these tools.

## Exercises

### Write `wrap_contents.sh`

In the full lab there are multiple occasions where we have some text that we want to wrap in a header and footer: The username distribution data is wrapped in its header and footer, the hours data is wrapped in its header and footer, the country distribution data is wrapped in its header and footer, and the combination of these texts is then wrapped in the overall header and footer. The script `wrap_contents.sh` is designed to automate this repeated process. It should take three arguments:

1. The name of the file containing the "contents" that need to be wrapped,
2. The name used to specify the desired header and footer,
3. The name of the resulting file.

For example, this call:

```
./wrap_contents.sh gloop.txt bits target.html
```

will cause the contents of the file `gloop.txt` to be wrapped between the contents of `bits_header.html` and the contents of `bits_footer.html`, with the results being placed in `target.html`. This assumes that `gloop.txt`, `bits_header.html`, and `bits_footer.html` all exist.  The script should overwrite `target.html` if there was a file with that name.

The actual joining of the files can be easily accomplished with `cat`. This should be a short little script; if you spend more than 15-20 minutes on it I would definitely start asking some questions. The trickiest part is probably forming the correct file names from the arguments you're given; curly braces might be useful there.

There is a simple set of tests in `wrap_tests.bats` that give you a sense of whether your implementation of `wrap_contents.sh` works.

### Make a sample pie chart using `wrap_contents.sh`

To give you an idea of what `wrap_contents.sh` will be used for in the lab, there are three files in the the `chart_example` directory in this repository:

* `meats.txt`
* `bread_header.html`
* `bread_footer.html`.

If you wrote your `wrap_contents.sh` script correctly, this call

```
./wrap_contents.sh meats.txt bread my_chart.html
```

should produce an HTML file called `my_chart.html` that, when loaded in your favorite browser, displays a pie chart indicating preferences for different sandwich meats. Generate that HTML file (`my_chart.html`) and commit it as part of your repository.

The file `chart_example/sample_chart.html` is an example of the kind of thing you're looking to create, so you should be able to compare your work to that; `wrap_tests.bats` will do that automatically but you should probably check it yourself as well.

### Practice with regular expressions

Using [regexr](http://regexr.com/) or [Rubular](http://rubular.com/) (or similar) write regular expressions that would take the
following input values and return the output values paired with it.  You may find
[this tutorial](http://gnosis.cx/publish/programming/regular_expressions.html) and
[that tutorial](http://regexcrossword.com/) useful.

You should add your three regular expressions to the file `regex.txt` and commit
them as part of your repository.

#### Regex 0

**Input:**

```
* KK, muffins
* Nic, donuts
* Vincent, juice
```

**Output:**

```
Match 1

1. KK
2. muffins

Match 2

1. Nic
2. donuts

Match 3

1. Vincent
2. juice
```

#### Regex 1

**Input:**

```
* I am KK. My favorite sandwich is turkey.
* I am Nic. My favorite sandwich is avacado.
* I am awesome. I love puppies, but I don't like sandwiches.
* I am Vincent. My favorite sandwich is ham.
```

**Output:**

```
Match 1

1. KK
2. turkey

Match 2

1. Nic
2. avacado

Match 3

1. Vincent
2. ham
```

#### Regex 3

**Input:**

```
* sandwich with turkey.bacon.swiss. for here
* sandwich with ham.cheddar. to go
* sandwich with tunaSalad. to go
```

**Output:**

```
Match 1

1. turkey.bacon.swiss.
1. for here

Match 2

1. ham.cheddar.
1. to go

Match 3

1. tunaSalad.
1. to go
```

## What to turn in

Be sure to complete the following before the start of lab:

* Fork this pre-lab repository
* Do the Exercises (adding and commiting as you go)
   - [ ] Complete `wrap_contents.sh` (Exercise 1)
   - [ ] Produce `my_chart.html` with the pie chart (Exercise 2)
   - [ ] Include your three regular expression in `regex.txt` (Exercise 3)
* Make sure you push your changes up to Gitub.
