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
