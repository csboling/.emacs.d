(defun isearch-other-window ()
  (interactive)
  (save-selected-window
    (other-window 1)
    (isearch-forward)))
(global-set-key (kbd "C-M-S") 'isearch-other-window)

(defun replace-last-sexp ()
    (interactive)
    (let ((value (eval (preceding-sexp))))
      (kill-sexp -1)
      (insert (format "%S" value))))
(global-set-key (kbd "C-x M-r") 'replace-last-sexp)
