(defpackage #:@name@-system (:use #:common-lisp #:asdf))
(in-package #:@name@-system)

(defsystem #:@name@
  :name "@name@"
  :description ""
  :long-description ""
  :author ""
  :maintainer ""
  :license ""
  :serial t
  :components ((:file "packages")
               (:file "@name@"))
  :in-order-to ((test-op (test-op #:@name@-test))))

(defsystem #:@name@-test
  :serial t
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "tests"))))
  :perform (test-op (operation system)
                    (uiop:symbol-call "FIVEAM" "RUN!"
                                      (uiop:find-symbol* "@NAME@.TEST"  "@NAME@.TEST")))
  :depends-on (#:@name@ #:fiveam))
