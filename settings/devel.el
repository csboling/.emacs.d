(use-package magit
  :ensure ssh-agency
  :init
  (global-set-key (kbd "C-x g") 'magit-status)
  (setenv "SSH_ASKPASS" "git-gui--askpass"))
