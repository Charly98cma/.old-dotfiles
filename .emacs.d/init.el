;;; init.el --- Carlos Miguel Alonso configuration
;;
;; Author: Carlos Miguel Alonso <1998cma@gmail.com>
;; URL: https://github.com/charly98cma/emacs.d


;;; Commentary:
;; My personal configuration, mainly for everyone who's interested on it :D


;;; Code:


;; User information
(setq user-full-name "Carlos Miguel Alonso")
(setq user-mail-address "1998cma@gmail.com")


;; Load basic Emacs configuration
(load "~/.dotfiles/.emacs.d/emacs_settings.el")

;; Load and configure installed packages
(load "~/.dotfiles/.emacs.d/emacs_packages.el")

;; Load the Org-mode configuration
(load "~/.dotfiles/.emacs.d/emacs_org-mode.el")

;; Programming related packages
(load "~/.dotfiles/.emacs.d/emacs_prog-lang.el")


(provide 'init)
;;; init.el ends here
