

(setq package-archives '
      (("gnu" . "https://elpa.gnu.org/packages/")
       ("marmalade" . "https://marmalade-repo.org/packages/")
       ("melpa" . "https://melpa.org/packages/")))


(package-initialize)
(elpy-enable)

(setenv "PYTHONPATH" "/usr/local/bin/python")

(when (>= emacs-major-version 24))

 (setq package-enable-at-startup nil)
 (package-initialize)

; load theme
(load-theme 'peacock t)

; shows diffrent bufers in minibuffer
(require 'ido)
(ido-mode t)

;; autopep8 configuration


;enable line numbers
(global-linum-mode t)

;;set line break to 80
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)	
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

;differemt system settings					
(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

 (defun system-is-linux ()
   (interactive)
   (string-equal system-type "gnu/linux"))

 ; set command key to be meta instead of option
 (if (system-is-mac)
     (setq ns-command-modifier 'meta))

; set path for emacs in mac -systm since faulty
(let ((default-directory  "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path))
;fixes path problem for windows 
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
;; (setenv "PATH" (concat (getenv "PATH") ":/sw/bin"))
;; ;;(setq exec-path (append exec-path '("/sw/bin")))
;; (setq exec-path (append exec-path '("/Library/TeX/texbin")))

;;  ; set PATH, because we don't load .bashrc
;; (setenv
;;  "PATH" (concat
;;    "$HOME/bin:"
;;    "/bin:"
;;    "/Usr/bin:"
;;    "/sbin:"
;;    "/usr/sbin:"
;;    "/usr/local/bin:"
;;    "/usr/local/sbin"))

;; ; Set PYTHONPATH, because we don't load .bashrc
;; (setenv "PYTHONPATH" "/usr/local/lib/python2.7/site-packages:")

; default window width and height
(defun custom-set-frame-size ()
  (add-to-list 'default-frame-alist '(height . 56))
  (add-to-list 'default-frame-alist '(width . 100)))
(custom-set-frame-size)
(add-hook 'before-make-frame-hook 'custom-set-frame-size)

;;;; Interface and typing
;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
(setq show-paren-style 'mixed) ; highlight entire expression


;; (require 'fill-column-indicator)
;; (define-globalized-minor-mode
;;  global-fci-mode fci-mode (lambda () (fci-mode 1)))
;; (global-fci-mode t)

;; ansi-term 
(defun visit-term-buffer ()
  "Create or visit a terminal buffer."
  (interactive)
  (if (not (get-buffer "*ansi-term*"))
      (progn
        (split-window-sensibly (selected-window))
        (other-window 1)
        (ansi-term (getenv "SHELL")))
    (switch-to-buffer-other-window "*ansi-term*")))

(global-set-key (kbd "C-c t") 'visit-term-buffer)

;; Yas snippet
(require 'yasnippet)
(yas-global-mode 1)
(add-hook 'term-mode-hook (lambda()
			    (setq yas-dont-activate t)))

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

; python-mode
;; Mandatory
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
(add-to-list 'load-path "~/.emacs.d/emacs-for-python/") ;; tell where to load the various files

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
         (append '(ac-source-math-unicode
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

;;(load "preview-latex.el" nil t t)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3ac266781ee0ac3aa74a6913a1506924cad669f111564507249f0ffa7c5e4b53" "26ce7eea701bfd143ac536e6805224cff5598b75effb60f047878fe9c4833ae4"
    default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

require ()
