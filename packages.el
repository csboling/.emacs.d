(when (< emacs-major-version 23)
  (require 'package)
)
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://stable.melpa.org/packages/")))
(package-initialize)

;(require 'tramp)
;(require 'undo-tree)
