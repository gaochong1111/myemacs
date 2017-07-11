;; ui configuration

; turn off bar and scroll 
(tool-bar-mode -1)
(scroll-bar-mode -1)
; turn off splash screen
(setq inhibit-splash-screen t)

; set cursor type |
(setq-default cursor-type 'bar)

;; full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;; highlight curent line
(global-hl-line-mode t)

(provide 'init-ui)
