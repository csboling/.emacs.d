;; C settings
(setq c-default-style "linux"
      c-basic-offset  2)
(setq gdb-many-windows t)
(setq gdb-show-main t)

(defun c-mode-launch-debugger () nil
  (interactive)
  (compile "make -k")
  (gdb "gdb -i=mi a.exe"))

(add-hook 'c-mode-common-hook
  (lambda ()
    (local-set-key
      (kbd "C-c C-z")
      'c-mode-launch-debugger)))
