;;; rtircher-cucumber.el --- Cucumber config

(defun ga/feature-next-scenario ()
  (interactive)
  (if (looking-at "Scenario")
      (move-end-of-line 1))
  (search-forward "Scenario:" (point-max) "end")
  (beginning-of-line-text))
(defun ga/feature-prev-scenario ()
  (interactive)
  (search-backward "Scenario:" (point-min) "end")
  (beginning-of-line-text))
(defun ga/feature-mode-hook ()
  (define-key feature-mode-map "\M-n" 'ga/feature-next-scenario)
  (define-key feature-mode-map "\M-p" 'ga/feature-prev-scenario))
(add-hook 'feature-mode-hook 'ga/feature-mode-hook)
(add-to-list 'auto-mode-alist '("\.feature\\'" . feature-mode))

(provide 'rtircher-cucumber)
;;; rtircher-cucumber.el ends here