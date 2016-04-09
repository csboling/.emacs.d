(use-package elpy
  :ensure
  jedi-core
  :init
  (elpy-enable)
  (setq elpy-rpc-backend "jedi"))

(use-package pyvenv
  :init
  (define-key pyvenv-mode-map (kbd "C-c C-z") 'pyvenv-restart-python))

(use-package py-autopep8
  :init
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))
