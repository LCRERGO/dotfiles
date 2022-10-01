;; Njord Emacs configuration file

;; Default disablings
(tool-bar-mode 0)        ; Disable toolbar
(scroll-bar-mode 0)      ; Disable visible scroll-bar


;; Basic configuration
(setq tab-width 4)             ; tab spacing size
(setq scroll-conservatively 1) ; scroll method
(column-number-mode)           ; column number indicator on modeline

(set-face-attribute
 'default nil :font "Hack Nerd Font Mono" :height 100)

;; Package configuration
(require 'package)
(setq package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
	("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Better completion mode
(use-package ivy
  :diminish
  :config
  (ivy-mode 1))

;; Colored Delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Key describer
(use-package which-key
  :init (which-key-mode)
  :diminish
  :config (setq which-key-idle-delay 0.3))


;; Mode hooks
(defun njord/prog-mode-variables ()
  (setq display-line-numbers 'relative)
  (setq display-fill-column-indicator-column t)
  (setq show-trailing-whitespace t))

(defun njord/prog-mode-minor-modes ()
  (flyspell-prog-mode)
  (global-display-fill-column-indicator-mode))

(add-hook 'prog-mode-hook (lambda ()
			    (njord/prog-mode-variables)
			    (njord/prog-mode-minor-modes)))
