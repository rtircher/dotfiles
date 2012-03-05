;;; rtircher-defuns.el --- Define some custom functions

(defun save-buffer-if-visiting-file (&optional args)
  "Save the current buffer only if it is visiting a file"
  (interactive)
  (if (and (buffer-file-name) (buffer-modified-p))
      (save-buffer args)))
;; (add-hook 'auto-save-hook 'save-buffer-if-visiting-file)
;; (remove-hook 'auto-save-hook 'save-buffer-if-visiting-file)
;; And run auto-save frequently enough to be interesting
;; (setq auto-save-interval 1)

;; Create vim like o and O functions that create a new line below or above the current line (even from the middle of a line)
(defun rtr-create-line-below ()
  "Creates a new line below the current line"
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline))

(defun rtr-create-line-above ()
  "Creates a new line below the current line"
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1))

;; Improved searching:
(defun ga/isearch-yank-current-word ()
  "Pull current word from buffer into search string."
  (interactive)
  (save-excursion
    (skip-syntax-backward "w_")
    (isearch-yank-internal
     (lambda ()
       (skip-syntax-forward "w_")
       (point)))))

;; Improved killing:
(defun ga/kill-entire-current-line ()
  "Kills the entire current line."
  (interactive)
  (save-excursion
    (move-beginning-of-line nil)
    (kill-line 1)))

;; Make the TAB key indent if at the beginning of a line, or perform an expansion
;; everywhere else
(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))
(defun ga-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))

(defun duplicate-line ()
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank)))

;; binding keys to revert buffers
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files.") )

(defun remove-string-from-buffer (str)
  "Removes all occurences of the string STR from the current buffer."
  (interactive "MRemove string: ")
  (save-excursion
    (goto-char (point-min))
    (replace-string str "")))

(provide 'rtircher-defuns)
;;; rtircher-defuns.el ends here