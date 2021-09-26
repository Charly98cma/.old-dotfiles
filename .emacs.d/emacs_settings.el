;;; emacs_settings.el --- Plain emacs settings
;;
;; Author: Carlos Miguel Alonso <1998cma@gmail.com>
;; URL: https://github.com/charly98cma/emacs.d


;;; Commentary:
;; File that establish establish the basic Emacs configuration


;;; Code:


;; Load newest byte-code
(setq load-prefer-newer t)

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Package management
(eval-when-compile
  (defvar package-archives))
(setq package-archives '(
			 ("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (add-to-list
;;    (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
;;    (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/")))
;;   )
   
(package-initialize)
(package-refresh-contents)
(package-install 'use-package)

;; TODO: Add auto-install packages
(unless (featurep 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))


;; Start-up Options
(tooltip-mode -1)
(tool-bar-mode -1)
(set-window-fringes nil 0 0)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(electric-pair-mode 1)
(show-paren-mode 1)
(setq custom-file "~/.emacs.d/.emacs-custom.el")


;; Delete the selected text when key pressed
(delete-selection-mode t)


;; Splash-screen
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)


;; Indentation
(setq tab-width 2
      indent-tabs-mode nil)


;; Max. chars per line (auto-fill-mode)
(add-hook 'text-mode-hook #'auto-fill-mode)
(add-hook 'prog-mode-hook #'auto-fill-mode)
(setq-default fill-column 80)


;; yes/no --> y/n
(defalias 'yes-or-no-p 'y-or-n-p)


;; No Backup and Autosaves (thanks Git ;D)
(setq make-backup-files nil)
(setq auto-save-default nil)


;; Marking text
(transient-mark-mode t)
(setq select-enable-clipboard t)


;; Auto-indent new line
(global-set-key (kbd "RET") 'newline-and-indent)


;; Personal key bindings
(global-set-key (kbd "C-,") 'comment-or-uncomment-region)


;; Text-scale
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)


;; Column numbers enabled
(setq column-number-mode t)


;; Line number
(global-display-line-numbers-mode)
(global-hl-line-mode +1)


;; Move-text
(provide 'move-text)
(move-text-default-bindings)


;; Custom font (I like Hack, but I'm looking for other fonts :D)
(add-to-list 'default-frame-alist '(font . "Hack 11"))
(set-face-attribute 'default nil :family "Hack 11")
(set-frame-font "Hack 11")

(use-package all-the-icons)

;; Whitespaces-cleanup-mode (melpa)
(global-whitespace-cleanup-mode)

;; Function to kill all buffers except the current one
(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(global-set-key (kbd "C-x C-k") 'kill-other-buffers)


(provide 'emacs_settings)
;;; emacs_settings.el ends here
