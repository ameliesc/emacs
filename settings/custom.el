; load theme
(require 'kaolin-themes)
(load-theme 'kaolin-valley-dark t)
;; Apply treemacs customization for Kaolin themes, requires the all-the-icons package.
(kaolin-treemacs-theme)

(add-hook 'pro-mode-hook #'rainbow-delimiters-mode)
;;(load-theme 'twilight-bright t) ;; when working outside make this change automatic one day with keyboard shorcut
;;(load-theme 'hydandata-light t) ;;
;; ;;; Monaco font for programming (and some other modes)
;; (defvar dh-monaco-face-remapping-alist nil)

;; (when window-system
;;   (defface dh-default-monaco-face
;;     '((t (:family "Monaco" :inherit default)))
;;     "Default face with the Monaco font"
;;     :group 'basic-faces)

;;   (defface dh-bold-monaco-face
;;     '((t (:family "DejaVu Sans Mono" :inherit bold)))
;;     "Default bold face with the Monaco font"
;;     :group 'basic-faces)

;;   (defface dh-italic-monaco-face
;;     '((t (:family "DejaVu Sans Mono" :inherit italic)))
;;     "Default bold face with the Monaco font"
;;     :group 'basic-faces)

;;   (setq dh-monaco-face-remapping-alist
;;     '((default dh-default-monaco-face)
;;       (bold dh-bold-monaco-face)
;;       (italic dh-italic-monaco-face))))

;; (defun dh-set-monaco-font ()
;;   (setq-local face-remapping-alist dh-monaco-face-remapping-alist))

;; (add-hook 'prog-mode-hook #’dh-set-monaco-font)

					;(set-frame-font "Inconsolata" nil t)


(defun my-change-window-divider ()
  (let ((display-table (or buffer-display-table standard-display-table)))
    (set-display-table-slot display-table 5 ?│)
    (set-window-display-table (selected-window) display-table)))

(add-hook 'window-configuration-change-hook 'my-change-window-divider)

(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(package-selected-packages
   '(yaml-tomato yaml-mode vterm-toggle unicode-escape twilight-bright-theme sql-indent req-package rainbow-delimiters python-pytest python-isort python-docstring python-django python pyenv-mode-auto pydoc py-autopep8 projectile-git-autofetch project-shells pkg-info peacock-theme paredit origami numpydoc mongo mmm-jinja2 minimap maxframe markdown-soma markdown-preview-mode markdown-preview-eww magit-todos latex-preview-pane kaolin-themes jedi importmagic impatient-showdown iedit hydandata-light-theme helm-swoop helm-projectile helm-eww grip-mode google-this format-sql forge flyspell-lazy flymake-yamllint flycheck-pyflakes exec-path-from-shell eshell-vterm elpy eldoc editorconfig discover company-tabnine company-jedi company-bibtex cdlatex bash-completion auto-package-update auto-complete-auctex auctex all-the-icons ac-math)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

(use-package highlight-indentation
  :ensure t
  :hook (prog-mode . highlight-indentation-mode))


(provide 'custom)
