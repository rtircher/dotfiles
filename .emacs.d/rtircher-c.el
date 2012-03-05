;;; rtircher-c.el --- C config

;; Indents the start of a parenthesis to one level less than the rest of the code
(defun ga-c-lineup-open-paren (langelem)
  "Line up an open parenthesis in an *-cont syntactic element indented
one extra step. Works with: arglist-cont."
  (save-excursion
    (beginning-of-line)
    (if (looking-at "\\W*(")
	c-basic-offset
      nil)))

;; Indents anonymous namespaces by the basic offset, but offers no
;; advice for other namespaces
(defun ga-c-lineup-anon-namespace (langelem)
  "Line up all statements in an anonymous namespace by the c-basic-offset, offer no advice on other namespaces. Works with: innamespace."
  (save-excursion
    (goto-char (c-langelem-pos langelem))
    (if (looking-at "\\W*{")
	(previous-line))
    (if (looking-at "^namespace\\W*$")
	c-basic-offset
      nil)))

;; C-mode configuration
(defun ga-c-mode-common-hook ()
  (ga-aegean-coding-standard)
  (ga-tab-fix)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  (define-key c-mode-base-map "\C-c\C-i" 'ga-visit-include-file)
  (define-key c-mode-base-map "\C-c\C-h" 'ff-get-other-file)
  (define-key c-mode-base-map [C-tab] 'yas/expand)
  (c-subword-mode 1)
  (flyspell-prog-mode))
(add-hook 'c-mode-common-hook 'ga-c-mode-common-hook)

(provide 'rtircher-c)
;;; rtircher-c.el ends here