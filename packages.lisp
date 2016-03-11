(defpackage #:newproject
  (:use #:common-lisp)
  (:import-from #:cl-fad
                #:walk-directory
                #:directory-pathname-p)
  (:export #:create-project-from-builtin
           #:create-project))
