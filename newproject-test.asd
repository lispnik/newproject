(defpackage #:newproject-test-system (:use #:common-lisp #:asdf))
(in-package #:newproject-test-system)

(defsystem #:newproject-test
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "newproject"))))
  :depends-on (#:newproject #:fiveam)
  :perform (test-op (o c)
                    (uiop:symbol-call "FIVEAM" "RUN!"
                                      (uiop:find-symbol* "NEWPROJECT-TEST-SUITE" "NEWPROJECT-TEST"))))
