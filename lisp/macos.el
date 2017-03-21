;; Setting for Mac

;; Modifier Keys
(setq mac-option-modifier 'meta)
(setq mac-right-option-modifier 'meta)
(setq mac-command-modifier 'super)
(setq mac-right-command-modifier 'super)

;; Command-T to open Font Panel
(global-set-key (kbd "s-t") 'mac-font-panel-mode)

(add-to-list 'auto-mode-alist '("\\.scpt\\'" . apples-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))

;; Open File
(defun open (filename)
  (interactive "fOpen file: ")
  (shell-command (concat "open " filename)))

;; Beep
;;(setq visible-bell t)
(setq ring-bell-function 'ignore)
