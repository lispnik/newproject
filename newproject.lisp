(in-package #:newproject)

(defun make-substitution-list (name)
  `(("@name@" . ,name)))

(defun create-project
    (name &key pathname (template "default") (template-root-pathname (merge-pathnames (asdf:component-pathname (asdf:find-system "newproject")) #p "skeletons/")))
  "Create a new project NAME from a TEMPLATE."
  (let ((pathname (merge-pathnames (make-pathname :directory `(:relative ,name)) pathname))
        (template-pathname (merge-pathnames template-root-pathname pathname)))
    (let ((substitutions (make-substitution-list name)))
      (copy-project  template-pathname pathname substitutions))))

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
    (format t "~S -> ~S" source-file destination-file)
    (if (directory-pathname-p source-file)
        (ensure-directories-exist destination-file)
        (with-open-file (input source-file :direction :input :element-type 'character)
          (with-open-file (output destination-file :direction :output :if-does-not-exist :create :if-exists :error)
            (let* ((text (make-array (file-length input) :element-type 'character)))
              (read-sequence text input)
              (write-sequence (print (perform-substitutions text substitutions)) output)))))))

(defun copy-project (source-root destination-root substitutions)
  (walk-directory source-root
                  #'(lambda (source-file)
                      (copy-file source-root source-file destination-root substitutions))
                  :directories t))
