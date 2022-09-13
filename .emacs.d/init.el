;; Njord Emacs configuration file

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages '(lsp-mode
				  lsp-ui
				  lsp-treemacs
				  go-mode
				  company
				  magit
				  pdf-tools
				  treemacs
				  yasnippet
				  rainbow-delimiters
				  dracula-theme))
(setq custom-safe-themes
      '("fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7"))
(load-theme 'dracula)

(add-to-list 'default-frame-alist
	     '(font . "DejaVu Sans Mono-10"))

(ido-mode 1)
(add-hook 'lsp-mode-hook (lambda ()
			   (lsp-ui-mode)
			   (lsp-ui-doc-enable)))
(require 'lsp-mode)
(require 'dired-x)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook (lambda ()
			    (flyspell-prog-mode)
			    (rainbow-delimiters-mode)
			    (setq display-line-numbers 'relative) 
			    (treemacs)
			    #'lsp-deferred))

(add-hook 'go-mode-hook (lambda ()
			  (add-hook 'before-save-hook #'lsp-format-buffer t t)
			  (add-hook 'before-save-hook #'lsp-organize-imports
				    t t)))
