
(add-to-list 'load-path "~/.emacs.d/settings")

(setq package-archives '
      (("gnu" . "https://elpa.gnu.org/packages/")
       ("marmalade" . "https://marmalade-repo.org/packages/")
       ("melpa" . "https://melpa.org/packages/")))


(package-initialize)

;; Declare pacckages, fill in the missing packages from the textfile and uncomment code below 
;; (setq my-packages
;;       '(list of packages))

(setq my-packages
      '(
	discover sql-indent format-sql mmm-jinja2 mmm-mode
	hydandata-light-theme helm-projectile flycheck-pyflakes project-shells
        projectile projectile-git-autofetch editorconfig yaml-mode magit peacock-theme
	py-autopep8 paredit maxframe twilight-bright-theme req-package pyvenv
	highlight-indentation company auctex))

;; ;; Iterate on packages and install missing ones
(dolist (pkg my-packages)
  (unless (package-installed-p pkg)
    (package-install pkg)))

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)


(require 'custom)


(require 'package)
;(add-to-list 'package-archives
;             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;
;;;;; UTILITIES   ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;



(require 'ansi-settings)

;(require 'yas-snippet-settings)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;    MODES   ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

(require 'magit-settings)

; shows diffrent bufers in minibuffer
(require 'ido)
(ido-mode t)

(require 'python-settings)

;(require 'latex-settings)  --- currently buggy need to fix this

(require 'R)
(require 'c++-settings)
;(require 'sql-settings)

;;; Source https://github.com/jhamrick/emacs/blob/master/.emacs
;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
