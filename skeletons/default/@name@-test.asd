(defpackage #:@name@-test-system (:use #:common-lisp #:asdf))
(in-package #:@name@-test-system)

(defsystem #:@name@-test
  :serial t
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "suites")
                                     (:file "@name@"))))
  :perform (test-op (operation system)
                    (uiop:symbol-call "FIVEAM" "RUN!"
                                      (uiop:find-symbol* "ALISTS-TEST-SUITE" "ALISTS-TEST")))
  :depends-on (#:@name@ #:fiveam))
