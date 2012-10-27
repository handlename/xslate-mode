(defvar xslate-mode nil)

(defvar xslate-mode-map (make-keymap)
  "Keymap for `xslate-mode'.")

;;; constans

(defvar xslate-tag-open "<:"
  "open tag of Text::Xslate template")

(defvar xslate-tag-close ":>"
  "close tag of Text::Xslate template")

(defvar xslate-line-start ":"
  "line prefix of Text::Xslate template")

;;; font-lock

(defvar xslate-tag-regexp (rx (group
                               (eval xslate-tag-open)
                               (*? anything)
                               (eval xslate-tag-close))))

(defvar xslate-line-regexp (rx (group
                                bol
                                (eval xslate-line-start))))

(defvar xslate-font-lock-keywords
  `((,xslate-tag-regexp  . font-lock-variable-name-face)
    (,xslate-line-regexp . font-lock-variable-name-face)))

;;; command

(defun xslate-insert-tag ()
  "insert tag for Text::Xslate template"
  (interactive)
  (insert (concat xslate-tag-open " "))
  (save-excursion (insert (concat " " xslate-tag-close))))

;;; mode

(define-minor-mode xslate-mode
  "minor mode for Text::Xslate template"
  :lighter " Xslate" :keymap xslate-mode-map
  (define-key xslate-mode-map (kbd "C-c t") 'xslate-insert-tag)
  (font-lock-add-keywords nil xslate-font-lock-keywords))

(provide 'xslate)
