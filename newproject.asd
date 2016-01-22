(defpackage #:newproject-system (:use #:common-lisp #:asdf))
(in-package #:newproject-system)

(defsystem #:newproject
  :components ((:module "src"
                        :components ((:file "packages")
                                     (:file "newproject" :depends-on ("packages")))))
  :depends-on (#:cl-emb)
  :in-order-to ((test-op (test-op #:newproject-test))))
