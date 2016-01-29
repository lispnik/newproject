(defpackage #:@name@-test-system (:use #:common-lisp #:asdf))
(in-package #:@name@-test-system)

(defsystem #:@name@-test
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "@name@" :depends-on ("packages")))))
  :depends-on (#:@name@ #:nst))
