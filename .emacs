
;; Appereance
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai)

;; remove unecessary UI
(menu-bar-mode -1)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(setq visible-bell 1)
(setq ring-bell-function 'ignore)

;; startup screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; faster to quit
(fset 'yes-or-no-p 'y-or-n-p)

;; move faster up and down faster
(global-set-key (kbd "M-n") (kbd "C-u 5 C-n"))
(global-set-key (kbd "M-p") (kbd "C-u 5 C-p"))

;; display time
(load "time" t t)
(display-time)

;; line and column numbering
(column-number-mode 1)
(line-number-mode 1)

;; Setup the package manager
(defun load-package-manager ()
  (package-initialize)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/")))
(add-hook 'after-init-hook 'load-package-manager)

