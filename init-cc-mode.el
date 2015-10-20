;; for my c and c++ configure
(defun fix-c-indent-offset-according-to-syntax-context (key val)
  ;; remove the old element
  (setq c-offsets-alist (delq (assoc key c-offsets-alist) c-offsets-alist))
  ;; new value
  (add-to-list 'c-offsets-alist '(key . val)))

;; avoid default "gnu" style, use more popular one
(setq c-default-style "linux") 

(defun my-common-cc-mode-setup ()
  "setup shared by all languages (java/groovy/c++ ...)"
  (setq c-basic-offset 4)
  ;; give me NO newline automatically after electric expressions are entered
  (setq c-auto-newline nil)

                                        ;make DEL take all previous whitespace with it
  (c-toggle-hungry-state 1)

  ;; indent
  (fix-c-indent-offset-according-to-syntax-context 'substatement 0)
  (fix-c-indent-offset-according-to-syntax-context 'func-decl-cont 0)

  ;; comment
  (setq comment-start "// " comment-end "")
  
  (ycmd-mode)
  )
(add-hook 'c-mode-hook 'my-common-cc-mode-setup)
(add-hook 'c++-mode-hook 'my-common-cc-mode-setup)
(provide 'init-cc-mode)
