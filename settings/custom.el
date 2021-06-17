; load theme
(load-theme 'peacock t)
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
 '(package-selected-packages
   '(discover sql-indent format-sql mmm-jinja2 mmm-mode hydandata-light-theme helm-projectile flycheck-pyflakes pyflakes project-shells projectile projectile-git-autofetch editorconfig yaml-mode magit peacock-theme py-autopep8 paredit maxframe twilight-bright-theme s req-package pyvenv highlight-indentation company auctex))
 '(projectile-mode t nil (projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)

(provide 'custom)
