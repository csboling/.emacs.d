(tool-bar-mode -1)

(setq gnus-verbose         10
      fill-column          80
      column-number-mode   t
      electric-indent-mode nil)
(when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
(setq-default indent-tabs-mode nil)
(show-paren-mode 1)
(global-linum-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-auto-revert-mode t)

(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))

(use-package company
  :config
  (global-company-mode 1)
  (setq company-auto-complete t)
  (setq company-auto-complete-chars nil))
(use-package yasnippet
  :config
  (yas-global-mode 1))
(use-package undo-tree
  :init
  (global-undo-tree-mode 1))
(use-package flyspell
  :init
  (setq ispell-dictionary "english")
  :config
  (add-hook 'text-mode-hook 'flyspell-mode))
(use-package flycheck)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
