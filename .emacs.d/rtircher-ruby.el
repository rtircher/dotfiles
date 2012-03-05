;;; rtircher-ruby.el --- Ruby config

;; Ruby mode configuration
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(defun ga-ruby-mode-hook ()
  (inf-ruby-keys)
  (setq tab-width 2)
  (setq ruby-indent-level tab-width)
  (define-key ruby-mode-map [C-tab] 'yas/expand)
  (define-key ruby-mode-map "\C-c\C-i" 'ga-visit-require-file)
  (flyspell-prog-mode))
(add-hook 'ruby-mode-hook 'ga-ruby-mode-hook)

(provide 'rtircher-ruby)
;;; rtircher-ruby.el ends here