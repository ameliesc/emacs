;;enable line numbers
(global-linum-mode t)

; highlight current line
(global-hl-line-mode t)

;;set line break to 80
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)	
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

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

;;fixes path problem for windows 
;(when (memq window-system '(mac ns))
;  (exec-path-from-shell-initialize))

;; attempt to fix emacs not finding flake8
(setq exec-path (append exec-path '("/usr/local/bin")))


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
            (ansi-term "/bin/zsh")
            (split-window-horizontally)
            (find-file-other-window "~/.emacs.d/init.el")))

;; start in full screen mode
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

; automatically refresh buffers when changed on disk
(global-auto-revert-mode t)

(provide 'general-settings)
