;;;;Org mode configuration
;; Enable Org mode
(require 'org)
(setq org-startup-truncated nil)
(setq auto-indent-org-indent t)
(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen
