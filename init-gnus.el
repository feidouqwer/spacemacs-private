
(setq gnus-secondary-select-methods
      '(
        (nnimap "mail.163.com"
                (nnimap-address
                 "imap.163.com")
                (nnimap-server-port 993)
                (nnimap-stream ssl))
        ))

(provide 'init-gnus)
