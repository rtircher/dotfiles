;;; rtircher-magit.el --- Magit config

;; Change color for diff
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

(provide 'rtircher-magit)
;;; rtircher-magit.el ends here