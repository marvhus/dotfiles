(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
;(package-initialize)
;(package-refresh-contents)

;; set type of line numbering (global variable)
(setq-default display-line-numbers 'relative
			  display-line-numbers-current-absolute t)

;; Set Font
(set-face-attribute 'default nil :font "Hack 13")

;; Hide Tool Bar
(tool-bar-mode -1)

;; evil
(require 'evil)
;(evil-mode 1)

;; lsp
(setq lsp-keymap-prefix "C-c l")
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)

;; company
(add-hook 'after-init-hook 'global-company-mode)

;; Good File Finding
(ivy-mode 1)

;; Drag Stuff
(require 'drag-stuff)
(drag-stuff-mode t)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;; Scrolling and tab width
(setq-default tab-width 4)
(setq scroll-margin 20)
(setq scroll-conservatively 101)

;; misc settings
(setq org-image-actual-width nil)
(setq calendar-week-start-day 1)
(setq column-number-mode t)
(setq scroll-bar-mode 0)
;; NO I DO NOT WANT THEESE
;; (setq backup-directory-alist `(("." . "~/.saves")))
(setq make-backup-files nil) ; stop creating ~ files
(setq create-lockfiles nil) ; stop creating .# files
(setq make-backup-files nil) ; stop creating # files

;; C stuff
(setq-default c-basic-offset 4)

(setq split-width-threshold nil)

;; Add stuff to path
(exec-path-from-shell-initialize)

;; Set Theme
;(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/gruber-darker-theme-20221122.1143")
;(load-theme 'gruber-darker t)
(load-theme 'adwaita t)

;;; Keybinds
(global-set-key (kbd "<C-return>") 'save-buffer)

(global-set-key (kbd "C-c r") 'recompile)
(global-set-key (kbd "C-c c") 'compile)

(global-set-key [C-w v] 'split-window-right)
(global-set-key [C-w s] 'split-window-below)
(global-set-key [C-w q] 'delete-window)

(global-set-key (kbd "<C-up>")		'shrink-window)
(global-set-key (kbd "<C-down>")	'enlarge-window)
(global-set-key (kbd "<C-left>")	'shrink-window-horizontally)
(global-set-key (kbd "<C-right>")	'enlarge-window-horizontally)

(global-set-key (kbd "C-S-<up>")	'windmove-up)
(global-set-key (kbd "C-S-<down>")	'windmove-down)
(global-set-key (kbd "C-S-<left>")	'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c x") 'execute-extended-command)

(define-key evil-normal-state-map (kbd "C-u") 'undo-fu-only-undo)
(define-key evil-normal-state-map (kbd "C-r") 'undo-fu-only-redo)

;;; Emacs stuff --- dont touch
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bddf21b7face8adffc42c32a8223c3cc83b5c1bbd4ce49a5743ce528ca4da2b6" default))
 '(package-selected-packages
   '(lsp-jedi v-mode haskell-mode flycheck magit dap-mode undo-fu rust-mode company lsp-mode drag-stuff exec-path-from-shell gruber-darker-theme evil ivy smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
