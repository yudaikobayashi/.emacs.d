;; C-h as backspace
(keyboard-translate ?\C-h ?\C-?)
;;(global-set-key "\C-h" 'delete-backward-char)

(setq read-file-name-completion-ignore-case t)
(setq-default show-trailing-whitespace t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(require 'undo-tree)
(global-undo-tree-mode)

;; Loading my elisp files
(add-to-list 'load-path "~/.emacs.d/lisp/")
(cond ((eq window-system 'mac) (load "mac.el"))
      ((eq window-system 'x) (load "ubuntu.el")))
;; Backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

(global-set-key (kbd "<tab>") 'completion-at-point)
(global-set-key (kbd "C-x n") 'next-buffer)
(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-s-s") 'comment-or-uncomment-region)

;; Line number
(require 'linum)
(global-linum-mode 1)

;; 80 column ruler
(require 'fill-column-indicator)
(fci-mode 1)

(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (manoj-dark)))
 '(frame-resize-pixelwise t)
 '(fringe-mode 0 nil (fringe))
 '(package-selected-packages
   (quote
    (unicode-fonts dash dashboard markdown-mode undo-tree mmm-mode ua-mode flycheck fill-column-indicator f dash-functional company)))
 '(python-indent-offset 4)
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(setq nxml-child-indent 4 nxml-attribute-indent 4)

;; (setq confirm-kill-emacs 'y-or-n-p)
;; (load "lean.el")
