(setq package-archives '
      (("gnu" . "https://elpa.gnu.org/packages/")
       ("marmalade" . "https://marmalade-repo.org/packages/")
       ("melpa" . "https://melpa.org/packages/")))


(package-initialize)
(elpy-enable)

(setenv "PYTHONPATH" "/usr/local/bin/python")

;; initial window - set for max book pro 13"
(setq initial-frame-alist
      '(
        (width . 177) ; character
        (height . 47) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 176) ; character
        (height . 45) ; lines
        ))


;;; opens ansi term and  init file in to windows next to each other 

(setq initial-buffer-choice "*ansi-term*")

(defun switch-to-next-window ()
  (interactive)
  (let* ((next-window (get-buffer-window (other-buffer (current-buffer) t))))
    (select-window next-window)))

(add-hook 'emacs-startup-hook
          (lambda ()
            (ansi-term "/bin/bash")
            (split-window-horizontally)
            (find-file-other-window "~/.emacs.d/init.el")))




;; (switch-to-next-window)
;; (setq initial-buffer-choice "~/.emacs.d/init.el")


;; need to do this to gat the same path variabe, otherwise emacs uses the path in /etc/ and
;; not the one from /usr/local/....
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-copy-env "PYTHONPATH")
  (exec-path-from-shell-initialize))

(when (>= emacs-major-version 24))

 (setq package-enable-at-startup nil)
 (package-initialize)

; load theme
(load-theme 'peacock t)

; shows diffrent bufers in minibuffer
(require 'ido)
(ido-mode t)


;; tramp mode
(require 'tramp)
(setq tramp-default-method "ssh")
(setenv "ESHELL" "bash")


(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)


;; loads emacs for python stuuuf
(add-to-list 'load-path "~/.emacs.d/emacs-for-python/") 
;; Each of them enables different parts of the system.
;; Only the first two are needed for pep8, syntax check.
(require 'epy-setup) ;; It will setup other loads, it is required!
(require 'epy-python) ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing) ;; For configurations related to editing [optional]
;; [newer version of emacs-for-python]
(require 'epy-nose) ;; For shortcut to call nosetests [optional]

;; Define f10 to previous error
;; Define f11 to next error
(require 'epy-bindings) ;; For my suggested keybindings [optional]

;; Some shortcut that do not collide with gnome-terminal,
;; otherwise, "epy-bindings" define f10 and f11 for them.
(global-set-key [f2] 'flymake-goto-prev-error)
(global-set-key [f3] 'flymake-goto-next-error)

(require 'pep8)
;; Next two lines are the checks to do. You can add more if you wish.
(epy-setup-checker "pyflakes %f") ;; For python syntax check
(epy-setup-checker "pep8 -r %f") ;; For pep8 check


;; virtualenvironemt wrapper
(require 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)


;; (require 'python-mode)

;; ; use IPython
;; (setq-default py-shell-name "ipython")
;; (setq-default py-which-bufname "IPython")
;; ; use the wx backend, for both mayavi and matplotlib
;; (setq py-python-command-args
;;   '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
;; (setq py-force-py-shell-name-p t)

;; ; switch to the interpreter after executing code
;; (setq py-shell-switch-buffers-on-execute-p t)
;; (setq py-switch-buffers-on-execute-p t)
;; ; don't split windows
;; (setq py-split-windows-on-execute-p nil)
;; ; try to automagically figure out indentation
;; (setq py-smart-indentation t)




;; ;; AUCTeX
 	
(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)
;; auto-complete setup, sequence is important
(require 'auto-complete)
(add-to-list 'ac-modes 'latex-mode) ; beware of using 'LaTeX-mode instead
(require 'ac-math) ; package should be installed first 
(defun my-ac-latex-mode () ; add ac-sources for latex
   (setq ac-sources
         (append '(ac-source-math-
           ac-source-math-latex
           ac-source-latex-commands)
                 ac-sources)))
(add-hook 'LaTeX-mode-hook 'my-ac-latex-mode)
(setq ac-math-unicode-in-math-p t)
(ac-flyspell-workaround) ; fixes a known bug of delay due to flyspell (if it is there)
(add-to-list 'ac-modes 'org-mode) ; auto-complete for org-mode (optional)
(require 'auto-complete-config) ; should be after add-to-list 'ac-modes and hooks
(ac-config-default)
(setq ac-auto-start nil)            ; if t starts ac at startup automatically
(setq ac-auto-show-menu t)
(global-auto-complete-mode t) 

;; Email settings

(setq user-full-name "Amelie Schmidt-Colberg")
(setq user-mail-address "amelie.schmidtcolberg@gmail.com")
;(setq starttls-use-gnutls nil)
(setq send-mail-function 'smtpmail-send-it
message-send-mail-function 'smtpmail-send-it
smtpmail-starttls-credentials
'(("smtp.gmail.com" 587 nil nil))
smtpmail-auth-credentials
(expand-file-name "~/.authinfo")
smtpmail-default-smtp-server "smtp.gmail.com"
smtpmail-smtp-server "smtp.gmail.com"
smtpmail-smtp-service 587
smtpmail-debug-info t
starttls-extra-arguments nil
starttls-gnutls-program "/usr/local/Cellar/gnutls/3.5.12_2/bin/gnutls-cli"
starttls-use-gnutls nil
)
(require 'smtpmail)
;; (load "preview-latex.el" nil t t)

;; (if (system-is-mac)
;;  (progn
;;   (require 'tex-site)
;;   (require 'font-latex)
;;   (setq TeX-view-program-list
;;    (quote
;;     (("Skim"
;;       (concat "/Applications/Skim.app/"
;;         "Contents/SharedSupport/displayline"
;;         " %n %o %b")))))
;;   (setq TeX-view-program-selection
;;    (quote (((output-dvi style-pstricks) "dvips and gv")
;;       (output-dvi "xdvi")
;;       (output-pdf "Skim")
;;       (output-html "xdg-open")))))

;;   (if (system-is-linux)
;;    (setq TeX-view-program-selection
;;     (quote (((output-dvi style-pstricks) "dvips and gv")
;;        (output-dvi "xdvi")
;;        (output-pdf "evince"
;; 		   (output-html "xdg-open"))))))
(setq exec-path (append "/usr/local/bin" exec-path))

(setq ispell-program-name "aspell")


(setenv "DICTIONARY" "en_GB")

 ;: SPELL CHECK
(setq ispell-dictionary "british")
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
  
;;   ;; C++ settings
  
;; (require 'cc-mode)
  
;; (setq-default c-basic-offset 4 c-default-style "linux")
;; (setq-default tab-width 4 indent-tabs-mode t)
;; (define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

;; (require 'autopair)
;; (autopair-global-mode 1)
;; (setq autopair-autowrap t)
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;;'(custom-safe-themes
  ;; (quote
    ;;("3ac266781ee0ac3aa74a6913a1506924cad669f111564507249f0ffa7c5e4b53" "26ce7eea701bfd143ac536e6805224cff5598b75effb60f047878fe9c4833ae4"
;;     default))))
;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; )
;(put 'upcase-region 'disabled nil)

;;; i python notebook settings
(require 'ein)
(setq ein:use-auto-complete 1)



;; require ()
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (w3m ein seoul256-theme python-mode pyflakes py-autopep8 pep8 peacock-theme org magit leuven-theme fill-column-indicator exec-path-from-shell elpy auto-virtualenv auto-complete-auctex auctex ac-math)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
