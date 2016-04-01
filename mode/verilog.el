(setq verilog-auto-indent-on-newline nil)
(eval-after-load 'verilog-mode
    '(progn
        ;; same for all the electric-verilog-* commands in
        ;; the mode's map (see verilog-mode.el)
        (define-key verilog-mode-map (kbd ";") 'self-insert-command)
        (define-key verilog-mode-map (kbd ":") 'self-insert-command)
        (define-key verilog-mode-map (kbd "TAB") 'tab-to-tab-stop)))
