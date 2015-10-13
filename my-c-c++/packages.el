;;; packages.el --- my-c-c++ Layer packages File for Spacemacs
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
(setq my-c-c++-packages
    '(
      ;; package names go here
      cc-mode
      ycmd
      ))

;; List of packages to exclude.
(setq my-c-c++-excluded-packages '())

;; For each package, define a function my-c-c++/init-<package-name>
;;
;; (defun my-c-c++/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun fix-c-indent-offset-according-to-syntax-context (key val)
  ;; remove the old element
  (setq c-offsets-alist (delq (assoc key c-offsets-alist) c-offsets-alist))
  ;; new value
  (add-to-list 'c-offsets-alist '(key . val)))

(defun my-c-c++/pre-init-cc-mode ()
  ;; avoid default "gnu" style, use more popular one
  (setq c-default-style "linux") 

  (defun my-common-cc-mode-setup ()
    "setup shared by all languages (java/groovy/c++ ...)"
    (setq c-basic-offset 4)
    ;; give me NO newline automatically after electric expressions are entered
    (setq c-auto-newline nil)

    ;make DEL take all previous whitespace with it
    (c-toggle-hungry-state 1)

    ;; indent
    (fix-c-indent-offset-according-to-syntax-context 'substatement 0)
    (fix-c-indent-offset-according-to-syntax-context 'func-decl-cont 0)
    
    (ycmd-mode)
    )

  (add-hook 'c-mode-hook 'my-common-cc-mode-setup)
  (add-hook 'c++-mode-hook 'my-common-cc-mode-setup)
)

(defun my-c-c++/init-ycmd ()
  (use-package ycmd
    :config
    (dolist (mode '(c-mode c++-mode))
      (evil-leader/set-key-for-mode mode "myd" 'ycmd-goto-definition)
      (evil-leader/set-key-for-mode mode "myD" 'ycmd-goto-declaration)
      (evil-leader/set-key-for-mode mode "myi" 'ycmd-goto-implementation)
      (evil-leader/set-key-for-mode mode "myI" 'ycmd-goto-imprecise))
    ))
