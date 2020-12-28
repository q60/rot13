;;; main.el --- ROT13

;;; Code:
(defun encode-rot13 (text) 
  "Cipher text with ROT13." 
  (interactive "sEnter string to encode: ") 
  (message (concat "Encoded string:\n" (rot13-string text))))

;;; main.el ends here
