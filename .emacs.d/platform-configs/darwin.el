(setq ga-plt-font "inconsolata")
(setq ga-plt-font-size 140)
(setenv "PATH" (concat "/usr/local/bin" path-separator (getenv "PATH")))

;; Set default emacs frame size
(add-to-list 'default-frame-alist '(height . 70))
(add-to-list 'default-frame-alist '(width . 200))

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Make current path available to emacs
(setenv "PATH" (shell-command-to-string "echo $PATH"))

;; Split window at startup
(split-window-horizontally)