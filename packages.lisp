(defpackage #:newproject
  (:use #:common-lisp)
  (:import-from #:cl-fad
                #:walk-directory
                #:directory-pathname-p)
  (:export #:newproject))