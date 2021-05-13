;;; emacs_packages.el --- Carlos Miguel Alonso configuration
;;
;; Author: Carlos Miguel Alonso <1998cma@gmail.com>
;; URL: https://github.com/charly98cma/emacs.d


;;; Commentary:
;; File that load and condigures the installed packages

;;; Code:

;; Modeline (I love the the doom modeline)
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



;; Doom themes (I aso love the doom themes :D)
(use-package doom-themes
  :ensure t
  :init (load-theme 'doom-vibrant t)
  :config (doom-themes-org-config)
  (doom-themes-neotree-config))


;; Helm configuration
(eval-when-compile
  (defvar helm-buffers-fuzzy-matching)
  (defvar helm-recentf-fuzzy-match)
  (defvar helm-M-x-fuzzy-match))
(use-package helm
  :ensure t
  :init (helm-mode 1)
  :config (require 'helm-config
		   (setq helm-split-window-inside-p  t
			 helm-buffers-fuzzy-matching t
			 helm-recentf-fuzzy-match    t
			 helm-move-to-line-cycle-in-source t
			 helm-M-x-fuzzy-match nil))
  :bind (("C-x C-f" . helm-find-files)
	 ("M-x"     . helm-M-x)
	 ("C-x b"   . helm-mini)
	 ("C-x C-b" . helm-buffers-list)
	 ("C-c g"   . helm-google-suggest)))
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)


;; Movement through buffer with arrows
(use-package windmove
  :ensure t
  :bind (("C-<up>"    . windmove-up)
	 ("C-<down>"  . windmove-down)
	 ("C-<right>" . windmove-right)
	 ("C-<left>"  . windmove-left)))


;; Multiple cursors
(use-package multiple-cursors
  :ensure t
  :bind(("C-c m c" . mc/edit-lines)))
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


;; All-the-icons
(use-package all-the-icons
  :ensure t)


;; Yasnippets
(use-package yasnippet
  :ensure t
  :init (yas-global-mode t)
  :bind ("C-<tab>" . yas-expand))
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
  :init (global-flycheck-mode))


;; Ispell and Flyspell
(require 'ispell)
(setq ispell-dictionary "english")
(add-to-list 'ispell-dictionary-alist '("spanish"))
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'text-mode-hook 'flyspell-mode)


;; hl-todo-mode
(defvar hl-todo-keyword-faces
  '(("TODO"   . "#FF0000")
    ("FIXME"  . "#FF0000")
    ("DEBUG"  . "#A020F0")
    ("REVIEW" . "#1E90FF")
    ("DOING"  . "#49FF00")))
(global-hl-todo-mode 1)
(eval-when-compile
  (defvar hl-todo-mode-map))
(define-key hl-todo-mode-map (kbd "C-c p") 'hl-todo-previous)
(define-key hl-todo-mode-map (kbd "C-c n") 'hl-todo-next)
(define-key hl-todo-mode-map (kbd "C-c o") 'hl-todo-occur)
(define-key hl-todo-mode-map (kbd "C-c i") 'hl-todo-insert)


;; Indent Whole Buffer (by github.com/skgsergio)
;; Also, thanks to Alfedi for sharing his emacs config (github.com/Alfedi/.emacs.d)
(defun iwb ()
  "Indent the whole buffer, following the indentation rules of the text/code."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  (message "Indent buffer: DONE"))
(global-set-key (kbd "M-i") 'iwb)


;; Which-key (little help with key bindings)
(use-package which-key
  :ensure t
  :config (which-key-mode))
(which-key-setup-side-window-right)


(provide 'emacs_packages.el)
;;; emacs_packages.el ends here
