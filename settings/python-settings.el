;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;   python    ;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun company-yasnippet-or-completion ()
  "Solve company yasnippet conflicts."
  (interactive)
  (let ((yas-fallback-behavior
         (apply 'company-complete-common nil)))
    (yas-expand)))

(add-hook 'after-init-hook 'global-company-mode) ; force automatic company autocompletion
(add-hook 'company-mode-hook
          (lambda ()
            (substitute-key-definition
             'company-complete-common
             'company-yasnippet-or-completion
             company-active-map)))



(use-package company
  :ensure t)


(package-install 'yasnippet)

;;; Virtualenvironment
;; pyenv
;; Since Elpy runs Python in the home directory, it doesn’t deal with any local environment, so only use pyenv global.
(use-package pyenv-mode
  :ensure t
  :config
    (defun projectile-pyenv-mode-set ()
      "Set pyenv version matching project name."
      (let ((project (projectile-project-name)))
        (if (member project (pyenv-mode-versions))
            (pyenv-mode-set project)
          (pyenv-mode-unset))))

    (add-hook 'projectile-switch-project-hook 'projectile-pyenv-mode-set)
    (add-hook 'python-mode-hook 'pyenv-mode))

	 
(setq pyenv-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-m") 'pyenv-mode-set) ; C-c C-s conflicts with AUCtex
    (define-key map (kbd "C-c C-u") 'pyenv-mode-unset)
    map))




;;; Linting
;; isort makes sure package import is correct
(use-package python-isort
  :ensure t
  :hook (python-mode . python-isort-on-save-mode))
;; pep8
(use-package py-autopep8
  :hook ((python-mode) . py-autopep8-mode))  


;;; Elpy
(use-package elpy
  :ensure t
  :config
  (setq
   elpy-rpc-backend "jedi"
   elpy-rpc-virtualenv-path (concat home-dir "/.pyenv/versions")
   elpy-rpc-python-command "python"
   python-shell-interpreter (concat home-dir "/.pyenv/shims/python")
   elpy-set-test-runner "pytest"
   )
  (electric-indent-local-mode -1)
  (delete 'elpy-module-highlight-indentation elpy-modules)
  (delete 'elpy-module-flymake elpy-modules)
  (defun ha/elpy-goto-definition ()
    (interactive)
    (condition-case err
        (elpy-goto-definition)
      ('error (xref-find-definitions (symbol-name (symbol-at-point))))))
  :bind (:map elpy-mode-map ([remap elpy-goto-definition] .
                             ha/elpy-goto-definition))
  :hook (before-save . elpy-black-fix-code)
  :bind ("C-c m" . elpy-company-backend)
  :commands elpy-enable
  :init (with-eval-after-load 'python (elpy-enable)))

;;; Auto-completion

(use-package jedi
  :ensure t
  :init
  (add-to-list 'company-backends 'company-jedi)
  :config
  (use-package company-jedi
    :ensure t
    :init
    (add-hook 'python-mode-hook (lambda () (add-to-list 'company-backends 'company-jedi)))
    (setq company-jedi-python-bin "python")))





;; Yas snippets
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)



;; edit multiple occurences simultanously
(use-package iedit
  :ensure t
  :bind ("C-c o" . iedit-mode))



(setq python-shell-completion-native-enable nil);; removes annoying warning









(setenv "WORKON_HOME" (concat home-dir "/.pyenv/versions"))
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
;;	  (lambda ()
;;	    (setq-default indent-tabs-mode t)
;;	    (setq-default tab-width 4)
;;	    (setq-default py-indent-tabs-mode t)
;;	    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
(setq pyenv-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c C-m") 'pyenv-mode-set) ; C-c C-s conflicts with AUCtex
    (define-key map (kbd "C-c C-u") 'pyenv-mode-unset)
    map))

(require 'pyenv-mode)

(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
      (pyenv-mode-unset))))



;; use-package with :ensure t to intall from MELPA.
;; with use-package
(use-package numpydoc
  :ensure t
  :bind (:map python-mode-map
              ("C-c C-n" . numpydoc-generate))
  :config
  (setq numpydoc-insertion-style 'yas) ;; use yasnippet style prompt
	)


(provide 'python-settings)
