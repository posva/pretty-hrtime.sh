#! /bin/bash

source pretty-hrtime.sh

testDays() {
  assertEquals "3 d" "$(ptime 259200)"
  assertEquals "35 d" "$(ptime 3024000)"
  assertEquals "35 d" "$(ptime 3024990 904)"
  assertEquals "1.45 d" "$(ptime 126000)"
  assertEquals "5.35 d" "$(ptime 462240 6209)"
  assertEquals "5.1 d" "$(ptime 440640 24332)"
}

testHours() {
  assertEquals "3 h" "$(ptime 10800)"
  assertEquals "15 h" "$(ptime 54000)"
  assertEquals "15 h" "$(ptime 54000 904)"
  assertEquals "5.35 h" "$(ptime 19260 6209)"
  assertEquals "5.1 h" "$(ptime 18360 24332)"
}

testMinutes() {
  assertEquals "3 m" "$(ptime 180)"
  assertEquals "35 m" "$(ptime 2100)"
  assertEquals "35 m" "$(ptime 2102 904)"
  assertEquals "5.35 m" "$(ptime 321 6209)"
  assertEquals "5.1 m" "$(ptime 306 24332)"
}

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

testVerbose() {
  echo TODO
}

testLong() {
  echo TODO
}

SHUNIT_PARENT="$0"
source lib/shunit2
