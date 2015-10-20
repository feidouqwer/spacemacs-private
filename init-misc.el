
;; set tab-wdith to 4
(setq-default tab-width 4)
;; for google translation
(setq google-translate-base-url
      "http://translate.google.cn/translate_a/single")
(setq google-translate-listen-url
      "http://translate.google.cn/translate_tts")
(evil-set-initial-state 'eshell-mode 'emacs)
(evil-set-initial-state 'shell-mode 'emacs)
(global-set-key (kbd "<f7>") 'shell)
(global-set-key (kbd "<f8>") 'eshell)

(provide 'init-misc)
