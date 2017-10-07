;; hilignting too long lines
;; upto 80 charecters
(add-hook 'c-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))
(add-hook 'c++-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))
(add-hook 'python-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

(add-hook 'lean-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

;; upto 100 charecters
(add-hook 'java-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{100\\}\\(.*\\)$" 1 font-lock-warning-face t)))))
