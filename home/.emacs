;; EMACS CONFIG FILE

;; Package Management
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; PACKAGES BEGIN

;; Powerline
(require 'powerline)
(powerline-default-theme)

;; PACKAGES END






;; APPEARANCE

;; THEME
;;customize theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
(add-to-list 'load-path "~/.emacs.d/moe-theme.el/")
(require 'moe-theme)
;; Choose what you like, (moe-light) or (moe-dark)
(moe-dark)












;; case swapping
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; keep slightly more sensitive information in a separate file so that main configuration can easily be publish  
(load "~/.emacs.secrets" t)


;; file backups
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
(setq make-backup-files nil) ;; Set no backup


;; Delete GUI
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode 1)
  (scroll-bar-mode -1))

;; Line numbers
(global-linum-mode t)


