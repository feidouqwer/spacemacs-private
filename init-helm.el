
(if (configuration-layer/package-usedp 'helm)
    (evil-leader/set-key "fd" 'helm-for-files))

(defun my-spacemacs/helm-gtags-define-keys-for-mode (mode)
  "Define key bindings for the specific MODE."
  (when (fboundp mode)
    (evil-leader/set-key-for-mode mode
      "mge" 'helm-gtags-find-pattern
      "mgs" 'helm-gtags-find-symbol
      "mgS" 'helm-gtags-select
      "mgk" 'helm-gtags-show-stack)))

(if (configuration-layer/package-usedp 'helm-gtags)
    (progn
      (my-spacemacs/helm-gtags-define-keys-for-mode 'c-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'c++-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'tcl-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'java-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'vhdl-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'shell-script-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'awk-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'asm-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'dired-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'compilation-mode)
      (my-spacemacs/helm-gtags-define-keys-for-mode 'shell-mode)))

(provide 'init-helm)
