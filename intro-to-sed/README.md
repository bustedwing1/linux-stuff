Intro to Sed
============


BASIC USAGE
-----------

```bash
sed 's/05/../'
sed 's#05#..#'
cat blinky.hex  | sed 's/05/../'
```

OPTIONS EXAMPLES
----------------

```bash
cat blinky.hex  | sed 's/05/../g'
sed * 's/f/ /i'
```


COMMAND PIPELINE EXAMPLE
------------------------

```bash
history | grep sed | sed 's/^\s* \s*//'
```


REPEAT WILDCARDS  (Zero or more, one or more). SED wildcards are greedy
-----------------------------------------------------------------------

```bash
cat blinky.hex  | sed 's/0*1/  /'g
cat blinky.hex  | sed 's/0\+1/  /'g
```

MATCH ANYTHING WILDCARD .
-------------------------

```bash
cat blinky.hex  | sed 's/./x/'
cat blinky.hex  | sed 's/./x/g'
```


SPACE WILDCARD \s
-----------------

```bash
cat blinky.hex  | sed 's/0/ /'g |sed 's/\s//'
cat blinky.hex | sed 's/0/ /g'  |sed 's/\s*//'
cat blinky.hex | sed 's/0/ /g'  |sed 's/\s*//g'
```

NOT SPACE WILDCARD \S
---------------------

```bash
cat blinky.hex  | sed 's/0/ /'g | sed 's/\S/e/g'
```


WORD WILDCARD \w and NOT WORD \W
--------------------------------

```bash
cat blinky.hex  | sed 's/0/ /'g
cat blinky.hex  | sed 's/0/ /'g | sed 's/\w/x/g'
cat blinky.hex  | sed 's/0/ /'g | sed 's/\W/x/g'
```

DIGIT and CUSTOM WILDCARD [abc] [^abc]
--------------------------------------

```bash
cat blinky.hex  | sed 's/[0-9]/-/g'
cat blinky.hex  | sed 's/[13579]/./g'
cat blinky.hex  | sed 's/[^13579]/./g'
```

ANCHOR EXAMPLES
----------------

```bash
cat blinky.hex  | sed 's/^/BEFORE,/'
cat blinky.hex  | sed 's/$/,AFTER/'
cat blinky.hex  | sed 's/^/BEFORE,/' | sed 's/$/,AFTER/'
cat blinky.hex  | sed 's/^00/zerozero/'
cat blinky.hex  | sed 's/7$/SEVEN/g'
```

WORD BOUNDARIES
---------------

```bash
cat blinky.hex  | sed 's/5/ /g'
cat blinky.hex  | sed 's/5/ /g' |sed 's/ 0 /.../'
cat blinky.hex  | sed 's/5/ /g' |sed 's/\b0\b/*/'
```

ALTERNATION CHOICES (OR)
------------------------

```bash
cat blinky.hex | sed 's/\(37\|E7\)/__/g'
```

CAPTURE GROUPS
--------------

```bash
cat blinky.hex | sed 's/^..\(....\).*/\1/'
cat blinky.hex | sed 's/^.*\([^0]\)\(..\)\(.\).*/\1,\2,\3/'
```

OPUS (Convert $readmemh format to verilog memory initial block assignments
--------------------------------------------------------------------------

```bash
nl -v 0 blinky.hex |sed "s/^\s*\(\w*\)\s*\(\w*\).*$/mem[\1] = 32'h\2;/
```
