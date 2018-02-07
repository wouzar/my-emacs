
;; Personal information
(setq user-full-name "Victor Moskvych"
      user-mail-address "wouzar@gmail.com")

;; Load different lisp files for different stuff
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; sensible-defaults
(load-file "~/.emacs.d/lisp/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)
(sensible-defaults/backup-to-temp-directory)

;; Appereance
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'solarized-light)

;; bullets mode
(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda ()
	    (org-bullets-mode t)))

;; hide leading stars
(setq org-hide-leading-stars t)

(setq org-ellipsis "⬎")

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
(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; move lines
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

;; -----------------------------------------
;; ORG-MODE --------------------------------
;; -----------------------------------------

;; agenda-files
(setq org-agenda-files '("~/Dropbox/org"))

;; bindings
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; default file for notes
(setq org-default-notes-file "~/Dropbox/org/index.org")

;; configure org-refile for viewing heading up to 6th depth
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

;; use ido completions for org-mode
(ido-mode)
(setq org-completion-use-ido t)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
;; (defconst refile-path "~/Dropbox/org/index.org" "File path for all notes")
;; (setq org-capture-templates
;;       (quote (("t" "todo" entry (file refile-path)
;;                "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
;;               ("r" "respond" entry (file refile-path)
;;                "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
;;               ("n" "note" entry (file refile-path)
;;                "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
;;               ("j" "Journal" entry (file+datetree refile-path)
;;                "* %?\n%U\n" :clock-in t :clock-resume t)
;;               ("w" "org-protocol" entry (file refile-path)
;;                "* TODO Review %c\n%U\n" :immediate-finish t)
;;               ("m" "Meeting" entry (file refile-path)
;;                "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
;;               ("p" "Phone call" entry (file refile-path)
;;                "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
;;               ("h" "Habit" entry (file refile-path)
;;                "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;; -----------------------------------------
;; REGISTERS -------------------------------
;; -----------------------------------------

(set-register ?i (cons 'file "~/Dropbox/org/index.org"))
(set-register ?e (cons 'file "~/.emacs.d/.emacs"))

;; -----------------------------------------
;; ACE JUMP --------------------------------
;; -----------------------------------------
(add-to-list 'load-path "~/.emacs.d/lisp/ace-jump-mode.el")
  (require 'ace-jump-mode)
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

  ;; If you also use viper mode:
  ;; (define-key viper-vi-global-user-map (kbd "SPC") 'ace-jump-mode)


;; -----------------------------------------
;; HASKELL ---------------------------------
;; -----------------------------------------
;; NOTE: install haskell-mode, hacktags and hindent packages from MELPA !
;; also hacktags and hindent from cabal

(add-hook 'haskell-mode-hook #'hindent-mode)
;; call M-q to reformat current declaration


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
