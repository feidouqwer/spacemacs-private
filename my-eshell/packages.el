;;; packages.el --- my-eshell Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq my-eshell-packages
    '(
      ;; package names go here
      eshell
      ))

;; List of packages to exclude.
(setq my-eshell-excluded-packages '())

;; For each package, define a function my-eshell/init-<package-name>
;;
;; (defun my-eshell/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun my-eshell/init-eshell ()
  "Initialize my eshell configure"
  (use-package eshell
    :defer t
    :config
    (progn
      (setq eshell-command-aliases-list
           (append eshell-command-aliases-list
                   '(("de" "cd ~/.emacs.d")
                     ("ww" "cygstart")
                     ("hb" "helm-filtered-bookmarks")
                     ("ht" "helm-top")
                     ("bb" "helm-mini")
                     ("xbb" "ibuffer")
                     ("hf" "helm-for-files")
                     ("cf" "helm-for-files")
                     ("fr" "helm-recentf")
                     ("hl" "helm-resume")
                     ("d1" "cd ..")
                     ("d2" "cd ...")
                     ("d3" "cd ....")
                     ("d4" "cd .....")
                     ("ff" "spacemacs/helm-find-files")
                     ("xf" "ido-find-file")
                     ("eh" "helm-eshell-history")
                     ("xd" "ido-dired")
                     ("dum" "du -ah --max-depth=1")))))))
