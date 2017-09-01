;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;   python    ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; ipython notebook
(require 'ein)

;; source: https://github.com/gabrielelanaro/emacs-for-python
;; Mandatory 
(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
(add-to-list 'load-path "~/.emacs.d/emacs-for-python/") ;; tell where to load the various files

;; Each of them enables different parts of the system.
;; Only the first two are needed for pep8, syntax check.
(require 'epy-setup) ; It will setup other loads, it is required!
(require 'epy-python) ; If you want the python facilities [optional]
(require 'epy-completion) ; If you want the autocompletion settings [optional]
(require 'epy-editing) ; For configurations related to editing [optional]
;; [newer version of emacs-for-python]
(require 'epy-nose) ;;For shortcut to call nosetests [optional]

;; Define f10 to previous error
;; Define f11 to next error
(require 'epy-bindings) ; For my suggested keybindings [optional]
(epy-setup-ipython)

;; Some shortcut that do not collide with gnome-terminal,
;; otherwise, "epy-bindings" define f10 and f11 for them.
(global-set-key [f2] 'flymake-goto-prev-error)
(global-set-key [f3] 'flymake-goto-next-error)

(require 'py-autopep8)
(require 'pyflakes)

;; Next two lines are the checks to do. You can add more if you wish.
(epy-setup-checker "pyflakes %f") ;; For python syntax check
(epy-setup-checker "py-autopep8 -r %f") ;; For pep8 check

(global-hl-line-mode t) ;; To enable
(set-face-background 'hl-line "black") ;; change with the color that you like
                                       ;; for a list of colors: http://raebear.net/comp/emacscolors.html

(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)


(provide 'python-settings)
