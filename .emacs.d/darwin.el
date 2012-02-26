(setq ga-plt-font "inconsolata")
(setq ga-plt-font-size 140)
(setenv "PATH" (concat "/usr/local/bin" path-separator (getenv "PATH")))

;; Set default emacs frame size
(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 200))
