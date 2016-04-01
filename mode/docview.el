(when (string= system-type "windows-nt")
  (setq doc-view-dvipdf-program      "dvipdfmx"
        doc-view-ghostscript-program "gswin32c"))

;; Disable global minor modes for text editing that crash docview
(add-hook 'doc-view-minor-mode-hook 'auto-revert-mode)
(add-hook 'doc-view-minor-mode-hook 'undo-tree-mode)
