
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

;; -----------------------------------------
;; KEY BINDINGS ----------------------------
;; -----------------------------------------

;; for config file
(global-set-key (kbd "<f6>") (lambda() (interactive)(find-file "~/.emacs.d/.emacs")))

;; for notes
(global-set-key (kbd "<f7>") (lambda() (interactive)(find-file "~/Dropbox/notes/core.org")))

;; -----------------------------------------
;; PLUGINS ---------------------------------
;; -----------------------------------------


;; wunderlast

;; IMPORTANT !!!
;; put this line into your ~/.folders file:
;; %inbox  "inbox"

;; IMAP, gmail:
(setq elmo-imap4-default-server "imap.gmail.com"
      elmo-imap4-default-user "wouzar@gmail.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl

      ;; For non ascii-characters in folder-names
      elmo-imap4-use-modified-utf7 t)

;; SMTP
(setq wl-smtp-connection-type 'starttls
      wl-smtp-posting-port 587
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "wouzar"
      wl-smtp-posting-server "smtp.gmail.com"
      wl-local-domain "gmail.com"
      wl-message-id-domain "smtp.gmail.com")

(setq wl-from "Victor Moskvych <wouzar@gmail.com>"

      ;; All system folders (draft, trash, spam, etc) are placed in the
      ;; [Gmail]-folder, except inbox. "%" means it's an IMAP-folder
      wl-default-folder "%inbox"
      wl-draft-folder   "%[Gmail]/Drafts"
      wl-trash-folder   "%[Gmail]/Trash"
      ;; The below is not necessary when you send mail through Gmail's SMTP server,
      ;; see https://support.google.com/mail/answer/78892?hl=en&rd=1
      ;; wl-fcc            "%[Gmail]/Sent"

      ;; Mark sent messages as read (sent messages get sent back to you and
      ;; placed in the folder specified by wl-fcc)
      wl-fcc-force-as-read    t

      ;; For auto-completing foldernames
      wl-default-spec "%")
