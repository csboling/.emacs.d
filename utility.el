(defun isearch-other-window ()
  (interactive)
  (save-selected-window
    (other-window 1)
    (isearch-forward)))
(global-set-key (kbd "C-M-S") 'isearch-other-window)
