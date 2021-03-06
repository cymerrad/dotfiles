;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "Radosław Cymer"
      user-mail-address "cymerrad@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; test
(setq doom-font (font-spec :family "monospace" :size 12)
      doom-variable-pitch-font (font-spec :family "sans"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-dark+)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/Documents/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; (after! helm
;;   ;; I want backspace to go up a level, like ivy
;;   (add-hook! 'helm-find-files-after-init-hook
;;     (map! :map helm-find-files-map
;;           "<DEL>" #'helm-find-files-up-one-level)))

;;(use-package doom-themes
;;  :config
;;  (doom-themes-set-faces 'doom-one
;;    '(functions yellow)
;;    '(variables fg)))


(setq confirm-kill-processes nil)

;; this fixes irritating (and wrong) warning on IPython startup
;; https://github.com/emacs-mirror/emacs/blob/master/lisp/progmodes/python.el#L2279
(setq python-shell-prompt-detect-failure-warning nil)
(setq +python-ipython-repl-args '("--quiet --simple-prompt" "--no-color-info"))

;; TODO
;; better kill previous word
;; smartparens isn't smart enough: after deleting left paren, delete also right
;; more VSCode shortcuts for opening tree view and jumping around

;;
