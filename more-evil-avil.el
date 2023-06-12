;;; more-evil-avil.el --- avy command baked with evil spirit

(require 'avy nil t)
(require 'evil nil t)

;;;###autoload
(defun avy-goto-char-in-line-end (char)
  "Jump to the currently visible CHAR in the current line."
  (interactive (list (read-char "char: " t)))
  (let ((current-point (point)))
    (avy-with avy-goto-char
      (avy-jump
       (regexp-quote (string char))
       :beg current-point
       :end (line-end-position)
       ))))

;;;###autoload
(defun avy-goto-char-in-line-beg (char)
  "Jump to the currently visible CHAR in the current line."
  (interactive (list (read-char "char: " t)))
  (let ((current-point (point)))
    (avy-with avy-goto-char
      (avy-jump
       (regexp-quote (string char))
       :beg (line-beginning-position)
       :end current-point
       ))))

(evil-define-avy-motion avy-goto-char-in-line-beg inclusive)
(evil-define-avy-motion avy-goto-char-in-line-end inclusive)

(provide 'more-evil-avil)

;;; more-evil-avil.el ends here
