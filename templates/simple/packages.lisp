(defpackage #:@name@
  (:use #:common-lisp)
  (:export #:example)
  (:documentation ""))

(defpackage #:@name@.test
  (:use #:common-lisp
        #:@name@)
  (:import-from #:5am
                #:def-suite
                #:def-fixture
                #:def-test
                #:in-suite
                #:test
                #:is
                #:is-false))
