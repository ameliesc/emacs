(setq browse-url-browser-function 'eww-browse-url
      shr-use-colors nil
      shr-bullet "• "
      shr-folding-mode t
      eww-search-prefix "https://duckduckgo.com/html?q="
      url-privacy-level '(email agent cookies lastloc))
(defun osx-browse-chrome (url &optional new-window browser focus)
      "Open URL in Brave, Vivaldi, or whatever I'm running on OS X for my day job.
The parameters, URL, NEW-WINDOW, and FOCUS are as documented in
the function, `osx-browse-url'."
      (interactive (osx-browse-interactive-form))
      (callf or browser "com.google.Chrome") ;; Choices: com.apple.Safari
      (osx-browse-url url new-window browser focus))

(defun osx-browse-url-safari (url &optional new-window browser focus)
      "Open URL in Firefox for my personal surfing.
The parameters, URL, NEW-WINDOW, and FOCUS are as documented in
the function, `osx-browse-url'."
      (interactive (osx-browse-interactive-form))
      (callf or browser "org.mozilla.Safari")
      (osx-browse-url url new-window browser focus))

(provide 'browser)
