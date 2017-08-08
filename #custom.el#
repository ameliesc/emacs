;;; initial window - set for max book pro 13"
(setq initial-frame-alist
      '(
        (width . 177) ; character
        (height . 47) ; lines
        ))

;;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 176) ; character
        (height . 45) ; lines
        ))


;;; load theme
(load-theme 'peacock t)


;;; opens ansi term and  init file in to windows next to each other 

(setq initial-buffer-choice "*ansi-term*")

;;; First written lips function wuhuuuuu
;; (defun switch-to-next-window ()
;;   (interactive)
;;   (let* ((next-window (get-buffer-window (other-buffer (current-buffer) t))))
;;     (select-window next-window)))

(add-hook 'emacs-startup-hook
          (lambda ()
            (ansi-term "/bin/bash")
            (split-window-horizontally)
            (find-file-other-window "~/.emacs.d/init.el")))
