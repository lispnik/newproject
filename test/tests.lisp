(in-package #:newproject-test)

(defmacro with-temporary-directory ((var &key change-directory) &body body)
  (let ((temp-change-dir (gensym "CHANGE-DIRECTORY"))
        (old-dir (gensym)))
    `(let ((,temp-change-dir ,change-directory)
           ,var)
       (unwind-protect
            (progn
              (setf ,var (uiop/pathname:parse-unix-namestring
                          (osicat-posix:mkdtemp (format nil "~Awith-tempdir" (namestring osicat:*temporary-directory*)))
                          :type :directory))
              (if ,temp-change-dir
                  (let ((,old-dir (osicat:current-directory)))
                    (unwind-protect
                         (progn
                           (setf (osicat:current-directory) ,var)
                           ,@body)
                      (setf (osicat:current-directory) ,old-dir)))
                  (progn
                    ,@body)))
         (when ,var
           (osicat:delete-directory-and-files ,var))))))

(in-suite newproject-test)

(in-suite simple-test)

(test simple.1
  (with-temporary-directory (test-root)
    (let ((destination-root (make-pathname :directory (append (pathname-directory test-root) (list "simple.1")))))
      (newproject:create-project-from-builtin "foo" :template-name "simple" :destination-root destination-root)
      (is (uiop:directory-exists-p destination-root))
      ;; FIXME: test individual files
      (is (uiop:file-exists-p (uiop/pathname:parse-unix-namestring #p "/tmp/foo" :type :directory))))))

(in-suite default-test)
