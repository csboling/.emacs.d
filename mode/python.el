(use-package elpy
  :ensure
  jedi-core
  :init
  (elpy-enable)
  (setq elpy-rpc-backend "jedi"))

(use-package pyvenv
  :init
  (define-key pyvenv-mode-map (kbd "C-c C-z") 'pyvenv-restart-python))

;; Ignore the following errors:
;; E70  - Put semicolon-separated compound statement on separate lines
;; E301 - Put a blank line between a class declaration and its first method declaration.
(use-package py-autopep8
  :init
  (setq py-autopep8-options '("--aggressive" "--aggressive" "--ignore E702,301"))
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

;; https://www.masteringemacs.org/article/compiling-running-scripts-emacs
;; For inserting a Python breakpoint on F5
(defun python--add-debug-highlight ()
  "Adds a highlighter for use by `python--pdb-breakpoint-string'"
  (highlight-lines-matching-regexp "# DEBUG #\\s-*$" 'hi-red-b))

(add-hook 'python-mode-hook 'python--add-debug-highlight)

(defvar python--pdb-breakpoint-string "import pdb; pdb.set_trace()  # DEBUG #"
  "Python breakpoint string used by `python-insert-breakpoint'")

(defun python-insert-breakpoint ()
  "Inserts a python breakpoint using `pdb'"
  (interactive)
  (back-to-indentation)
  ;; this preserves the correct indentation in case the line above
  ;; point is a nested block
  (split-line)
  (insert python--pdb-breakpoint-string))
(define-key python-mode-map (kbd "<f5>") 'python-insert-breakpoint)
