;; TeX settings
(require 'tex-site)
(setq TeX-auto-save  t
      TeX-parse-self t
      TeX-PDF-mode   t
)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'flyspell-mode)
