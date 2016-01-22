(defpackage #:newproject-test-system (:use #:common-lisp #:asdf))
(in-package #:newproject-test-system)

(defsystem #:newproject-test
  :components ((:module "test"
                        :components ((:file "newproject"))))
  :depends-on (#:newproject
               #:hu.dwim.stefil))
