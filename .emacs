(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize) 
(add-to-list 'load-path "~/.emacs.d/evil")
;; (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
;; (setq evil-want-keybinding nil)
(require 'evil)
;; (when (require 'evil-collection nil t)
  ;; (evil-collection-init))
(evil-mode t)
(with-eval-after-load 'pdf (evil-collection-pdf-setup))
(add-to-list 'load-path (expand-file-name "~/elisp"))
(pdf-tools-install)
(require 'awesome-tab)
(awesome-tab-mode t)
(unless (display-graphic-p)
 (require 'evil-terminal-cursor-changer)
 (evil-terminal-cursor-changer-activate) ; or (etcc-on)
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers (quote visual))
 '(frame-background-mode (quote light))
 '(package-selected-packages
   (quote
    (evil-collection evil-terminal-cursor-changer nov evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:foreground "color-237" :family "Source Code Pro")))))

(setq visible-bell nil)
(menu-bar-mode -1)
(setq-default mode-line-format nil)
(global-hl-line-mode 1)
;; (set-face-attribute hl-line-face nil :underline t)
(set-display-table-slot standard-display-table 'wrap ?\ )
(display-line-numbers-mode)
(setq display-line-numbers 'relative)
;; (setq hl-line-range-function 'visual-line-range)
(setq scroll-step 1 scroll-conservatively 10000)
(setq evil-ex-search-case 'smart)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
;; (set-face-background 'hl-line "#dddddd")
;; (set-face-foreground 'highlight nil)
;;   (defun visual-line-range ()
;;     (save-excursion
;;       (cons
;;        (progn (beginning-of-visual-line) (point))
;;        (progn (end-of-visual-line) (point)))))

(define-key global-map [remap list-buffers] 'buffer-menu-other-window)
 (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map "i" nil)
(define-key Buffer-menu-mode-map (kbd "C-w j") 'evil-window-left)
(define-key Buffer-menu-mode-map (kbd "C-w k") 'evil-window-down)
(define-key Buffer-menu-mode-map (kbd "C-w i") 'evil-window-up)
(define-key Buffer-menu-mode-map (kbd "C-w l") 'evil-window-right)
(define-key Buffer-menu-mode-map (kbd "<escape>") 'delete-window)
(evil-make-overriding-map pdf-view-mode-map 'normal)
;; (evil-define-key 'normal pdf-view-mode-map
 ;; "i" 'pdf-view-previous-page-command
 ;; "k" (lambda () (interactive) (pdf-view-next-line-or-next-page 5))
 ;; "i" (lambda () (interactive) (pdf-view-previous-line-or-previous-page 5))
 ;; "k" 'pdf-view-next-page-command)
;; (general-evil-define-key 'normal pdf-view-mode-map
;;  "j" (general-simulate-keys "p" t)
;;  "k" (general-simulate-keys "C-n" t)
;;  "i" (general-simulate-keys "C-p" t)
;;  ;; alternatively to scroll more
;;  "k" (general-simulate-keys "SPC" t)
;;  "k" (general-simulate-keys "DEL" t)
;;  "l" (general-simulate-keys "n" t))
(global-set-key (kbd "<escape>") 'top-level)
(define-key minibuffer-local-map "<escape>" 'top-level)
(define-key minibuffer-local-ns-map "<escape>" 'top-level)
(define-key minibuffer-local-completion-map "<escape>" 'top-level)
(define-key minibuffer-local-must-match-map "<escape>" 'top-level)
(define-key minibuffer-local-isearch-map "<escape>" 'top-level)

(setq evil-motion-state-cursor 'box) ; █
 (setq evil-visual-state-cursor 'box) ; █
 (setq evil-normal-state-cursor 'box) ; █
 (setq evil-insert-state-cursor 'bar) ; ⎸
 (setq evil-emacs-state-cursor 'hbar) ; _
