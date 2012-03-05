;;; rtircher-js.el --- Some helpful Javascript helpers

;; JS2 mode (for javascript) configuration
(setq js2-basic-offset 2)
(setq js2-bounce-indent-p t)
(setq js2-global-externs '("emb", "window", "global"))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(defun ga-js2-mode-hook ()
  (ga-tab-fix)
  (setq tab-width 2)
  (setq indent-tabs-mode nil))
(add-hook 'js2-mode-hook 'ga-js2-mode-hook)

(provide 'rtircher-js)
;;; rtircher-js.el ends here