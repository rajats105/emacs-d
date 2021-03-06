;;; xt-misc.el --- Project management
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:

;;------------------------------------------------------------------------------
;; Helm
;;------------------------------------------------------------------------------
;; http://tuhdo.github.io/helm-intro.html

(require-package 'helm)

(require 'helm)
(require 'helm-config)
(require 'helm-ring)
(require 'helm-misc)
(require 'helm-buffers)
(require 'helm-files)
(require 'helm-locate)
(require 'helm-bookmark)

(require-package 'helm-swoop)
(require-package 'helm-ag)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

;; Enable helm
(helm-mode 1)

;; Helm can now resize according to the number of candidates
;; (helm-autoresize-mode 1)


(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(global-set-key (kbd "C-x C-m") 'helm-M-x)
;; (global-set-key (kbd "M-x") 'execute-extended-command)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
(global-set-key (kbd "C-x b") 'helm-mini)

(global-set-key (kbd "C-x C-f") 'helm-find-files)


;;------------------------------------------------------------------------------
;; Projectile
;;------------------------------------------------------------------------------

(require-package 'projectile)

;; Alien or native
;; (setq projectile-indexing-method 'native)

;; Caching, enabled by default
(setq projectile-enable-caching t)

;; By default it uses 'ido'
;; (setq projectile-completion-system 'default)
;; Grizzl
;; (require-package 'grizzl)
;; (setq projectile-completion-system 'grizzl)
;; Or default
;; (setq projectile-completion-system 'default)
;; Or helm
(setq projectile-completion-system 'helm)

;; Enable projectile
(projectile-global-mode t)

;; Enable helm-projectile
(require-package 'helm-projectile)
(helm-projectile-on)


;; http://tuhdo.github.io/helm-projectile.html
;; Switch to a project and execute an action specified in projectile-switch-project-action variable.
;; This variable stores a command to be executed after a project is selected. The default is projectile-find-file.
;; My suggestion is to bind it to helm-projectile-find-file, as it provides the same thing as projectile-find-file but with more feature:
;; (setq projectile-switch-project-action 'helm-projectile-find-file)
(setq projectile-switch-project-action 'helm-projectile)


;; Tramp mode is much slower than using terminal to ssh
;; http://emacs.stackexchange.com/a/17579
(setq projectile-mode-line "Projectile")


;;------------------------------------------------------------------------------
;; Perspective
;;------------------------------------------------------------------------------

;; (require-package 'perspective)
;; (require-package 'persp-projectile)

;; Toggle the perspective mode
;; (persp-mode)


(provide 'init-project)
