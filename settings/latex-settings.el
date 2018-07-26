;;;; AUCTeX

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t) ;enables all pdflatex modes by defaul


;;;; Flymake for latex

(require 'flymake)
(defun flymake-get-tex-args (file-name)
(list "pdflatex"
(list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))
(add-hook 'LaTeX-mode-hook 'flymake-mode)


(require 'package)
(package-initialize)

;; yasnippet code 'optional', before auto-complete
(require 'yasnippet)
(yas-global-mode 1)

;; auto-complete setup, sequence is important
(require 'auto-complete)
(add-to-list 'ac-modes 'latex-mode) ; beware of using 'LaTeX-mode instead
(require 'ac-math) ; package should be installed first 
(defun my-ac-latex-mode () ; add ac-sources for latex
   (setq ac-sources
         (append '(ac-source-math-unicode
           ac-source-math-latex
           ac-source-latex-commands)
                 ac-sources)))
(add-hook 'LaTeX-mode-hook 'my-ac-latex-mode)
(setq ac-math-unicode-in-math-p t)
(ac-flyspell-workaround) ; fixes a known bug of delay due to flyspell (if it is there)
(add-to-list 'ac-modes 'org-mode) ; auto-complete for org-mode (optional)
(require 'auto-complete-config) ; should be after add-to-list 'ac-modes and hooks
(ac-config-default)
(setq ac-auto-start nil)            ; if t starts ac at startup automatically
(setq ac-auto-show-menu t)
(global-auto-complete-mode t) 

;;; note takes alot of CPU especially for big files, if cpu fails comment out above  uncomment following setting
;; (setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
;; (setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'flyspell-buffer)


;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;OLD;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;; (load "auctex.el" nil t t)
;; ;(load "preview-latex.el" nil t t)
;; ;; auto-complete setup, sequence is important
;; (require 'auto-complete)
;; (add-to-list 'ac-modes 'latex-mode) ; beware of using 'LaTeX-mode instead
;; (require 'ac-math) ; package should be installed first 
;; (defun my-ac-latex-mode () ; add ac-sources for latex
;;    (setq ac-sources
;;          (append '(ac-source-math-unicode
;;            ac-source-math-latex
;;            ac-source-latex-commands)
;;                  ac-sources)))
;; (add-hook 'LaTeX-mode-hook 'my-ac-latex-mode)
;; (setq ac-math-unicode-in-math-p t)
;; (ac-flyspell-workaround) ; fixes a known bug of delay due to flyspell (if it is there)
;; (add-to-list 'ac-modes 'org-mode) ; auto-complete for org-mode (optional)
;; (require 'auto-complete-config) ; should be after add-to-list 'ac-modes and hooks
;; (ac-config-default)
;; (setq ac-auto-start nil)            ; if t starts ac at startup automatically
;; (setq ac-auto-show-menu t)
;; (global-auto-complete-mode t) 

;; ;;(load "preview-latex.el" nil t t)

;; ;; (if (system-is-mac)
;; ;;  (progn
;; ;;   (require 'tex-site)
;; ;;   (require 'font-latex)
;; ;;   (setq TeX-view-program-list
;; ;;    (quote
;; ;;     (("Skim"
;; ;;       (concat "/Applications/Skim.app/"
;; ;;         "Contents/SharedSupport/displayline"
;; ;;         " %n %o %b")))))
;; ;;   (setq TeX-view-program-selection
;; ;;    (quote (((output-dvi style-pstricks) "dvips and gv")
;; ;;       (output-dvi "xdvi")
;; ;;       (output-pdf "Skim")
;; ;;       (output-html "xdg-open")))))

;; ;;   (if (system-is-linux)
;; ;;    (setq TeX-view-program-selection
;; ;;     (quote (((output-dvi style-pstricks) "dvips and gv")
;; ;;        (output-dvi "xdvi")
;; ;;        (output-pdf "evince"
;; ;; 		   (output-html "xdg-open"))))))


(provide 'latex-settings)
