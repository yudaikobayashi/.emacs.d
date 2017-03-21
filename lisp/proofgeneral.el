; add the MacPorts path to the search path so that emacs will find isabelle and isatool
(setenv "PATH" (concat (getenv "PATH") "/opt/local/bin"))
(setq exec-path (cons "/opt/local/bin" exec-path))
; load the ProofGeneral configuration
(load-file "/opt/local/share/ProofGeneral/generic/proof-site.el")
