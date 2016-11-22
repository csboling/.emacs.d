(load-user-file "karma-emacs.el")
(load-user-file "karma.el")
(use-package karma)
(setq js-indent-level 2)

(defun bind-mocha-test-key nil
  (local-set-key (kbd "C-c C-t") #'mocha-test-file))

(add-hook 'js-mode-hook 'bind-mocha-test-key)
(add-hook 'web-mode-hook 'bind-mocha-test-key)
