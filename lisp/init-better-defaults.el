;; better default configuration

;; turn off the belling 
(setq ring-bell-function 'ignore)

					; turn on the linum mode
(global-linum-mode t)

					; turn off the backup 
(setq make-backup-files nil)
(setq auto-save-default nil)

					;set recent mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; delete-selection-mode
(delete-selection-mode t)

;; add-hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; auto load the modified file on disk
(global-auto-revert-mode 1)

;; abbrev-mode
(abbrev-mode 1)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8gc" "gaochong")

					    ))
;; simplify yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; indent buffer or region
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;; hippie
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;; dired mode 
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
;; simplify the buffer 
(put 'dired-find-alternate-file 'disabled nil)
;; C-x C-j
(require 'dired-x)
;; set copy destination is the other directory
;; (setq dired-dwin-target 1)



;; quote in emacs lisp
;; (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
;; (sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;; 
(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)

;; show parens enclosing region
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))


;; hidden or delete \r

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; occur dwim 
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))




(provide 'init-better-defaults)

