;; You need to modify the following two lines:
(setq lean-rootdir "~/lean")
(setq lean-emacs-path "~/lean/src/emacs")

(setq lean-mode-required-packages '(company dash dash-functional f
                               flycheck let-alist s seq))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(let ((need-to-refresh t))
  (dolist (p lean-mode-required-packages)
    (when (not (package-installed-p p))
      (when need-to-refresh
        (package-refresh-contents)
        (setq need-to-refresh nil))
      (package-install p))))

(setq load-path (cons lean-emacs-path load-path))

(require 'lean-mode)
