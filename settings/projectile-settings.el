;;; HELM
(use-package helm
  :diminish helm-mode
  :ensure t
  :config
  (progn
    (setq helm-split-window-in-side-p t) ; open helm buffer inside current window, not occupy whole other window

    (defun spacemacs//helm-hide-minibuffer-maybe ()
      (when (with-helm-buffer helm-echo-input-in-header-line)
        (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
          (overlay-put ov 'window (selected-window))
          (overlay-put ov 'face
                       (let ((bg-color (face-background 'default nil)))
                         `(:background ,bg-color :foreground ,bg-color)))
          (setq-local cursor-type nil))))

    ;; set helm height
    (add-hook 'helm-minibuffer-set-up-hook
              'spacemacs//helm-hide-minibuffer-maybe)
    (setq helm-autoresize-max-height 0)
    (setq helm-autoresize-min-height 40)
    (helm-autoresize-mode 1))
  :init
  (progn
    ;;(require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
          helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
          helm-yas-display-key-on-candidate t
          helm-quick-update t
          helm-M-x-requires-pattern nil
          helm-ff-skip-boring-files t)

    ;; what sources will we show in helm-mini
    (setq helm-mini-default-sources
          '(helm-source-buffers-list
            ;; helm-source-bookmarks
            helm-source-recentf
            helm-source-buffer-not-found))

    ;; suppress headerline
    (setq helm-display-header-line nil) ;; t by default
    (setq helm-echo-input-in-header-line t)

    ;; suppress modline while in helm
    (helm-mode)

    ;; make helms grepping recursive by default - MAY HAVE UNINTENTIONAL SIDE-EFFECTS ON DIRS GREPPED
    (eval-after-load 'helm-grep
      '(setq helm-grep-default-command helm-grep-default-recurse-command))

    ;; turn on helm mode
    (progn
      ;; 1. Collect bottom buffers
      (defvar bottom-buffers nil
        "List of bottom buffers before helm session.
         Its element is a pair of `buffer-name' and `mode-line-format'.")

      (defun bottom-buffers-init ()
        (when bottom-buffers
          (bottom-buffers-show-mode-line))
        (setq bottom-buffers
              (cl-loop for w in (window-list)
                       when (window-at-side-p w 'bottom)
                       collect (with-current-buffer (window-buffer w)
                                 (cons (buffer-name) mode-line-format)))))

      (add-hook 'helm-before-initialize-hook #'bottom-buffers-init)
      ;; 2. Hide mode line
      (defun bottom-buffers-hide-mode-line ()
        (mapc (lambda (elt)
                (with-current-buffer (car elt)
                  (setq-local mode-line-format nil)))
              bottom-buffers))

      (add-hook 'helm-after-initialize-hook #'bottom-buffers-hide-mode-line)

      ;; 3. Restore mode line
      (defun bottom-buffers-show-mode-line ()
        (when bottom-buffers
          (mapc (lambda (elt)
                  (with-current-buffer (car elt)
                    (setq-local mode-line-format (cdr elt))))
                bottom-buffers)
          (setq bottom-buffers nil)))

      (add-hook 'helm-exit-minibuffer-hook #'bottom-buffers-show-mode-line)

      (defun helm-keyboard-quit-advice (orig-func &rest args)
        (bottom-buffers-show-mode-line)
        (apply orig-func args))

      (advice-add 'helm-keyboard-quit :around #'helm-keyboard-quit-advice))

    ;; define reversed keymaps for tab while in helm
    (define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
    (define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z") #'helm-select-action)
    )
    :bind (
         ("C-x c b" . helm-buffers-list)
         ("C-x c f" . helm-find-files)
	 ("C-x C-f" . helm-find-files) ;; this gets overridden below by ivy by design
         ("C-x c m" . helm-mini)
         ("C-x c o" . helm-imenu)

         ("C-h a" . helm-apropos)
         ("C-x C-b" . helm-buffers-list)
         ;;("C-x b" . helm-buffers-list) ;; belongs to ivy
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c SPC" . helm-all-mark-rings))
  )



;;; PROJECTILE

(use-package projectile
  :ensure t
  :init
  (progn
    ;; C-c p h to switch to it
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    (use-package helm-projectile
    :ensure t))
  :config
  (progn
    (projectile-global-mode)
    (helm-projectile-on)
    
    (add-hook 'prog-mode-hook 'projectile-mode)
    (setq projectile-enable-caching t)
    (setq projectile-completion-system 'ivy)
    ;; (setq projectile-switch-project-action 'neotree-projectile-action)
    ;; search superordinate dirs until root
    ;; (setq projectile-find-dir-includes-top-level t)
    (define-key projectile-mode-map (kbd "C-c p") projectile-command-map)

    ;; use ag instread of grep for helm-projectile-grep (REQUIRES AG)
    ;; (define-advice helm-projectile-grep (:override (&optional dir) ag)
    ;;   (helm-do-ag (or dir (projectile-project-root))))

    ;; globally ignore certain directory and file patterns

    (add-to-list 'projectile-globally-ignored-directories "**/_build/")
    (add-to-list 'projectile-globally-ignored-directories "**/deps/")
    (add-to-list 'projectile-globally-ignored-directories "**/node_modules/")
    (add-to-list 'projectile-globally-ignored-directories "**/thirdparty/")
    (add-to-list 'projectile-globally-ignored-directories "**/build/")
    (add-to-list 'projectile-globally-ignored-directories "**/log/")
    (add-to-list 'projectile-globally-ignored-directories "**/logs/")

    (add-to-list 'projectile-globally-ignored-files "*.min.js")
    (add-to-list 'projectile-globally-ignored-files "**.min.js")
    (add-to-list 'projectile-globally-ignored-files "*/**.min.js")
    (add-to-list 'projectile-globally-ignored-files "**/*.min.js")
    (add-to-list 'projectile-globally-ignored-files "**/*.tex")
        ;; ignore certain directory and file patterns during grepping

    (add-to-list 'grep-find-ignored-directories "**/_build/")
    (add-to-list 'grep-find-ignored-directories "**/deps/")
    (add-to-list 'grep-find-ignored-directories "**/node_modules/")
    (add-to-list 'grep-find-ignored-directories "**/build/")
    (add-to-list 'grep-find-ignored-directories "**/thirdparty/")
    (add-to-list 'grep-find-ignored-directories "**/log/")
    (add-to-list 'grep-find-ignored-directories "**/logs/")

    (add-to-list 'grep-find-ignored-files "**/*.log")

    ;; use ~/.agignore in home directory when filtering results.
    (setq helm-ag-command-option " -U" )

    ))

(provide 'projectile-settings)
