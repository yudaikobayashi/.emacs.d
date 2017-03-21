(defun my-org-save-export-html ()
  (interactive)
  (progn (save-buffer)
	 (org-html-export-to-html)
	 (shell-command (concat
			 "~/.emacs.d/scripts/chrome-reload-tab-name.scpt "
			 "\"To Do List\""))))
(global-set-key (kbd "C-s-h") 'my-org-save-export-html)
