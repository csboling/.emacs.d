;; (use-package tss
;;   :init
;;   (typescript-auto-indent-flag nil))
(use-package web-mode)
(use-package tide
  :config
  (add-hook 'typescript-mode-hook
    (lambda ()
      (tide-setup)
      (flycheck-mode +1)
      (setq flycheck-check-syntax-automatically '(save mode-enabled))
      (eldoc-mode +1)
      ;; company is an optional dependency. You have to
      ;; install it separately via package-install
      (company-mode)))

  ;; aligns annotation to the right hand side
  (setq company-tooltip-align-annotations t)

  ;; Tide can be used along with web-mode to edit tsx files
  (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook
    (lambda ()
      (when (string-equal "tsx" (file-name-extension buffer-file-name))
        (tide-setup)
        (flycheck-mode +1)
        (setq flycheck-check-syntax-automatically '(save mode-enabled))
        (eldoc-mode +1)
        (company-mode)))))
