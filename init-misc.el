
;; set tab-wdith to 4
(setq-default tab-width 4)
;; for google translation
(setq google-translate-base-url
      "http://translate.google.cn/translate_a/single")
(setq google-translate-listen-url
      "http://translate.google.cn/translate_tts")

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

(provide 'init-misc)
