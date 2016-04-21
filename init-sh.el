(add-to-list 'auto-mode-alist '("\\.bash_profile\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash_history\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.sh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bash\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bashrc.local\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(add-to-list 'auto-mode-alist '("\\.bashrc\\'" . sh-mode))

(if (configuration-layer/package-usedp 'shell)
    (progn
      (evil-set-initial-state 'shell-mode 'emacs)
      (global-set-key (kbd "<f7>") 'shell)))

(if (configuration-layer/package-usedp 'eshell)
    (progn
      (evil-set-initial-state 'eshell-mode 'emacs)
      (global-set-key (kbd "<f8>") 'eshell)
      (spacemacs/set-leader-keys "ass" 'eshell)))

;; (setq eshell-command-aliases-list
;;       (append eshell-command-aliases-list
;;               '(("de" "cd ~/.emacs.d")
;;                 ("ww" "cygstart")
;;                 ("hb" "helm-filtered-bookmarks")
;;                 ("ht" "helm-top")
;;                 ("bb" "helm-mini")
;;                 ("xbb" "ibuffer")
;;                 ("hf" "helm-for-files")
;;                 ("cf" "helm-for-files")
;;                 ("fr" "helm-recentf")
;;                 ("hl" "helm-resume")
;;                 ("d1" "cd ..")
;;                 ("d2" "cd ...")
;;                 ("d3" "cd ....")
;;                 ("d4" "cd .....")
;;                 ("ff" "spacemacs/helm-find-files")
;;                 ("xf" "ido-find-file")
;;                 ("eh" "helm-eshell-history")
;;                 ("xd" "ido-dired")
;;                 ("dum" "du -ah --max-depth=1")))) 

(provide 'init-sh)
