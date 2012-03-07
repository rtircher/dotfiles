;; Load some per-platform config settings
(load "~/.emacs.d/platform-configs/init.el")

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(require 'ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/vendor/color-theme")
(add-to-list 'load-path "~/.emacs.d/vendor/jump")
(add-to-list 'load-path "~/.emacs.d/vendor/ruby")
(add-to-list 'load-path "~/.emacs.d/vendor/yasnippet")
(add-to-list 'load-path "~/.emacs.d/vendor/midje-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/js2-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/feature-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/clojure-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/slime")
(add-to-list 'load-path "~/.emacs.d/vendor/magit")
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized")

;; Load Ruby libraries
(load-library "ruby-mode")
(load-library "inf-ruby")
(load-library "rubydb3x")

(load "~/.emacs.d/vendor/nxhtml/autostart.el")

;; Load flyspell
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;; Load js2 mode for improved javascript
(autoload 'js2-mode "js2" nil t)

;; Load markdown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)

;; Turn on linum-mode for every visited file
(add-hook 'find-file-hook 'linum-mode)

(require 'cl)
(require 'dired)
(require 'uniquify)
(require 'color-theme)
(require 'color-theme-solarized)
(require 'cc-mode)
(require 'ruby-mode)
(require 'parenface)
(require 'yasnippet)
(require 'puppet-mode)
(require 'linum)
(require 'magit)
(require 'feature-mode)

;; Load up customizations
(require 'rtircher-vars)
(require 'rtircher-defuns)
(require 'rtircher-bindings)
(require 'rtircher-misc)
(require 'rtircher-js)
(require 'rtircher-coffeescript)
(require 'rtircher-cucumber)
(require 'rtircher-clojure)
(require 'rtircher-magit)
(require 'rtircher-ruby)
