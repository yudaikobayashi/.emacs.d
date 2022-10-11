(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-x n") 'next-buffer)
(global-set-key (kbd "<tab>") 'completion-at-point)
(global-set-key (kbd "<f2>") 'rgrep)
(global-set-key (kbd "<f9>") 'flop-frame)
(global-set-key (kbd "<f11>") 'xref-pop-marker-stack)
(global-set-key (kbd "<f12>") 'xref-find-definitions)

(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq-default show-trailing-whitespace t)

(global-set-key (kbd "C-x C-b") 'buffer-menu)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(require 'undo-tree)
(global-undo-tree-mode t)

;; Line number
(require 'linum)

(global-linum-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq visible-bell t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(default
	((t
	  (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 '(display-buffer-reuse-frames t)
 '(global-hl-line-mode nil)
 '(global-linum-mode 1)
 '(indent-tabs-mode t)
 '(neo-window-fixed-size nil)
 '(package-selected-packages
   '(sr-speedbar vline undo-tree transpose-frame swift-mode powershell origami neotree ggtags flycheck-swift fill-column-indicator csv-mode csharp-mode))
 '(scroll-bar-mode 1)
 '(tool-bar-mode nil)
 '(truncate-lines t))

(setenv "PATH"(concat (getenv "PATH") ";" (getenv "emacs_dir") "/bin;"))

;; 80 column rule
;;(require 'fill-column-indicator)
;;(setq fci-rule-column 80)
;;(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
;;(add-hook 'c-mode-hook 'fci-mode)

(add-to-list 'auto-mode-alist '("\\.bin\\'" . hexl-mode))

;; Showing spaces
(require 'whitespace)
;;(setq whitespace-line-column 80)
(setq whitespace-style
	  (quote
	   (
		;;face
		spaces
		tabs
		newline
		space-mark
		;;tab-mark
		newline-mark
		)))
(global-whitespace-mode)

;; C indentation
(setq c-default-style "bsd"
      c-basic-offset 4
      indent-tabs-mode t
      )
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)

(c-set-offset 'case-label '+)

(setq c-backspace-function 'delete-backward-char)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 90 :width normal))))
 '(hl-line ((t (:underline "magenta")))))

(setq confirm-kill-emacs 'y-or-n-p)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((meta)) ((control) . text-scale)))
(setq mouse-wheel-progressive-speed nil)

;; Window Powershell
;; (require 'powershell)

;; Restore last state
;; (desktop-save-mode 1)

;; grep
(setq find-program "wsl find")

;; frame
(require 'transpose-frame)

;; tags
(setq path-to-ctags "C:/ctags58j2bin/ctags.exe")
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "cd %s && %s -e -R -f etags" (directory-file-name dir-name) path-to-ctags))
  (visit-tags-table
   (format "%s/etags" (directory-file-name dir-name)))
  )

;; Prevent issues with the Windows null device (NUL)
;; when using cygwin find with rgrep.
(defadvice grep-compute-defaults (around grep-compute-defaults-advice-null-device)
  "Use cygwin's /dev/null as the null-device."
  (let ((null-device "/dev/null"))
	ad-do-it))
(ad-activate 'grep-compute-defaults)

(global-auto-revert-mode)

;; M-x customize-variable <RET> ls-lisp-UCA-like-collation
(setq ls-lisp-UCA-like-collation nil)
(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)
(put 'upcase-region 'disabled nil)

;; Matching parenthesis jump
(show-paren-mode 1)
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
(put 'downcase-region 'disabled nil)
