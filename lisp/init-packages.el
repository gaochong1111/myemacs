;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |

;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; Add Packages
(defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		;; hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		;; js2-mode
		;; --- Minor Mode ---
		;; nodejs-repl
;;		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme
		popwin
		;; a java ide
		;;	meghanada

		expand-region
		iedit
		) "Default packages")

;; set selected packages
(setq package-selected-packages my/packages)
;; install unintalled packages in the selected package list
(defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

;; set package config

;; set company mode
(add-hook 'after-init-hook 'global-company-mode)

;; set hungry-mode 
;; (require 'hungry-delete)
;; (global-hungry-delete-mode)

;; set ivy mode
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; set smartparens
;; (require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; set js momde
;; (setq auto-mode-alist
;;      (append
;;       '(("\\.js\\'" . js2-mode))
;;       auto-mode-alist))
;; require nodejs run environment
;; (require 'nodejs-repl)

; set theme monokai
(load-theme 'monokai 1)

;; set popwin mode
(require 'popwin)
(popwin-mode 1)

;; set meghanada
;; (require 'meghanada)
;; (add-hook 'java-mode-hook
;;          (lambda ()
;;            ;; meghanada-mode on
;;            (meghanada-mode t)
;;            (setq c-basic-offset 2)
;;            ;; use code format
;;            (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))

(provide 'init-packages)

