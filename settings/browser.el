;; google-this
(use-package google-this
  :config
  (google-this-mode 1))

;; overriding image.el function image-type-available-p because svg throws error when loading eww
(defun image-type-available-p (type)
  "Return t if image type TYPE is available.
Image types are symbols like `xbm' or `jpeg'."
  (if (eq 'svg type)
      nil
    (and (fboundp 'init-image-library)
         (init-image-library type))))

;; (setq browse-url-browser-function 'eww-browse-url
;;       shr-use-colors nil
;;       shr-bullet "• "
;;       shr-folding-mode t
;;       eww-search-prefix "https://duckduckgo.com/html?q="
;;       url-privacy-level '(email agent cookies lastloc))
;; (defun osx-browse-chrome (url &optional new-window browser focus)
;;       "Open URL in Brave, Vivaldi, or whatever I'm running on OS X for my day job.
;; The parameters, URL, NEW-WINDOW, and FOCUS are as documented in
;; the function, `osx-browse-url'."
;;       (interactive (osx-browse-interactive-form))
;;       (callf or browser "com.google.Chrome") ;; Choices: com.apple.Safari
;;       (osx-browse-url url new-window browser focus))

;; (defun osx-browse-url-safari (url &optional new-window browser focus)
;;       "Open URL in Firefox for my personal surfing.
;; The parameters, URL, NEW-WINDOW, and FOCUS are as documented in
;; the function, `osx-browse-url'."
;;       (interactive (osx-browse-interactive-form))
;;       (callf or browser "org.mozilla.Safari")
;;       (osx-browse-url url new-window browser focus))

(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more

(require 'eaf-browser)
(require 'eaf-pdf-viewer)

(provide 'browser)
