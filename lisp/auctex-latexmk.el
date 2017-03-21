;; auctex
(require 'auctex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master t)
(setq TeX-PDF-mode t)

;; latexmk
(require 'auctex-latexmk)
(auctex-latexmk-setup)

(add-hook 'TeX-mode-hook
          '(lambda ()
             (setq TeX-command-default "LatexMk")
             (setq TeX-view-program-selection
                   '((output-dvi "Skim")
                     (output-pdf "Skim")))
             (setq TeX-view-program-list
                   '(("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %s.pdf %b")))))


;; for skim, inverse search
(require 'server)
(unless (server-running-p) (server-start))

;; reftex
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq reftex-default-bibliography '("~/Library/texmf/pbibtex/bib/bib_01.bib"
                                    "~/Library/texmf/pbibtex/bib/bib_02.bib"
                                    "~/Library/texmf/pbibtex/bib/bib_03.bib"
                                    ;; ...
                                    ))
