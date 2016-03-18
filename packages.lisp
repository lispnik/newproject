(defpackage #:newproject
  (:use #:common-lisp)
  (:import-from #:cl-fad
                #:walk-directory
                #:directory-pathname-p)
  (:import-from #:alexandria
                #:define-constant)
  (:export #:create-project-from-builtin
           #:create-project
           #:newproject))
