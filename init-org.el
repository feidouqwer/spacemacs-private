(with-eval-after-load 'org
  (progn
    ;; define the refile targets
    (setq org-agenda-files (quote ("~/org-notes" )))
    (setq org-default-notes-file "~/org-notes/gtd.org")
    (setq org-todo-keywords
          '((sequence "TODO(t!)" "DOING(o)" "NEXT(n)" "WAITTING(w)" "SOMEDAY(s)" "|" "DONE(d@/!)" "ABORT(a@/!)")
            ))
    (setq-default org-use-sub-superscripts nil)
    (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                                  "xelatex -interaction nonstopmode %f"))

    (with-eval-after-load 'org-agenda
      (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
      (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
        "." 'spacemacs/org-agenda-transient-state/body)
      )
    ;; the %i would copy the selected text into the template
    ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
    ;;add multi-file journal
    (setq org-capture-templates
          '(("t" "Todo" entry (file+headline "~/org-notes/gtd.org" "Workspace")
             "* TODO [#B] %?\n  %i\n"
             :empty-lines 1)
            ("n" "notes" entry (file+headline "~/org-notes/notes.org" "Quick notes")
             "* TODO [#C] %?\n  %i\n %U"
             :empty-lines 1)
            ;; ("b" "Blog Ideas" entry (file+headline "~/org-notes/notes.org" "Blog Ideas")
            ;;  "* TODO [#B] %?\n  %i\n %U"
            ;;  :empty-lines 1)
            ("h" "hpdvr" entry (file+headline "~/org-notes/gtd.org" "HPDVR")
             "* TODO [#A] %?\n  %i\n %U"
             :empty-lines 1)
            ("m" "minicam" entry (file+headline "~/org-notes/gtd.org" "MINICAM")
             "* TODO [#A] %?\n  %i\n %U"
             :empty-lines 1)
            ("a" "a20hmi" entry (file+headline "~/org-notes/gtd.org" "A20HMI")
             "* TODO [#A] %?\n  %i\n %U"
             :empty-lines 1)
            ("c" "HDMICapture" entry (file+headline "~/org-notes/gtd.org" "HDMICapture")
             "* TODO [#A] %?\n  %i\n %U"
             :empty-lines 1)
            ("C" "CarCheck" entry (file+headline "~/org-notes/gtd.org" "CarCheck")
             "* TODO [#A] %?\n  %i\n %U"
             :empty-lines 1)
            ("v" "VideoTech" entry (file+headline "~/org-notes/gtd.org" "VideoTech")
             "* TODO [#B] %?\n  %i\n %U"
             :empty-lines 1)
            ("p" "Private" entry (file+headline "~/org-notes/private.org" "Private")
             "* TODO [#C] %?\n  %i\n %U"
             :empty-lines 1)
            ("l" "links" entry (file+headline "~/org-notes/notes.org" "Quick notes")
             "* TODO [#C] %?\n  %i\n %a \n %U"
             :empty-lines 1)
            ("j" "Journal Entry"
             entry (file+datetree "~/org-notes/journal.org")
             "* %?"
             :empty-lines 1)))

    ;;An entry without a cookie is treated just like priority ' B '.
    ;;So when create new task, they are default 重要且紧急
    (setq org-agenda-custom-commands
          '(
            ("w" . "任务安排")
            ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
            ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
            ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
            ("b" "Blog" tags-todo "BLOG")
            ("p" . "项目安排")
            ("ph" tags-todo "PROJECT+WORK+CATEGORY=\"HPDVR\"")
            ("pm" tags-todo "PROJECT+WORK+CATEGORY=\"MINICAM\"")
            ("pa" tags-todo "PROJECT+WORK+CATEGORY=\"A20HMI\"")
            ("pc" tags-todo "PROJECT+WORK+CATEGORY=\"HDMICapture\"")
            ("pl" tags-todo "LEARN")
            ("W" "Weekly Review"
             ((stuck "")            ;; review stuck projects as designated by org-stuck-projects
              (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
              ))))
    )
  )

(provide 'init-org)
