;;; emacs_prog-lang.el --- Carlos Miguel Alonso configuration
;;
;; Author: Carlos Miguel Alonso <1998cma@gmail.com>
;; URL: https://github.com/charly98cma/emacs.d


;;; Commentary:
;; Packages related to programming


;;; Code:


;; Markdown
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'"       . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


;; lsp-mode (autocompletition and syntax suggestions)
(use-package lsp-mode
  :ensure t
  :init (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
	 (bash-mode . lsp) ;; bash-ls
	 (python-mode . lsp) ;; pyls (Install with pip)
	 (elixir-mode . lsp) ;; elixir-ls (Add language_server.sh to PATH)
	 (java-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
(use-package lsp-ui
  :ensure t
  :bind (("C-c l i" . lsp-ui-imenu)
	 ("C-c l d f" . lsp-ui-doc-focus-frame))
  :init (lsp-ui-mode)
  (lsp-ui-doc-mode)
  (setq lsp-ui-doc-delay 1))

(add-hook 'prog-mode-hook 'lsp-ui-sideline-mode)


;; Elixir mode
(use-package elixir-mode
  :ensure t)
(use-package alchemist
  :ensure t)
(add-hook 'elixir-mode-hook
	  (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))


;; Java stuff
(eval-when-compile
  (defvar c-basic-offset))
(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 2
				  tab-width 2
				  indent-tabs-mode t)))


;; Matlab (thanks @ignaciobll -> github.com/ignaciobll/.emacs.d)
;; (use-package matlab-mode
;;   :ensure t
;;   :mode ("\\.m$\\'" . matlab-mode)
;;   :config
;;   (setq matlab-indent-function t)
;;   (setq matlab-shell-command "matlab")
;;   (setq matlab-shell-command-switches (list "-nodesktop")))


;; MIPS
;; (require 'mips-mode)


;; Python
(use-package elpy
  :ensure t
  :init
  (elpy-enable))


;; Shell-script-mode (specifically for zsh files)
(add-to-list 'auto-mode-alist '("\\.zsh$" . shell-script-mode))


;; Conf-mode
(add-to-list 'auto-mode-alist '("\\.gitconfig$" . conf-mode))


(provide 'emacs_prog-lang.el)
;;; emacs_prog-lang.el ends here
