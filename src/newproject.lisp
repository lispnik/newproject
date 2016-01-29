(in-package #:newproject)

(defun create-project
    (name &key pathname (template "default") template-pathname
     &aux
       (pathname          (make-pathname :directory `(:relative ,name)))
       (template-pathname (merge-pathnames #p"skeletons/" (asdf:component-pathname (asdf:find-system "newproject")))))
  "Create a new project from a template."
  )

;; copy skeleton to /tmp dir and then apply transforms
