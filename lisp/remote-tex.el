;; This file must be fixed!

(defun remote-refresh (filename)
  "Refresh .pdf in remote mac."
  (shell-command (concat
 		  "cd " (file-name-directory filename) " && "
 		  "/Library/TeX/texbin/ptex2pdf -l -ot \"-synctex=1 -file-line-error\" "
 		  (file-name-nondirectory filename)
 		  " &> /dev/null"
		  " && "
		  "~/.emacs.d/scripts/texshop-refreshpdfbackground.scpt "
 		  (file-name-sans-extension filename) ".pdf"
		  )))

;; Setting keybindings
(setq latex-mode-hook
      (function
       (lambda ()
	 (progn
	   (define-key latex-mode-map (kbd "C-s-r") 'remote-refresh)
	   )
	 )
       )
      )
