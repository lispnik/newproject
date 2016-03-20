(in-package #:newproject-test)

(defmacro with-temporary-directory ((var &key change-directory) &body body)
  (let ((temp-change-dir (gensym "CHANGE-DIRECTORY"))
        (old-dir (gensym)))
    `(let ((,temp-change-dir ,change-directory)
           ,var)
       (unwind-protect
            (progn
              (setf ,var (osicat-posix:mkdtemp (format nil "~Awith-tempdir" (namestring osicat:*temporary-directory*))))
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

(test example.1
  (is (= 2 (+ 1 1))))

(in-suite simple-test)

(test simple.1
  (finishes
    (with-temporary-directory ))
  )

(in-suite default-test)


(swapf )
