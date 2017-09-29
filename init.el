(add-to-list 'load-path "~/.emacs.d/settings")

(setq package-archives '
      (("gnu" . "https://elpa.gnu.org/packages/")
       ("marmalade" . "https://marmalade-repo.org/packages/")
       ("melpa" . "https://melpa.org/packages/")))


(package-initialize)



(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(elpy-enable)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)

(setq elpy-rpc-backend "jedi")

;; lets buffer show full filenameand path
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))
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
