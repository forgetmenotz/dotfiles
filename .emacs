(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize) 
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode t)
(add-to-list 'load-path (expand-file-name "~/elisp"))
(require 'awesome-tab)
(awesome-tab-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers (quote visual))
 '(package-selected-packages (quote (nov evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:foreground "color-237" :family "Source Code Pro")))))
(menu-bar-mode -1)
(setq-default mode-line-format nil)
(global-hl-line-mode 1)
(set-face-attribute hl-line-face nil :underline t)
(set-display-table-slot standard-display-table 'wrap ?\ )
(display-line-numbers-mode)
(setq display-line-numbers 'relative)
(setq hl-line-range-function 'visual-line-range)
(setq scroll-step 1 scroll-conservatively 10000)
(setq evil-ex-search-case 'smart)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
(set-face-background 'hl-line "#dddddd")
(set-face-foreground 'highlight nil)
;; (set-face-attribute 'default nil :font "Source Code Pro Regular-30" )
;; (set-frame-font "Source Code Pro Regular-30" nil t)
(defun visual-line-range ()
  (save-excursion
    (cons
     (progn (beginning-of-visual-line) (point))
     (progn (end-of-visual-line) (point)))))

(define-key global-map [remap list-buffers] 'buffer-menu-other-window)
;; (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map "i" nil)
(define-key Buffer-menu-mode-map (kbd "C-w j") 'evil-window-left)
(define-key Buffer-menu-mode-map (kbd "C-w k") 'evil-window-down)
(define-key Buffer-menu-mode-map (kbd "C-w i") 'evil-window-up)
(define-key Buffer-menu-mode-map (kbd "C-w l") 'evil-window-right)
(define-key Buffer-menu-mode-map (kbd "<escape>") 'delete-window)
(global-set-key (kbd "<escape>") 'top-level)
(define-key minibuffer-local-map "<escape>" 'top-level)
(define-key minibuffer-local-ns-map "<escape>" 'top-level)
(define-key minibuffer-local-completion-map "<escape>" 'top-level)
(define-key minibuffer-local-must-match-map "<escape>" 'top-level)
(define-key minibuffer-local-isearch-map "<escape>" 'top-level)