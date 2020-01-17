; load theme
(load-theme 'peacock t)
;(load-theme 'twilight-bright t) ;; when working outside make this change automatic one day with keyboard shorcut

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
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   (quote
	("e4859645a914c748b966a1fe53244ff9e043e00f21c5989c4a664d649838f6a3" "3ac266781ee0ac3aa74a6913a1506924cad669f111564507249f0ffa7c5e4b53" "26ce7eea701bfd143ac536e6805224cff5598b75effb60f047878fe9c4833ae4" default)))
 '(package-selected-packages
   (quote
	(peacock-theme elpy req-package twilight-bright-theme)))
 '(python-shell-interpreter "jupyter"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "dark cyan"))))
 '(hl-line ((t (:background "indian red")))))
(put 'upcase-region 'disabled nil)

(provide 'custom)
