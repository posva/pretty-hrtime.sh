# pretty-hrtime.sh [![Circle CI](https://circleci.com/gh/posva/pretty-hrtime.sh.svg?style=svg)](https://circleci.com/gh/posva/pretty-hrtime.sh)
===

Simple shell function to display precise elapsed time.

###Usage
```bash
ptime [-v|--verbose] [-l|--long] seconds [nanoseconds]
```

###Examples
```bash
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
