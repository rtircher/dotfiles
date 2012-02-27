(defvar ga-plt-font
  "consolas"
  "The font to use for the default face")
(defvar ga-plt-font-size
  100
  "The font size to use for the default face")

;; Load some per-platform config settings
(if (eq system-type 'darwin)
    (load "~/.emacs.d/platform-configs/darwin.el"))
(if (eq system-type 'gnu/linux)
    (load "~/.emacs.d/platform-configs/linux.el"))
(if (eq system-type 'windows-nt)
    (load "~/.emacs.d/platform-configs/windows.el"))
(if (eq system-type 'berkeley-unix)
    (load "~/.emacs.d/platform-configs/freebsd.el"))
