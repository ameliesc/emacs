;differemt system settings


(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))


(defun system-is-linux ()
   (interactive)
   (string-equal system-type "gnu/linux"))

(defun reverse-words (beg end)
    "Reverse the order of words in region."
    (interactive "*r")
    (apply
     'insert
      (reverse
       (split-string
        (delete-and-extract-region beg end) "\\b"))))


(provide 'custom-functions)

