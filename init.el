(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
       ("melpa" . "https://melpa.org/packages/")))


(package-initialize)

(add-to-list 'load-path "~/.emacs.d/settings")
(add-to-list 'load-path "~/.emacs.d/site-list/")
(add-to-list 'load-path "~/.emacs.d/elpa/")
(exec-path-from-shell-initialize)

(require 'package-management)

(require 'custom-functions)

;; configure general settings
(require 'general-settings)


(require 'custom)
(require 'loadhist)



;;;;;;;;;;;;;;;;;;;;;;;
;;;;; UTILITIES   ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;



;(require 'ansi-settings) #not using terminal anymore, not needed in emacs


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
(require 'R)
(require 'c++-settings)
(require 'projectile-settings)
(require 'latex-settings)

;;(require 'sql-settings)


;;; Source https://github.com/jhamrick/emacs/blob/master/.emacs
;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;   Application Framework   ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;(setq grip-binary-path "/Users/ame31942/.pyenv/versions/3.10.1/lib/python3.10/site-packages") ; why are we setting this here, comments amelie comments!!!

(require 'markdown-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-tomato yaml-mode vterm-toggle unicode-escape twilight-bright-theme sql-indent req-package rainbow-delimiters python-pytest python-isort python-docstring python-django python pyenv-mode-auto pydoc py-autopep8 projectile-git-autofetch project-shells pkg-info peacock-theme paredit origami numpydoc mongo mmm-jinja2 minimap maxframe markdown-soma markdown-preview-mode markdown-preview-eww magit-todos latex-preview-pane kaolin-themes jedi importmagic impatient-showdown iedit hydandata-light-theme helm-swoop helm-projectile helm-eww grip-mode google-this format-sql forge flyspell-lazy flymake-yamllint flycheck-pyflakes exec-path-from-shell eshell-vterm elpy eldoc editorconfig discover company-tabnine company-jedi company-bibtex cdlatex bash-completion auto-package-update auto-complete-auctex auctex all-the-icons ac-math)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
