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
               (:file "@name@")
               (:file "tests"))
  :depends-on  (#:fiveam)
  :perform (test-op (operation system)
                    (uiop:symbol-call "FIVEAM" "RUN!"
                                      (uiop:find-symbol* "@NAME@.TEST"  "@NAME@.TEST"))))
