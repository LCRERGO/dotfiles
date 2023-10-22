;; Emacs configuration file

;; -- Prefix definitions
;; Set custom default file
(setq custom-file (concat user-emacs-directory "emacs-custom.el"))
(if (file-exists-p custom-file) (load custom-file) nil)

;; Set backup directories
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; -- General definitions
;; Deactivate bars
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; Mode hooks
;; Prog Mode hooks
(add-hook 'prog-mode-hook (lambda () (progn
				       (setq display-fill-column-indicator-column t)
				       (setq show-trailing-whitespace t)
				       (setq display-line-numbers-type 'relative)
				       (display-line-numbers-mode))))

;; Org mode hooks
(add-hook 'org-mode-hook (lambda () (progn
				      (setq display-line-numbers-type 'relative)
				      (display-line-numbers-mode))))

;; tab spacing size
(setq tab-width 4)
;; column number indicator on modeline
(column-number-mode)
;; Activate visual line mode
(setq global-visual-line-mode t)

;; Increase font-face
(global-set-key (kbd "C-+")
		(lambda ()
		  (interactive)
		  (let ((old-face-attribute (face-attribute 'default :height)))
		    (set-face-attribute 'default nil :height (+ old-face-attribute 5)))))

;; Decrease font-face
(global-set-key (kbd "C--")
		(lambda ()
		  (interactive)
		  (let ((old-face-attribute (face-attribute 'default :height)))
		    (set-face-attribute 'default nil :height (- old-face-attribute 5)))))


;; Activate I Do mode
(ido-mode 1)
(setq ido-enable-flex-matching t
      ido-everywhere t)

;; Alternative list-buffers
(defalias 'list-buffers 'ibuffer-other-window)

;; Package initialize
(require 'package)
(add-to-list 'package-archives
	     '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Auto Update packages
(use-package auto-package-update
  :config
  (setq auto-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; -- Visual
;; Default theme
(use-package dracula-theme
  :config (load-theme 'dracula t))

;; Icon Fonts
(use-package all-the-icons
  :if (display-graphic-p))

;; -- Utility
;; Autocompletion
(use-package company
  :delight
  :hook
  (prog-mode . company-mode)
  (text-mode . company-mode))

;; Colorize delimiters
(use-package rainbow-delimiters
  :delight
  :hook
  (prog-mode . rainbow-delimiters-mode))

;; Keychords hints
(use-package which-key
  :config (which-key-mode))

;; Language Server Protocol
(use-package lsp-mode
  :unless (eq major-mode 'emacs-lisp-mode)
  :hook
  (c-mode . lsp-deferred)
  (go-mode . lsp-deferred)
  (html-mode . lsp-deferred)
  (javascript-mode . lsp-deferred)
  :commands (lsp lsp-deferred))
(use-package lsp-ui
  :hook
  (lsp-deferred . lsp-ui-mode)
  (lsp-mode . lsp-ui-mode)
  :after
  lsp-deferred
  lsp
  :commands lsp-ui-mode)

;; Version control
(use-package magit)

;; File Tree
(use-package neotree
  :defer t
  :config (setq neo-theme
		(if (display-graphic-p) 'icons 'arrow))
  :bind (:map global-map
	      ("C-x C-n" . neotree-toggle)))

;; Spell check
(use-package flyspell
  :hook
  (text-mode . flyspell-mode))

;; Project management
(use-package projectile
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/Documents/Projects")))

;; -- Languages support
;; Scheme Language support
(use-package geiser
  :requires geiser-guile
  :mode "\\.scm\\'"
  :interpreter "scheme")

;; Web Languages (Html, CSS, Javascript, PHP)
(use-package web-mode
  :mode ("\\.html?\\'" "\\.css\\'" "\\.js\\'" "\\.php\\'"))
;; Tag expander
(use-package emmet-mode
  :diminish)

;; Golang Language support
(use-package go-mode
  :mode "\\.go\\'")

;; Org-mode configuration
(org-babel-do-load-languages
 'org-babel-load-languages
 '((scheme . t)))
