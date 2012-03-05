;;; rtircher-coffeescript.el --- CoffeeScript configuration

(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))
(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(provide 'rtircher-coffeescript)
;;; rtircher-coffeescript.el ends here