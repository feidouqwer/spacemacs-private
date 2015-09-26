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
      (global-set-key (kbd "<f7>") 'shell-pop-shell)))

(if (configuration-layer/package-usedp 'eshell)
    (progn
      (evil-set-initial-state 'eshell-mode 'emacs)
      (global-set-key (kbd "<f8>") 'shell-pop-eshell)))

(provide 'init-sh)
