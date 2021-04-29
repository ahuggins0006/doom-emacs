;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;;
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)
(require 'exwm-randr)
(setq exwm-randr-workspace-monitor-plist '(0 "DP-1.3" 1 "DP-2"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
             "xrandr" nil "xrandr
                                  --output DP-1.3 --mode 2560x1080 --pos 0x0 --rotate normal
                                  --output DP-2 --mode 1920x1080 --pos 2560x0 --rotate normal")))
;;(start-process-shell-command "xrandr" nil "xrandr --output DP-1.3 --scale .65x.65")
(setq exwm-workspace-number 2

 exwm-input-prefix-keys '(?\M-x
                               ?\M-:)
      exwm-input-simulation-keys '(([?\s-F] . [?\C-f])
                                   )
      exwm-input-global-keys '(([?\s-&] . (lambda (command)
                                          (interactive (list (read-shell-command "$ ")))
                                          (start-process-shell-command command nil command)))
                               ;; splits
                               ([?\s-v] . evil-window-vsplit)
                               ([?\s-z] . evil-window-split)
                               ;; managing workspaces
                               ([?\s-w] . exwm-workspace-switch)
                               ([?\s-W] . exwm-workspace-swap)
                               ([?\s-\C-w] . exwm-workspace-move)
                               ;; essential programs
                               ([?\s-d] . dired)
                               ([s-return] . eshell)
                               ([s-S-return] . dmenu)
                               ;; killing buffers and windows
                               ([?\s-b] . ibuffer)
                               ([?\s-B] . kill-current-buffer)
                               ([?\s-C] . +workspace/close-window-or-workspace)
                               ;; change window focus with super+h,j,k,l
                               ([?\s-h] . evil-window-left)
                               ([?\s-j] . evil-window-next)
                               ([?\s-k] . evil-window-prev)
                               ([?\s-l] . evil-window-right)
                               ;; move windows around using SUPER+SHIFT+h,j,k,l
                               ([?\s-H] . +evil/window-move-left)
                               ([?\s-J] . +evil/window-move-down)
                               ([?\s-K] . +evil/window-move-up)
                               ([?\s-L] . +evil/window-move-right)
                               ;; move window to far left or far right with SUPER+CTRL+h,l
                               ([?\s-\C-h] . side-left-window)
                               ([?\s-\C-j] . side-bottom-window)
                               ([?\s-\C-l] . side-right-window)
                               ([?\s-\C-d] . side-window-delete-all)
                               ([?\s-\C-r] . resize-window)
                               ;; switch workspace with SUPER+{0-9}
                               ([?\s-0] . (lambda () (interactive) (exwm-workspace-switch-create 0)))
                               ([?\s-1] . (lambda () (interactive) (exwm-workspace-switch-create 1)))
                               ([?\s-2] . (lambda () (interactive) (exwm-workspace-switch-create 2)))
                               ([?\s-3] . (lambda () (interactive) (exwm-workspace-switch-create 3)))
                               ([?\s-4] . (lambda () (interactive) (exwm-workspace-switch-create 4)))
                               ([?\s-5] . (lambda () (interactive) (exwm-workspace-switch-create 5)))
                               ([?\s-6] . (lambda () (interactive) (exwm-workspace-switch-create 6)))
                               ([?\s-7] . (lambda () (interactive) (exwm-workspace-switch-create 7)))
                               ([?\s-8] . (lambda () (interactive) (exwm-workspace-switch-create 8)))
                               ([?\s-9] . (lambda () (interactive) (exwm-workspace-switch-create 9)))
                               ;; move window workspace with SUPER+SHIFT+{0-9}
                               ([?\s-\)] . (lambda () (interactive) (exwm-workspace-move-window 0)))
                               ([?\s-!] . (lambda () (interactive) (exwm-workspace-move-window 1)))
                               ([?\s-@] . (lambda () (interactive) (exwm-workspace-move-window 2)))
                               ([?\s-#] . (lambda () (interactive) (exwm-workspace-move-window 3)))
                               ([?\s-$] . (lambda () (interactive) (exwm-workspace-move-window 4)))
                               ([?\s-%] . (lambda () (interactive) (exwm-workspace-move-window 5)))
                               ([?\s-^] . (lambda () (interactive) (exwm-workspace-move-window 6)))
                               ([?\s-&] . (lambda () (interactive) (exwm-workspace-move-window 7)))
                               ([?\s-*] . (lambda () (interactive) (exwm-workspace-move-window 8)))
                               ([?\s-\(] . (lambda () (interactive) (exwm-workspace-move-window 9)))
                               ;; setting some toggle commands
                               ([?\s-f] . exwm-floating-toggle-floating)
                               ([?\s-m] . exwm-layout-toggle-mode-line)
                               ([f11] . exwm-layout-toggle-fullscreen)))

(exwm-randr-enable)
(require 'exwm-systemtray)
(exwm-systemtray-enable)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andrew Huggins"
      user-mail-address "ahuggins0006@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
 ;;(setq doom-font (font-spec :family "FiraCode" :size 10 :weight 'semi-light)
       ;;doom-variable-pitch-font (font-spec :family "sans" :size 10))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(use-package! edwina
;;  :ensure t
;;  :config
;;  (setq display-buffer-base-action '(display-buffer-below-selected))
;;  (edwina-setup-dwm-keys)
;;  (edwina-mode 1))


;; Change window border size
(setq window-divider-default-bottom-width 25)
(setq window-divider-default-right-width 25)

;; Display clock in mode line with 24 hour format
(display-time-mode 1)
(setq display-time-24hr-format 1)
(display-battery-mode 1)
(size-indication-mode 1)

(setq ccls-initialization-options '(:index (:comments 2) :completion (:detailedLabel t)))
