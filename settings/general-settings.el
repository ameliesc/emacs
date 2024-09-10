;;enable line numbers
(global-display-line-numbers-mode 1)

; highlight current line
(global-hl-line-mode t)

;;set line break to 80
(setq-default fill-column 80)

(setq home-dir "~/.")
;; parenthesis matching
;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

;; set command key to be meta instead of option
 (if (system-is-mac)
     (setq ns-command-modifier 'meta))

;; set path for emacs in ㅜmac -systm since faulty
(let ((default-directory  "~/.emacs.d/elpa/"))
  (normal-top-level-add-subdirs-to-load-path)
  ) ; interferes with yassnippet add ".nosearch" file to directory causing error


;; auto loads buffers when files changed on disk
(global-auto-revert-mode t)

;; turns on autocomplete add in individual settings packages : (add-to-list 'ac-modes 'sql-mode)
(global-auto-complete-mode t)

;; lets buffer show full filenameand path
(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
        '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))


(setq ispell-program-name "aspell")

(setenv "DICTIONARY" "en_GB")


;;;; Interface and typing
;; turn on highlight matching brackets when cursor is on one
(show-paren-mode 1)
(setq show-paren-style 'mixed) ; highlight entire expression



(global-set-key (kbd "C-c t") 'visit-term-buffer)

;; get rid of annoying startup screen
(setq inhibit-startup-screen t)

;; open emacs split into 2 windows with terminal and init file
(add-hook 'emacs-startup-hook
          (lambda ()
	    (find-file "~/.emacs.d/init.el")
	  ))

;; start in full screen mode
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)


; automatically refresh buffers when changed on disk
(global-auto-revert-mode t)


;; automatically update packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


;; Path to grip


(provide 'general-settings)
