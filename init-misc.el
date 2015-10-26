
;; set tab-wdith to 4
(setq-default tab-width 4)
;; for google translation
(setq google-translate-base-url
      "http://translate.google.cn/translate_a/single")
(setq google-translate-listen-url
      "http://translate.google.cn/translate_tts")

(evil-leader/set-key "xgy" 'youdao-dictionary-search-at-point+)
(evil-leader/set-key "xgY" 'youdao-dictionary-search-at-point)

(provide 'init-misc)
