
;; set tab-wdith to 4
(setq-default tab-width 4)
;; set coding system
(prefer-coding-system 'cn-gb-2312)
(prefer-coding-system 'utf-8)
;; for google translation
(setq google-translate-base-url
      "http://translate.google.cn/translate_a/single")
(setq google-translate-listen-url
      "http://translate.google.cn/translate_tts")
(setq compilation-scroll-output t)

(defun qwer/find-user-bashrc-file ()
  "Edit the ~/.bashrc, in the current window."
  (interactive)
  (find-file-existing "~/.bashrc"))
(evil-leader/set-key "feb" 'qwer/find-user-bashrc-file)

(global-set-key (kbd "<f5>") 'compile)
(global-set-key (kbd "<f4>") 'shell-command)

(if (configuration-layer/package-usedp 'youdao-dictionary)
    (progn (evil-leader/set-key "xgy" 'youdao-dictionary-search-at-point+)
           (evil-leader/set-key "xgY" 'youdao-dictionary-search-at-point)))

(defun qwer/switch-to-compilation-other-window (prefix)
  (interactive "P")
  (let ((buffer (get-buffer "*compilation*")))
    (when buffer
      (if (not prefix)
          (switch-to-buffer-other-window buffer)
        (switch-to-buffer buffer)))))
(evil-leader/set-key "cw" 'qwer/switch-to-compilation-other-window)
(global-set-key (kbd "<f6>") 'qwer/switch-to-compilation-other-window)

(defun qwer/switch-to-serial-term-other-window (prefix)
  (interactive "P")
  (let ((buffer (get-buffer "/dev/ttyS0")))
    (if buffer
        (progn
          (if (not prefix)
              (switch-to-buffer-other-window buffer)
            (switch-to-buffer buffer)))
      (serial-term "/dev/ttyS0" 115200))))
(evil-leader/set-key "wt" 'qwer/switch-to-serial-term-other-window)

(defun qwer/switch-to-grep-other-window (prefix)
  (interactive "P")
  (let ((buffer (get-buffer "*grep*")))
    (when buffer
      (if (not prefix)
          (switch-to-buffer-other-window buffer)
        (switch-to-buffer buffer)))))
(evil-leader/set-key "cg" 'qwer/switch-to-compilation-grep-window)

(global-set-key (kbd "M-m") 'set-mark-command)
(global-set-key (kbd "C-M-SPC") 'toggle-input-method)

(evil-define-key 'normal grep-mode-map "h" 'evil-backward-char)
(evil-define-key 'motion grep-mode-map "h" 'evil-backward-char)
(evil-define-key 'motion Man-mode-map "o" 'Man-next-section)

(provide 'init-misc)
