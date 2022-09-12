;; Njord Emacs configuration file

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq package-selected-packages '(lsp-mode
				  go-mode
				  company
				  dracula-theme
				  ))
(setq custom-safe-themes
      '("fe1c13d75398b1c8fd7fdd1241a55c286b86c3e4ce513c4292d01383de152cb7"))
(load-theme 'dracula)

(ido-mode 1)
(require 'lsp-mode)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook (lambda ()
			   (setq line-number-mode 'relative) 
			   #'lsp-deferred))

