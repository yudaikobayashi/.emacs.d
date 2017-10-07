(defun load-lean (lean-binary-directory)
  "load lean mode"
  (interactive "fLean binary directory: ")
  (progn
    (setq lean-rootdir lean-binary-directory)
    (setq load-path (cons (concat lean-rootdir "/share/emacs/site-lisp/lean/") load-path))
    (require 'lean-mode)))

;; (cond ((eq window-system 'mac) (setq lean-rootdir "~/lean-3.1.0-darwin"))
;;       ((eq window-system 'w32) (setq lean-rootdir "~/lean-3.1.0-windows"))
;;       (t (setq lean-rootdir "~/lean-3.1.0-linux")))
;; (setq load-path (cons (concat lean-rootdir "/share/emacs/site-lisp/lean/") load-path))
;;
