(when (< emacs-major-version 23)
  (require 'package))
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))
(package-refresh-contents)
(package-initialize)

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)
