;; init keybidings

(global-set-key (kbd "<f2>") 'open-my-emacs-conf-file)

;; ivy mode
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;; set org-agenda key
(global-set-key (kbd "C-c a") 'org-agenda)

;; set help key
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-keqy)

;; set recent file 
(global-set-key "\C-x\ \C-h" 'recentf-open-files)

;; set counsel-git
(global-set-key (kbd "C-c p f") 'counsel-git)

;; indent buffer or region

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; hipppie
(global-set-key (kbd "M-/") 'hippie-expand)

;; dired mode
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; occur mode
(global-set-key (kbd "M-s o") 'occur-dwim)

;; imenu mode
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; expand mode
(global-set-key (kbd "C-=") 'er/expand-region)

;; iedit mode
(global-set-key (kbd "M-s e") 'iedit-mode)

(provide 'init-keybindings)


