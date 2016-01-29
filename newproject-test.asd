(defpackage #:newproject-test-system (:use #:common-lisp #:asdf))
(in-package #:newproject-test-system)

(defsystem #:newproject-test
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "newproject"))))
  :depends-on (#:newproject #:nst)
  :perform (test-op (o c)
                    (uiop/package:symbol-call "NST" "RUN-PACKAGE" "NEWPROJECT-TEST")
                    (uiop/package:symbol-call "NST" "REPORT-PACKAGE" "NEWPROJECT-TEST")))
