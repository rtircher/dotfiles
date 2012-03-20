;;; rtircher-clojure.el --- Clojure config

;; Clojure and Slime setup
(require 'clojure-mode)
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))
	  (setq slime-protocol-version 'ignore)))
(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)
(require 'slime)
(slime-setup)

(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))

(provide 'rtircher-clojure)
;;; rtircher-clojure.el ends here