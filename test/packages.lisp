(defpackage #:newproject-test
  (:use #:common-lisp
        #:fiveam
        #:newproject)
  (:import-from #:osicat-posix
                #:mkdtemp)
  (:export #:newproject-test))
