
(setq gnus-secondary-select-methods
      '(
        (nnimap "mail.163.com"
                (nnimap-address
                 "imap.163.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl))
        ))

;; store email in ~/mail directory
(setq nnml-directory "~/mail")
(setq message-directory "~/mail")

(provide 'init-gnus)
