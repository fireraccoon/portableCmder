;; EMACS CONFIG FILE



;; Initial setup


;(package-initialize)

;; no useless GUI elements
(mapc (lambda (mode) (when (fboundp mode) (apply mode '(-1))))
      '(tool-bar-mode menu-bar-mode scroll-bar-mode))

;; no bell
(setq ring-bell-function 'ignore
      inhibit-startup-screen t
      indent-tabs-mode nil)



;; initial package setup
(push "~/use-package" load-path)
(require 'use-package)
(require 'package)
(mapc (lambda(p) (push p package-archives))
      '(
          ("melpa" . "http://melpa.org/packages/")
      )
)
(package-refresh-contents)
(package-initialize)


;; POWERLINE
(use-package powerline
  :init (powerline-default-theme)
  :ensure t)



;; MOE Theme
(use-package moe-theme
  :ensure t)
(moe-dark)









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



;


;; APPEARANCE









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












;; bury *compile* buffer instead of kill it
(defadvice kill-buffer (around kill-buffer-around-advice activate)
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*Compile-Log*")
        (bury-buffer)
      ad-do-it)))

