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

;; Load newest byte-code
(setq load-prefer-newer t)

;; Package management
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/"))
  (package-initialize))
(unless (featurep 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

;; Start-up Options
(tooltip-mode            -1)
(tool-bar-mode           -1)
(menu-bar-mode           -1)
(scroll-bar-mode         -1)
(electric-pair-mode       1)
(show-paren-mode          1)
(set-window-fringes nil 0 0)
(setq custom-file "~/.emacs.d/.emacs-custom.el")
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Delete the selected text when key pressed
(delete-selection-mode t)

;; Splash-screen
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)

;; Indentation
(setq tab-width 2
	indent-tabs-mode nil)

;; yes/no --> y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Backup and Autosaves (thanks Git ;D)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Marking text
(transient-mark-mode t)
(setq select-enable-clipboard t)

;; Personal key bindings
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-,") 'comment-or-uncomment-region)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; Column numbers enabled
(setq column-number-mode t)

;; Line number
(global-display-line-numbers-mode)
(global-hl-line-mode +1)

;; Move-text
(move-text-default-bindings)

;; Custom font (I like Hack, but I'm looking for other fonts :D)
(add-to-list 'default-frame-alist '(font . "Hack 11"))
(set-face-attribute 'default nil :family "Hack 11")
(set-frame-font "Hack 11")

;; Markdown
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; Modeline
(use-package doom-modeline
	     :ensure t
	     :defer t
	     :hook (after-init . doom-modeline-mode))

(setq doom-modeline-height 10)
(setq doom-modeline-buffer-file-name-style 'truncate-from-project)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-minor-modes nil)
(setq doom-modeline-lsp nil)
(setq doom-modeline-github t)
(setq doom-modeline-github-interval (* 30 60))
(setq find-file-visit-truename t)


;; Doom themes
(use-package doom-themes
	     :ensure t
	     :init (load-theme 'doom-vibrant t)
	     :config (doom-themes-org-config)
	             (doom-themes-neotree-config))

;; Helm configuration
(use-package helm
	     :ensure t
	     :init (helm-mode 1)
	     :config (require 'helm-config
			      (setq helm-split-window-inside-p t
				    helm-buffers-fuzzy-matching t
				    helm-recentf-fuzzy-match t
				    helm-move-to-line-cycle-in-source t
				    helm-M-x-fuzzy-match nil))
	     :bind (("C-x C-f" . helm-find-files)
		    ("M-x" . helm-M-x)
		    ("C-x b" . helm-mini)
		    ("C-x C-b" . helm-buffers-list)
		    ("C-c g" . helm-google-suggest)))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)


;; Movement through buffer with arrows
(use-package windmove
	     :ensure t
	     :bind (("C-<up>" . windmove-up)
		    ("C-<down>" . windmove-down)
		    ("C-<right>" . windmove-right)
		    ("C-<left>" . windmove-left)))


;;; EXTERNAL PACKAGES

;; Whitespaces-cleanup-mode (melpa)
(global-whitespace-cleanup-mode)


;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind(("C-c mc" . mc/edit-lines)
	("C->" . mc/mark-next-like-this)
	("C-<" . mc/mark-previous-like-this)
	("C-c C-<" . mc/mark-all-like-this)))
;; C-' -> Hide/Unhide all lines without a cursor
;; C-g -> exit


;; Undo-tree
(use-package undo-tree
  :ensure t)
(global-undo-tree-mode t)


;; Autopair-mode (closes a brace structure as soon as the opening char os typed)
(eval-after-load "autopair-autoloads" ; <-- "autopair-autoloads" not "autopair"
  '(progn
     (require 'autopair)
     (autopair-global-mode 1)))


;; Rainbow delimiters
(use-package rainbow-delimiters
	     :ensure t
	     :init
	     (add-hook 'prog-mode-hook 'rainbow-delimiters-mode 1))
(show-paren-mode t)


;; All-the-icons
(use-package all-the-icons
	     :ensure t)

;; Neotree (to be hones, I don't use it)
(use-package neotree
  :ensure t
  :bind (("C-x n" . neotree-toggle))
  :config (setq-default neo-show-hidden-files t)
  (setq neo-smart-open t))
(setq neo-theme (if (display-graphic-p) 'icons)) ; Display icons
;; Neotree commands
;; C-x n -> open/close neotree
;; g -> refresh
;; H -> show hidden files
;; C-c C-n -> Create file (dir if end with "/")
;; C-c C-d -> Delete file/dir
;; C-c C-r -> Rename file/dir
;; C-c C-p -> Copy file/dir


;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(use-package yasnippet-snippets
	     :ensure t)


;; Company
(use-package company
	     :ensure t
	     :init (global-company-mode)
	     :bind ("C-<tab>" . company-yasnippet))
(add-hook 'after-init-hook 'global-company-mode) ; Enabled on all buffers
;; Company-quickhelp
(use-package company-quickhelp
  :ensure t
  :init (company-quickhelp-mode 1)
  :config (eval-after-load 'company
            '(define-key company-active-map (kbd "C-c h") #'company-quickhelp-manual-begin)))


;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
)


;; Ispell and Flyspell
(require 'ispell)
(setq ispell-dictionary "english")
(add-to-list 'ispell-dictionary-alist '("spanish"))
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'text-mode-hook 'flyspell-mode)


;; hl-todo-mode REVIEW: Test if this works with defvar
(defvar hl-todo-keyword-faces
      '(("TODO"   . "#FF0000")
        ("FIXME"  . "#FF0000")
        ("DEBUG"  . "#A020F0")
        ("GOTCHA" . "#FF4500")
        ("STUB"   . "#1E90FF")
	("REVIEW" . "#1E90FF")))
;; REVIEW: Solve 'assignment to free variable' on this commented lines
;; (define-key hl-todo-mode-map (kbd "C-c p") 'hl-todo-previous)
;; (define-key hl-todo-mode-map (kbd "C-c n") 'hl-todo-next)
;; (define-key hl-todo-mode-map (kbd "C-c o") 'hl-todo-occur)
;; (define-key hl-todo-mode-map (kbd "C-c i") 'hl-todo-insert)
(global-hl-todo-mode 1)


;; Indent fucking Whole Buffer (by github.com/skgsergio)
;; Also, thanks to Alfedi for sharing his emacs config (github.com/Alfedi/.emacs.d)
(defun iwb ()
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  (message "indent buffer: done.")
)
(global-set-key (kbd "M-i") 'iwb)


;; TOC-ORG
(use-package toc-org
  :ensure t
  :init (add-to-list 'org-tag-alist '("TOC" . ?T)))


;; ORG-MODE CONFIGURATION

;; Settings
(setq org-log-done t)

;; Org-Agenda
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-show-log t)
(setq org-agenda-todo-ignore-scheduled t)
(setq org-agenda-todo-ignore-deadlines t)


;; Org-Habit
(require 'org)
(require 'org-install)
(require 'org-habit)
(add-to-list 'org-modules "org-habit")
(setq org-habit-preceding-days 7
	org-habit-following-days 1
      	org-habit-graph-column 80
      	org-habit-show-habits-only-for-today t
      	org-habit-show-all-today t)


;; Org-Babel
(require 'ob)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (ditaa . t)
   (plantuml . t)
   (dot . t)
   (ruby . t)
   (js . t)
   (C . t)))
(setq org-src-fontify-natively t
      org-confirm-babel-evaluate nil)

(add-hook 'org-babel-after-execute-hook (lambda ()
                                          (condition-case nil
                                              (org-display-inline-images)
                                            (error nil)))
    	  'append)

;; Org-abbrev
(add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))

;; Org-Reveal
;; (use-package ox-reveal
;;   :ensure t
;;   :config
;;   (setq org-reveal-root "file:///home/carlos/.reveal.js"))



;;; PROGRAMMING LANGUAGES AND MORE STUFF

;; Matlab (thanks @ignaciobll -> github.com/ignaciobll/.emacs.d)
(use-package matlab-mode
  :ensure t
  :mode ("\\.m$\\'" . matlab-mode)
  :config
  (setq matlab-indent-function t)
  (setq matlab-shell-command "matlab")
  (setq matlab-shell-command-switches (list "-nodesktop")))


;; MIPS
(require 'mips-mode)


;; Python
(use-package elpy
  :ensure t
  :init
  (elpy-enable))


;; Shell-script-mode (specifically for zsh files)
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))


;; Conf-mode
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))


(provide 'init)
;;; init.el ends here
