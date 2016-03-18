(in-package #:newproject)

(defconstant +clippy-bastard+ "
    ╭──╮
    │  │     ╭────────────────────────────────────────╮
    @  @     │ Hi! It looks like you're creating a    │
    ││ │/  ──┤ new project...                         │
    ││ ││    ╰────────────────────────────────────────╯
    │╰─╯│
    ╰───╯
")

(defun prompt (prompt &optional default)
  (format t "~A ~@[(~S)~] " prompt default)
  (loop for line := (string-trim '(#\space #\Tab) (read-line))
     while (and (zerop (length line))
                (not default))
     finally (return (or (read-from-string line nil nil) default))))

(defun newproject ()
  (princ +clippy-bastard+)
  (terpri)
  (let* ((name (prompt "Project name?"))
         (destination-root (prompt "Destination root pathname?" (make-pathname :directory `(:relative ,name))))
         (template-name (prompt "Template name?" "default")))
    (create-project-from-builtin
     name
     :template-name template-name
     :destination-root destination-root)))
