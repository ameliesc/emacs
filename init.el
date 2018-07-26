(add-to-list 'load-path "~/.emacs.d/settings")

(setq package-archives '
      (("gnu" . "https://elpa.gnu.org/packages/")
       ("marmalade" . "https://marmalade-repo.org/packages/")
       ("melpa" . "https://melpa.org/packages/")))


(package-initialize)

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)


(require 'custom)


(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;
;;;;; UTILITIES   ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

(defun reverse-words (beg end)
    "Reverse the order of words in region."
    (interactive "*r")
    (apply
     'insert
      (reverse
       (split-string
        (delete-and-extract-region beg end) "\\b"))))
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

(require 'c++-settings)


;;; Source https://github.com/jhamrick/emacs/blob/master/.emacs
;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)
