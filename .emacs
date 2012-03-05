;; No startup message!
(setq inhibit-startup-message t)

;; Load some per-platform config settings
(load "~/.emacs.d/platform-configs/init.el")

;; Stupid emacs is stupid
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq make-backup-files nil)

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

;; Turn on linum-mode for every visited file
(add-hook 'find-file-hook 'linum-mode)
(setq linum-offset t)

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
(require 'feature-mode)
(require 'linum)
(require 'magit)

;; Load up customizations
(require 'rtircher-defuns)
(require 'rtircher-bindings)
(require 'rtircher-misc)

;; Clojure and Slime setup
(require 'clojure-mode)
(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))
	  (setq slime-protocol-version 'ignore)))
(require 'midje-mode)
(add-hook 'clojure-mode-hook 'midje-mode)
(require 'slime)
(slime-setup)

(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)

(defun turn-on-flyspell ()
  "Turns on flyspell, guaranteed."
  (interactive)
  (flyspell-mode 1))
(setq ispell-program-name "/usr/local/bin/ispell")

;; Magit config
;; Change color for diff
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; Indents the start of a parenthesis to one level less than the rest of the code
(defun ga-c-lineup-open-paren (langelem)
  "Line up an open parenthesis in an *-cont syntactic element indented
one extra step. Works with: arglist-cont."
  (save-excursion
    (beginning-of-line)
    (if (looking-at "\\W*(")
	c-basic-offset
      nil)))

;; Indents anonymous namespaces by the basic offset, but offers no
;; advice for other namespaces
(defun ga-c-lineup-anon-namespace (langelem)
  "Line up all statements in an anonymous namespace by the c-basic-offset, offer no advice on other namespaces. Works with: innamespace."
  (save-excursion
    (goto-char (c-langelem-pos langelem))
    (if (looking-at "\\W*{")
	(previous-line))
    (if (looking-at "^namespace\\W*$")
	c-basic-offset
      nil)))

;; C-mode configuration
(defun ga-c-mode-common-hook ()
  (ga-aegean-coding-standard)
  (ga-tab-fix)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  (define-key c-mode-base-map "\C-c\C-i" 'ga-visit-include-file)
  (define-key c-mode-base-map "\C-c\C-h" 'ff-get-other-file)
  (define-key c-mode-base-map [C-tab] 'yas/expand)
  (c-subword-mode 1)
  (flyspell-prog-mode))
(add-hook 'c-mode-common-hook 'ga-c-mode-common-hook)

;; Mode settings
(line-number-mode 1)
(column-number-mode 1)
;; Give better naming of identically named files
(setq uniquify-buffer-name-style 'reverse) ;; Put the dir name at the end of the buffer name
(setq uniquify-separator "|") ;; Separate file and dir with a |
(setq uniquify-after-kill-buffers-p t) ;; Rename uniquified buffers when one is killed
(setq uniquify-ignore-buffers-re "^\\*") ;; Ignore special buffers

;; Ruby mode configuration
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(defun ga-ruby-mode-hook ()
  (inf-ruby-keys)
  (setq tab-width 2)
  (setq ruby-indent-level tab-width)
  (define-key ruby-mode-map [C-tab] 'yas/expand)
  (define-key ruby-mode-map "\C-c\C-i" 'ga-visit-require-file)
  (flyspell-prog-mode))
(add-hook 'ruby-mode-hook 'ga-ruby-mode-hook)

;; Configure Snippeting engine
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets/")

;; nXHtml mode configuration
(setq
 nxhtml-global-minor-mode t
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t
 nxml-child-indent 2)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))
(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))

;; Treat feature files as cucumbers
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

;; Puppet mode configuration
(add-to-list 'auto-mode-alist '("\\.pp\\'" . puppet-mode))

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

;; CoffeeScript configuration
(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))
(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; Use markdown mode
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Run the emacs in-process server to accept remote-edit requests
(server-start)

(put 'upcase-region 'disabled nil)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
