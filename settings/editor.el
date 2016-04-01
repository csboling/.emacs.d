(setq gnus-verbose         10
      fill-column          80
      column-number-mode   t
      electric-indent-mode nil)
(setq-default indent-tabs-mode nil)
(show-paren-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'after-init-hook 'global-company-mode)

(global-auto-revert-mode t)
(global-undo-tree-mode)
