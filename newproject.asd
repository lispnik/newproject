(defpackage #:newproject-system (:use #:common-lisp #:asdf))
(in-package #:newproject-system)

#-:asdf3
(error "ASDF3 is a requirement for this system")

(defsystem #:newproject
  :serial t
  :components ((:file "packages")
               (:file "newproject")
               (:file "ui"))
  :depends-on (#:cl-fad
               #:asdf
               #:alexandria)
  :in-order-to ((test-op (test-op #:newproject-test))))
