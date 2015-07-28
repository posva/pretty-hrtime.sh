#! /bin/bash

source pretty-hrtime.sh

testSeconds() {
  assertEquals "3 s" "$(ptime 3)"
  assertEquals "0 s" "$(ptime 0)"
  assertEquals "35 s" "$(ptime 35)"
  assertEquals "35 s" "$(ptime 35 904)"
  assertEquals "37 s" "$(ptime 37 310000000)"
  assertEquals "5.31 s" "$(ptime 5 310000000)"
  assertEquals "5.3 s" "$(ptime 5 300000000)"
}

testMiliSeconds() {
  assertEquals "3 ms" "$(ptime 0 3000000)"
  assertEquals "3.01 ms" "$(ptime 0 3010000)"
  assertEquals "301 ms" "$(ptime 0 301000000)"
}

testMicroSeconds() {
  assertEquals "3 μs" "$(ptime 0 3000)"
  assertEquals "3.01 μs" "$(ptime 0 3010)"
  assertEquals "301 μs" "$(ptime 0 301000)"
}

testNanoSeconds() {
  assertEquals "3 ns" "$(ptime 0 3)"
  assertEquals "301 ns" "$(ptime 0 301)"
}

SHUNIT_PARENT="$0"
source lib/shunit2
