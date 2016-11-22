
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
(load-user-file "utility.el")
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
 '(ediff-custom-diff-program "diff")
 '(elpy-rpc-python-command
   "c:/Users/csboling/AppData/Local/Programs/Python/Python35/python.exe")
 '(explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
 '(magit-git-executable "C:/Program Files/Git/mingw64/bin/git")
 '(mocha-command "node_modules/mocha/bin/mocha")
 '(mocha-environment-variables "NODE_ENV=test")
 '(mocha-options "--recursive --compilers js:babel-core/register")
 '(mocha-which-node "node")
 '(package-selected-packages
   (quote
    (markdown-preview-mode react-snippets multiple-cursors wgrep-ag jsx-mode yaml-mode notmuch mu4e-maildirs-extension web-beautify mocha magit tide web-mode auctex scss-mode rainbow-mode sass-mode elpy pyvenv jedi-core python-environment python-mode projectile karma simple-httpd ag flycheck undo-tree yasnippet company ssh-agency use-package)))
 '(typescript-auto-indent-flag nil)
 '(web-mode-attr-indent-offset 2)
 '(web-mode-enable-auto-quoting nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:background "#500000")))))

(setq explicit-shell-file-name "C:/Program Files/Git/bin/bash.exe")
(setq shell-file-name explicit-shell-file-name)
(add-to-list 'exec-path "C:/Program Files/Git/bin")
