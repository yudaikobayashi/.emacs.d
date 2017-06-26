;; latex2pdf
(defun latex2pdf (filename)
  "Typesetting .tex file by ptex2pdf and reload .pdf in TeXShop.app."
  (shell-command (concat
 		  "cd " (file-name-directory filename) " && "
		  "/Library/TeX/texbin/ptex2pdf -l -ot \"-synctex=1 -file-line-error\" "
 		  (file-name-nondirectory filename)
 		  " &> /dev/null"
		  " && "
		  "~/.emacs.d/scripts/texshop-refreshpdfbackground.scpt "
 		  (file-name-sans-extension filename) ".pdf"
		  )))

(defun latex2pdf-select-buffer ()
  "Typesetting the file specified by ``tex-master'' using ``latex2pdf''.
   The local variable ``tex-master'' must be set."
  (interactive)
  (save-buffer)
  (if (boundp 'tex-master)
      (latex2pdf (expand-file-name tex-master))
    (latex2pdf (buffer-file-name))))

;; Open PDF file
(defun latex2pdf-open-pdf (filename)
  "Open the .pdf file corresponding to the .tex file with ``filename''."
  (shell-command (concat "open -a TeXShop.app " (file-name-sans-extension filename) ".pdf")))

(defun latex2pdf-open-pdf-select-buffer ()
  (interactive)
  (if (boundp 'tex-master)
      (latex2pdf-open-pdf tex-master)
    (latex2pdf-open-pdf (buffer-file-name))))

;; Reload PDF in Google Chrome
(defun latex2pdf-chrome-reload-file (filename)
  "Reload a file in Google Chrome."
  (shell-command (concat
		  "~/.emacs.d/scripts/chrome-reload-tab-url.scpt " "file://" filename)))

(defun latex2pdf-chrome-reload-pdf ()
  "Reload the pdf specified by tex-master."
  (interactive)
  (if (boundp 'tex-master)
      (latex2pdf-chrome-reload-file (concat (file-name-sans-extension tex-master) ".pdf"))
    (latex2pdf-chrome-reload-file (concat (file-name-sans-extension (buffer-file-name)) ".pdf"))))

;; BibTeX
(defun my-bibtex (filename)
  "Bibtex by pbibtex."
  (shell-command (concat
 		  "cd " (file-name-directory filename) " && "
 		  "/Library/TeX/texbin/pbibtex  "
 		  (file-name-sans-extension (file-name-nondirectory filename))
 		  " &> /dev/null")))

(defun my-bibtex-select-buffer ()
  (interactive)
  (if (boundp 'tex-master)
      (my-bibtex (expand-file-name tex-master))
    (my-bibtex (buffer-file-name))))

;; Open tex-master file
(defun open-tex-master ()
  (interactive)
  (find-file tex-master))

;; Setting keybindings
(setq latex-mode-hook
      (function
       (lambda ()
	 (progn
	   (define-key latex-mode-map (kbd "C-s-t") 'latex2pdf-select-buffer)
	   (define-key latex-mode-map (kbd "C-s-o") 'latex2pdf-open-pdf-select-buffer)
	   (define-key latex-mode-map (kbd "C-s-b") 'my-bibtex-select-buffer)
	   (define-key latex-mode-map (kbd "C-s-m") 'open-tex-master)
	   ;;(define-key latex-mode-map (kbd "C-s-r") 'latex2pdf-chrome-reload-pdf)
	   (define-key latex-mode-map (kbd "C-c C-d") (lambda () (interactive) (insert "\\xLeftrightarrow{\\rm{def}}")))
	   )
	 )
       )
      )
;;(lambda () (interactive) (org-toggle-inline-images t)))
