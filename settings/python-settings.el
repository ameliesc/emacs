;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;   python    ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; ipython notebook
;(require 'ein)
(require 'py-autopep8)



;; elpy settings
(setq elpy-rpc-virtualenv-path "/Users/amelie/.virtualenvs")
;(setq elpy-rpc-pythonpath "/Users/amelie/.emacs.d/setttings/elpa/elpy-20220322.41/elpy")

(use-package pyenv-mode-auto
  :ensure t
  :config
  (let ((workon-home (expand-file-name "~/.pyenv/versions")))
  (setenv "WORKON_HOME" workon-home)
  (setenv "VIRTUALENVWRAPPER_HOOK_DIR" workon-home)))

(elpy-enable)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(add-hook 'elpy-mode-hook (lambda ()
                            (add-hook 'before-save-hook
                                      'elpy-format-code t nil)))
;(setq shell-file-name "/bin/bash")

(setq elpy-rpc-python-command "/Users/amelie/.virtualenvs/bin/python")
(setq elpy-rpc-backend "jedi")
;; (setq python-shell-interpreter "jupyter"
;;       python-shell-interpreter-args "console --simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil)
;; (add-to-list 'python-shell-completion-native-disabled-interpreters
;;              "jupyter")

;(setq python-shell-interpreter "python"
;python-shell-interpreter-args "-i")

(setq python-check-command "flake8"
             python-shell-interpreter (or (executable-find "python3")
                                          (executable-find "python")))

(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
(define-key global-map (kbd "C-c o") 'iedit-mode)
(define-key elpy-mode-map (kbd "C-c m") 'elpy-company-backend)


(add-hook 'elpy-mode-hook
    (lambda ()
    (local-unset-key (kbd "M-TAB"))
    (define-key elpy-mode-map (kbd "C-c m") 'elpy-company-backend)))


(setq elpy-set-test-runner "pytest") ; change if other test runner is used
(setq python-shell-completion-native-enable nil);; removes annoying warning

(setenv "WORKON_HOME" "/Users/amelie/.virtualenvs")
;;  ;; other interpreter does silly things
;; ;; source: https://github.com/gabrielelanaro/emacs-for-python
;; ;; Mandatory
;; ;; (load-file "~/.emacs.d/emacs-for-python/epy-init.el")
;; ;; (add-to-list 'load-path "~/.emacs.d/emacs-for-python/") ;; tell where to load the various files


;; ;; ;; Define f10 to previous error
;; ;; ;; Define f11 to next error
;; ;; (require 'epy-bindings) ; For my suggested keybindings [optional]
;; ;; (epy-setup-ipython)

;; ;; ;; Some shortcut that do not collide with gnome-terminal,
;; ;; ;; otherwise, "epy-bindings" define f10 and f11 for them.
;; ;; (global-set-key [f2] 'flymake-goto-prev-error)
;; ;; (global-set-key [f3] 'flymake-goto-next-error)

;; ;; (require 'py-autopep8)
;; ;; (require 'pyflakes)


;; ;; ;; Next two lines are the checks to do. You can add more if you wish.
;; ;; (epy-setup-checker "pyflakes %f") ;; For python syntax check
;; ;; (epy-setup-checker "py-autopep8 -r %f") ;; For pep8 check
;; ;;;; It was here where the annoying highlighting is coming from!
;; ;;(global-hl-line-mode t) ;; To enable
;; ;;(set-face-background 'hl-line "black") ;; change with the color that you like
;;                                        ;; for a list of colors: http://raebear.net/comp/emacscolors.html

;; (require 'highlight-indentation)
;; (add-hook 'python-mode-hook 'highlight-indentation)

;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (setq-default indent-tabs-mode t)
;; 	    (setq-default tab-width 4)
;; 	    (setq-default py-indent-tabs-mode t)
;; 	    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))





(provide 'python-settings)
