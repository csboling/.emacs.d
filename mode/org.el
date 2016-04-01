;; org
(add-hook 'org-mode-hook 'turn-on-font-lock)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-todo-keywords    '((sequence "TODO" "STARTED" "WAITING" "DONE"))
      org-directory        "~/org"
      org-mobile-directory "~/.org-mobile")
(defadvice org-mobile-push
           (after org-copy-after-push ())
           (shell-command
             (concat "cp -R "
                     org-mobile-directory
                     "/* `~/.dotfiles/find_phone.sh`/Phone/sched")))

(defadvice org-mobile-pull
           (before org-copy-before-pull ())
           (shell-command
             (concat "cp -R"
                     "`~/.dotfiles/find_phone.sh`/Phone/sched/*"
                     org-mobile)))
