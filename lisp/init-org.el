;; org mode
(require 'org)
(setq org-src-fontify-natively t)
;; set default Org Agenda file directory
(setq org-agenda-files '("~/orgs"))
;; show the latex 
;; (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
;; auto image 
;; (auto-image-file-mode t)

;; (iimage-mode t)

;;
(add-hook 'org-mode-hook 
	  (lambda () (setq truncate-lines 't)))

(provide 'init-org)
