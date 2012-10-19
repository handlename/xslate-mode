(defvar xslate-mode nil)

(defvar xslate-mode-map (make-keymap)
  "Keymap for `xslate-mode'.")

(defvar xslate-tag-open "<: "
  "open tag of Text::Xslate template")

(defvar xslate-tag-close " :>"
  "close tag of Text::Xslate template")

(defun xslate-insert-tag ()
  "insert tag for Text::Xslate template"
  (interactive)
  (insert xslate-tag-open)
  (save-excursion (insert xslate-tag-close)))

(define-minor-mode xslate-mode
  "minor mode for Text::Xslate template"
  :lighter " Xslate" :keymap xslate-mode-map
  (define-key xslate-mode-map (kbd "C-c t") 'xslate-insert-tag))

(provide 'xslate)
