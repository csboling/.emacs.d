(use-package rainbow-mode)

(use-package scss-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
  (add-hook 'css-mode-hook 'rainbow-mode))
