(add-to-list 'load-path "~/.emacs.d/settings")

(setq package-archives '
      (("gnu" . "https://elpa.gnu.org/packages/")
       ("marmalade" . "https://marmalade-repo.org/packages/")
       ("melpa" . "https://melpa.org/packages/")))


(package-initialize)



(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(setq elpy-set-test-runner "pytest")

(elpy-enable)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)
(define-key elpy-mode-map (kbd "C-c m") 'elpy-company-backend)

(add-hook 'elpy-mode-hook
    (lambda ()
    (local-unset-key (kbd "M-TAB"))
    (define-key elpy-mode-map (kbd "C-c m") 'elpy-company-backend)))

(setq elpy-rpc-backend "jedi")
(setq elpy-set-test-runner "pytest") ; change if other test runner is used
(setq python-shell-completion-native-enable nil) ;; removes annoying warning
(setq python-shell-interpreter "ipython2") ;; other interpreter does silly things 


;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)


(require 'custom)


;;;;;;;;;;;;;;;;;;;;;;;
;;;;; UTILITIES   ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;


(require 'ansi-settings)

;(require 'yas-snippet-settings)


;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;    MODES   ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

(require 'magit-settings)

; shows diffrent bufers in minibuffer
(require 'ido)
(ido-mode t)

;(require 'python-settings)

(require 'latex-settings)

(require 'R)


;;; Source https://github.com/jhamrick/emacs/blob/master/.emacs
;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
