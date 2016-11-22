(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-hook 'web-mode-hook
            (lambda ()
              (if (equal web-mode-content-type "javascript")
                  (web-mode-set-content-type "jsx")
                (message "now set to: %s" web-mode-content-type))))
  (add-hook 'web-mode-hook
            (lambda ()
              (local-set-key (kbd "M-;") 'comment-dwim)))
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        js-indent-level 2
        web-mode-enable-auto-pairing nil
        web-mode-enable-auto-quoting nil)
  (setq-default web-mode-comment-formats
              '(("javascript" . "//")
                ("jsx"        . "//"))))
