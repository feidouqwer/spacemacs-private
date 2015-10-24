;;; packages.el --- my-misc Layer packages File for Spacemacs
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
(setq my-misc-packages
    '(
      ;; package names go here
      ;; company-ycmd
      ascii
      ))

;; List of packages to exclude.
(setq my-misc-excluded-packages '())

;; For each package, define a function my-misc/init-<package-name>
;;
;; (defun my-misc/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun my-misc/post-init-company-ycmd ()
  (message "$$$$$$$$$$$$$$$$$$$$$$$$$$ my-misc company ycmd")
  (push 'company-ycmd company-backends-c-mode-common))

(defun my-misc/init-ascii ()
  (use-package ascii
    :defer 1
    :config
    (progn
      (evil-leader/set-key "aid" 'ascii-display)
      (evil-leader/set-key "aio" 'ascii-on)
      (evil-leader/set-key "aic" 'ascii-off)))
  )

