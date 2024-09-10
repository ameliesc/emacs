;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

(setq magit-refresh-status-buffer nil)
;; automatic refresshing 
(with-eval-after-load 'magit-mode
  (add-hook 'after-save-hook 'magit-after-save-refresh-status t))
(use-package forge
  :after magit)
;; magit-todos
;; note if on macos: brew reinstall --with-pcre2 git
(require 'magit-todos) ; todo: enter magit mode automatically when starting magit
(provide 'magit-settings)
