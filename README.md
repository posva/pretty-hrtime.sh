pretty-hrtime.sh [![Circle CI](https://circleci.com/gh/posva/pretty-hrtime.sh.svg?style=svg)](https://circleci.com/gh/posva/pretty-hrtime.sh)
===

Simple shell function to display precise elapsed time.

###Usage
```bash
ptime [-v|--verbose] [-l|--long] seconds [nanoseconds]
```

###Examples
```bash
# Simple example displaying elapsed time using perl
$ start=$(perl -e 'use Time::HiRes qw( gettimeofday ); my ($a, $b) = gettimeofday; $ts = $a; $tn = $b * 1000; print "$ts $tn";')
$ seconds=$(echo "$start" | cut -d ' ' -f 1) 
$ nanoseconds=$(echo "$start" | cut -d ' ' -f 2) 
$ elapsed=$(perl -e 'use Time::HiRes qw( gettimeofday ); my ($a, $b) = gettimeofday; $ts = $a - '"$seconds"'; $tn = $b * 1000 - '"$nanoseconds"'; print "$ts $tn";')
$ ptime $(echo "$elapsed")
6.39 s

$ ptime 37 310000000
37 s

$ ptime 0 3010
3.01 μs

$ ptime --long 3 30000000
3 s 30 ms

$ ptime -l 61 111111111
1 m 1 s 111 ms 111 μs 111 ns

$ ptime -v 1
1 second
```

###Projects using `pretty-hrtime.sh`

- [task-logger.sh](https://github.com/posva/task-logger.sh)
