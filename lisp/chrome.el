(defun chrome-reload ()
  (interactive)
  (shell-command "~/.emacs.d/scripts/chrome-reload.scpt"))
(global-set-key (kbd "C-s-r") 'chrome-reload)

(defun chrome-reload-tab-name ()
  (interactive)
  (shell-command "~/.emacs.d/scripts/chrome-reload-tab-name.scpt"))

(defun chrome-next-tab ()
  (interactive)
  (shell-command "~/.emacs.d/scripts/chrome-next-tab.scpt"))
(global-set-key (kbd "<M-s-right>") 'chrome-next-tab)

(defun chrome-previous-tab ()
  (interactive)
  (shell-command "~/.emacs.d/scripts/chrome-previous-tab.scpt"))
(global-set-key (kbd "<M-s-left>") 'chrome-previous-tab)

(defun chrome-page-down ()
  (interactive)
  (shell-command "~/.emacs.d/scripts/chrome-page-down.scpt"))
(global-set-key (kbd "<M-s-down>") 'chrome-page-down)

(defun chrome-page-up ()
  (interactive)
  (shell-command "~/.emacs.d/scripts/chrome-page-up.scpt"))
(global-set-key (kbd "<M-s-up>") 'chrome-page-up)

(defun chrome-back ()
  (interactive)
  (shell-command "~/.emacs.d/scripts/chrome-back.scpt"))
(global-set-key (kbd "<s-left>") 'chrome-back)

(defun chrome-forward ()
  (interactive)
  (shell-command "~/.emacs.d/scripts/chrome-forward.scpt"))
(global-set-key (kbd "<s-right>") 'chrome-forward)
