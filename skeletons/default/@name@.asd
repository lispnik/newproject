(defpackage #:@name@-system (:use #:common-lisp #:asdf))
(in-package #:@name@-system)

(defsystem #:@name@
  :name "@name@"
  :description ""
  :long-description ""
  :author ""
  :maintainer ""
  :license ""
  :components ((:module "src"
                        :components ((:file "packages")
                                     (:file "@name@" :depends-on ("packages")))))
  :perform ((op test-op) (component (eql (find-system "@name@-test")))
            (uiop/package:symbol-call "NST" "RUN-PACKAGE")))
