(defpackage #:newproject-test-system (:use #:common-lisp #:asdf))
(in-package #:newproject-test-system)

(defsystem #:newproject-test
  :serial t
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "suites")
                                     (:file "tests"))))
  :depends-on (#:newproject #:osicat #:fiveam)
  :perform (test-op (o c)
                    (uiop:symbol-call "FIVEAM" "RUN!"
                                      (uiop:find-symbol* "NEWPROJECT-TEST" "NEWPROJECT-TEST"))))
