;;; rtircher-misc.el --- Things that don't fit anywhere else

;; Get rid of extraneous and useless UI elements
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Set up my preferred color theme
(color-theme-initialize)
(color-theme-solarized-dark)

;; Adjustments to the font lock colouring. Made manually rather than
;; with custom as it provides more reliable control.
(set-face-attribute 'default
		    t
		    :family ga-plt-font
		    :height ga-plt-font-size)

(setq user-mail-address "rtircher@thoughtworks.com")

;; Make emacs to replace the current selection when yanking
(delete-selection-mode 1)

;; Block emacs to automatically copy the region when selecting text
(setq mouse-drag-copy-region nil)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(set-default 'indicate-empty-lines t)

(add-hook 'text-mode-hook 'turn-on-flyspell)

;; Ack config
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; I only use vertical splits to display two windows of code next to each other,
;; typically those two windows will be each wide enough to display most lines, so
;; continue longer lines
(setq truncate-partial-width-windows nil)

(setq default-major-mode 'text-mode)
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'message-mode-hook 'turn-on-flyspell)

(setq tab-width 2)
(setq indent-tabs-mode nil)

(setq visible-bell t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(canlock-password "fc42db0a3ede323f9d0f2ac4768d0f88d055a790")
 '(column-number-mode t)
 ;; '(cua-mode t nil (cua-base))
 '(scroll-bar-mode nil)
 '(transient-mark-mode t)
 '(whitespace-check-leading-whitespace nil)
 '(whitespace-check-trailing-whitespace nil)
 '(whitespace-check-buffer-trailing nil)
 '(whitespace-global-mode t)
 '(windmove-wrap-around t))
(winner-mode 1)

(provide 'rtircher-misc)
;;; rtircher-misc.el ends here