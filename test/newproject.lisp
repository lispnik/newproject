(in-package #:newproject-test)

(def-suite newproject-test-suite)
(in-suite newproject-test-suite)

(test example.1
      (is (= 2 (+ 1 1))))
