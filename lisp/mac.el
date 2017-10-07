(load "latex2pdf.el")

;; Setting for Mac
(add-to-list 'default-frame-alist '(font . "-*-Menlo-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))
;;(add-to-list 'default-frame-alist '(alpha . (78 . 50)))
;;(add-to-list 'default-frame-alist '(fullscreen . fullheight))
;;(add-to-list 'default-frame-alist '(height . 45))
;;(add-to-list 'default-frame-alist '(width . 89))
;;(add-to-list 'default-frame-alist '(top . 22))
;;(add-to-list 'default-frame-alist '(left . 652))
;;(add-to-list 'default-frame-alist '(fullscreen))

;; Modifier Keys
(setq mac-option-modifier 'meta)
(setq mac-right-option-modifier 'meta)
(setq mac-command-modifier 'super)
(setq mac-right-command-modifier 'super)

(global-set-key (kbd "s-t") 'mac-font-panel-mode)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-m") 'iconify-frame)

;;(set-frame-parameter nil 'fullscreen 'fullboth)
;; (if window-system (set-frame-parameter nil 'alpha 100))

(add-to-list 'auto-mode-alist '("\\.scpt\\'" . apples-mode))
(add-to-list 'auto-mode-alist '("\\.tex\\'" . latex-mode))

;; Ctrl-Command-F to enter/exit Fullscreen
(progn
  (defun my-toggle-frame-fullscreen ()
    (interactive)
    (if (eq (frame-parameter nil 'fullscreen) 'fullscreen)
	(progn
 	  (set-frame-parameter nil 'fullscreen 'nil)
 	  (set-frame-parameter nil 'alpha (frame-parameter nil 'alpha-restore)))
      (progn
 	(set-frame-parameter nil 'fullscreen 'fullscreen)
 	(set-frame-parameter nil 'alpha-restore (frame-parameter nil 'alpha))
 	(set-frame-parameter nil 'alpha '(100 . 100)))))
  (global-set-key (kbd "C-s-f") 'my-toggle-frame-fullscreen)
  (global-set-key (kbd "<C-s-268632070>") 'my-toggle-frame-fullscreen))

;; (global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)
;; (global-set-key (kbd "<C-s-268632070>") 'toggle-frame-fullscreen)


;; Open File
(defun open (filename)
  (interactive "fOpen file: ")
  (shell-command (concat "open " filename)))

;; Beep
;;(setq visible-bell t)
(setq ring-bell-function 'ignore)

