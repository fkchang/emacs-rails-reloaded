(require 'find-recursive)

(defun files-ext/directory-of-file(file-name)
  "Return the parent directory of a file named FILE-NAME."
  (replace-regexp-in-string "[^/]*$" "" file-name))

(defun files-ext/find-recursive-files (filter-func regexp directory)
  "Return a list of files, found in DIRECTORY and match them to FILE-REGEXP."
  (let ((files
         (find-recursive-filter-out
          find-recursive-exclude-files
          (find-recursive-directory-relative-files directory "" regexp)))
        (res))
    (dolist (it files)
      (when-bind (obj (funcall filter-func it))
        (add-to-list 'res obj t)))
    res))

(defun files-ext/file-special-p (file)
  (or (string= file ".")
      (string= file "..")))

(provide 'files-ext)