(add-hook 'c-mode-common-hook
  (lambda ()
    (define-key c-mode-base-map (kbd "C-c C-l") 'compile)
  )
)
