(prefer-coding-system 'utf-8)

;; Stolen from http://stackoverflow.com/a/2079146
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(defun load-directory (directory)
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))


(load-user-file "packages.el")
(load-directory "~/.emacs.d/settings")
(load-directory "~/.emacs.d/mode")
(load-directory "~/.emacs.d/prog")
 ;; (error (message "Check ~/.emacs.d/README.md to perform necessary setup before launching Emacs.")))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-arguments
   (quote
    ("--line-number" "--smart-case" "--nogroup" "--vimgrep" "--column" "--stats" "--")))
 '(custom-enabled-themes (quote (tango-dark)))
 '(elpy-rpc-python-command
   "c:/Users/csboling/AppData/Local/Programs/Python/Python35/python.exe")
 '(typescript-auto-indent-flag nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "#500000")))))
