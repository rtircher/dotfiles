;;; rtircher-misc.el --- Things that don't fit anywhere else

;; Get rid of extraneous and useless UI elements
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(defalias 'yes-or-no-p 'y-or-n-p)

;; Set up my preferred color theme
(color-theme-initialize)
(color-theme-solarized-dark)

;; Updating the color of the selected region because the default color is difficult to differenciate from the background for me
(custom-set-faces
  '(region ((t (:background "#14323C")))))

;; Adjustments to the font lock colouring. Made manually rather than
;; with custom as it provides more reliable control.
(set-face-attribute 'default
		    t
		    :family ga-plt-font
		    :height ga-plt-font-size)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)
(set-face-background 'show-paren-match-face (face-background 'default))
(set-face-foreground 'show-paren-match-face "cyan")

(line-number-mode 1)
(column-number-mode 1)

(set-default 'indicate-empty-lines t)

(put 'upcase-region 'disabled nil)

(setq user-mail-address "rtircher@thoughtworks.com")

;; Make emacs to replace the current selection when yanking
(delete-selection-mode 1)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(canlock-password "fc42db0a3ede323f9d0f2ac4768d0f88d055a790")
 ;; '(cua-mode t nil (cua-base))
 '(scroll-bar-mode nil)
 '(transient-mark-mode t)
 '(whitespace-check-leading-whitespace nil)
 '(whitespace-check-trailing-whitespace nil)
 '(whitespace-check-buffer-trailing nil)
 '(whitespace-global-mode t)
 '(windmove-wrap-around t))
(winner-mode 1)

(add-hook 'text-mode-hook 'turn-on-flyspell)

;; Ack config
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'message-mode-hook 'turn-on-flyspell)

(defun turn-on-flyspell ()
  "Turns on flyspell, guaranteed."
  (interactive)
  (flyspell-mode 1))
(setq ispell-program-name "/usr/local/bin/ispell")

;; Configure Snippeting engine
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets/")

;; nXHtml mode configuration
(setq
  nxhtml-global-minor-mode t
  nxhtml-skip-welcome t
  indent-region-mode t
  rng-nxml-auto-validate-flag nil
  ;; nxml-degraded t
  nxml-child-indent 2)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))

;; Use markdown mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Sass mode config
(add-hook 'sass-mode-hook
          (function (lambda ()
            (local-set-key [backspace] 'delete-backward-char)
	    (ga-tab-fix)
	    (setq tab-width 2)
	    (setq indent-tabs-mode nil)
            )))

;; Run the emacs in-process server to accept remote-edit requests
(server-start)

(provide 'rtircher-misc)
;;; rtircher-misc.el ends here