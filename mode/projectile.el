(use-package projectile
  :init
  (projectile-global-mode 1))

(use-package helm
  :ensure projectile
  :init
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien))
