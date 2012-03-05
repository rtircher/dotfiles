;;; rtircher-bindings.el --- Set up some handy key bindings

;; Adding vim style o and O functions
(global-set-key "\M-o" 'rtr-create-line-below)
(global-set-key "\M-O" 'rtr-create-line-above)

(define-key isearch-mode-map (kbd "C-x") 'ga/isearch-yank-current-word)

;; Text manipulation
(global-set-key "\C-z" 'undo)
(global-set-key "\C-x\M-k" 'duplicate-line)
(global-set-key "\C-xj" 'ga/kill-entire-current-line)

(global-set-key "\C-x\C-c" 'ignore)

(global-set-key "\C-x\C-q" 'kill-emacs)

(global-set-key "\C-x\C-b" 'bs-show)

(global-set-key [f4] 'next-error)
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [f6] 'compile)
(global-set-key [f7] 'recompile)

(global-set-key "\C-xg" 'magit-status)

;; Window movement keys: provides quick jumping between many open windows
(global-set-key [(meta left)] 'windmove-left)
(global-set-key [(meta right)] 'windmove-right)
(global-set-key [(meta up)] 'windmove-up)
(global-set-key [(meta down)] 'windmove-down)

;; Handy way to revert buffers
(global-set-key "\M-r" 'revert-buffer-no-confirm)
(global-set-key "\M-R" 'revert-all-buffers)

(provide 'rtircher-bindings)
;;; rtircher-bindings.el ends here