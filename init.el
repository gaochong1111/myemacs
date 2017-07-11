
;; package initialize, find some features and load some config file
(package-initialize)


(defun open-my-emacs-conf-file ()
  "open my emacs configuration file."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; add load path
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
(put 'narrow-to-region 'disabled nil)
