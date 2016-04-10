;; https://www.masteringemacs.org/article/compiling-running-scripts-emacs
;; For inserting a Python breakpoint on F5

(defun python-insert-breakpoint ()
  "Inserts a python breakpoint using `pdb'"
  (interactive)
  (back-to-indentation)
  ;; this preserves the correct indentation in case the line above
  ;; point is a nested block
  (split-line)
  (insert python--pdb-breakpoint-string))

(defun python--add-debug-highlight ()
  "Adds a highlighter for use by `python--pdb-breakpoint-string'"
  (highlight-lines-matching-regexp "# DEBUG #\\s-*$" 'hi-red-b))

(defvar python--pdb-breakpoint-string "import pdb; pdb.set_trace()  # DEBUG #"
  "Python breakpoint string used by `python-insert-breakpoint'")


(use-package python-mode
  :config
  (add-hook 'python-mode-hook 'python--add-debug-highlight)
  :bind
  (:map python-mode-map
   ("<f5" . python-insert-breakpoint)))

(use-package python-environment)

(use-package jedi-core)

(use-package pyvenv
  :bind
  (:map pyvenv-mode-map
   ("C-c C-z" . pyvenv-restart-python)))

(use-package elpy
  :config
  (elpy-enable)
  (setq elpy-rpc-backend "jedi"))

;; Ignore the following errors:
;; E70  - Put semicolon-separated compound statement on separate lines
;; E301 - Put a blank line between a class declaration and its first method declaration.
(use-package py-autopep8
  :config
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))
