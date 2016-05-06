;; TeX settings
(use-package tex-site
  :ensure auctex
  :config
  (setq TeX-auto-save  t
        TeX-parse-self t
        TeX-PDF-mode   t
        TeX-command    "pdflatex")
  (setq-default TeX-master nil)
  (add-hook 'TeX-mode-hook 'flyspell-mode)
  (add-hook 'TeX-mode-hook
    (lambda () (TeX-fold-mode 1))))
