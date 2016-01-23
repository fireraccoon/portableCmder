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
 ;; :init (powerline-nano-theme)
  :init (powerline-default-theme)
  :ensure t)



;; MOE Theme
(use-package moe-theme
  :ensure t)
(moe-dark)



;; DRAG STUFF
(use-package drag-stuff
  :init (drag-stuff-global-mode)
  :ensure t)


(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  :ensure t)

;; ace-jump
(use-package ace-jump-mode
  :init (define-key global-map (kbd "C-c c") 'ace-jump-mode)
  :ensure t)

;; ace-window
(use-package ace-window
  :ensure t)
(global-set-key (kbd "M-p") 'ace-window)

;(use-package minimap
;  :init (drag-stuff-global-mode)
;  :ensure t)



;; lua mode
(use-package lua-mode
  :ensure t)

;; JDEE (Java)
(use-package jdee
  :ensure t)

;; auto complete
(use-package auto-complete
  :init (auto-complete-mode)
  :ensure t)
(auto-complete-mode)

;; PACKAGE END

;; IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq ido-create-new-buffer 'always) ; Create buffer when C-x b buffer does not existe





;; APPEARANCE

;; Line and column numbers
(global-linum-mode t)
(column-number-mode 1)
(global-hl-line-mode 1) ; turn on highlighting current line


;; fonts



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

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #auto-save# files

;; Delete GUI
(when window-system
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode 1)
  (scroll-bar-mode -1))













;; bury *compile* buffer instead of kill it
(defadvice kill-buffer (around kill-buffer-around-advice activate)
  (let ((buffer-to-kill (ad-get-arg 0)))
    (if (equal buffer-to-kill "*Compile-Log*")
        (bury-buffer)
      ad-do-it)))






;; CUSTOM KEY BINDINGS

;; Duplicate Line
(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (next-line arg))
(global-set-key (kbd "C-c C-d") 'duplicate-line)


;; Select Line
(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

;; Delete current line (kill current line)
(global-set-key (kbd "C-c C-k") 'kill-whole-line) 
;; Open shell




