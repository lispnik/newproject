(in-package #:newproject)

(defun make-substitution-list (name)
  `(("@name@" . ,name)
    ("@NAME@" . ,(string-upcase name))))

(defun create-project (name &key template-name destination-root template-root)
  (let ((substitutions (make-substitution-list name)))
    (copy-project (merge-pathnames (make-pathname :directory `(:relative ,template-name))
                                   template-root)
                  destination-root
                  substitutions)))

(defun create-project-from-builtin
    (name
     &key (template-name "default") destination-root
     &aux (destination-root (make-pathname :directory `(:relative ,name))))
  (create-project
   name
   :destination-root destination-root
   :template-name template-name
   :template-root (merge-pathnames  #p"skeletons/" (asdf:component-pathname (asdf:find-system "newproject")))))

;;; from http://cl-cookbook.sourceforge.net/strings.html#manip
(defun replace-all (string part replacement &key (test #'char=))
  "Returns a new string in which all the occurences of the part
is replaced with replacement."
  (with-output-to-string (out)
    (loop with part-length = (length part)
       for old-pos = 0 then (+ pos part-length)
       for pos = (search part string
                         :start2 old-pos
                         :test test)
       do (write-string string out
                        :start old-pos
                        :end (or pos (length string)))
       when pos do (write-string replacement out)
       while pos)))

(defun perform-substitutions (string substitutions)
  (loop for (before . after) in substitutions
     do (setf string (replace-all string before after))
     finally (return string)))

(defun copy-file (source-root source-file destination-root substitutions)
  (let* ((destination-namestring (perform-substitutions (enough-namestring source-file source-root) substitutions))
         (destination-file (merge-pathnames (parse-namestring destination-namestring) destination-root)))
    (format t "Copying ~A -> ~A~%" source-file destination-file)
    (ensure-directories-exist destination-file)
    (unless (directory-pathname-p source-file)
      (with-open-file (input source-file :direction :input :element-type 'character)
          (with-open-file (output destination-file :direction :output :if-does-not-exist :create :if-exists :error)
            (let* ((text (make-array (file-length input) :element-type 'character)))
              (read-sequence text input)
              (write-sequence (perform-substitutions text substitutions) output)))))))

(defun copy-project (source-root destination-root substitutions)
  (walk-directory source-root
                  #'(lambda (source-file)
                      (copy-file source-root source-file destination-root substitutions))
                  :directories t))
