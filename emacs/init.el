;; Make sure to install rust-analyzer binary, otherwise lsp-mode
;; default to using rls instead of rust-analyzer.

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  ;; (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq inhibit-startup-screen t)
(column-number-mode 1)
;;(setq linum-format "%d ")


;;(global-display-line-numbers-mode)
;;(global-linum-mode 1)
;;(setq linum-format "%4d \u2502 ")

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

;;(set-face-attribute 'region nil :background "#fffacd")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;Others;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun comment-dwim-line (&optional arg)
        "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
          (interactive "*P")
          (comment-normalize-vars)
          (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
              (comment-or-uncomment-region (line-beginning-position) (line-end-position))
            (comment-dwim arg)))

(global-set-key "\M-;" 'comment-dwim-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'use-package)
(setq use-package-always-ensure t)


(use-package zenburn-theme
  :ensure t
  :config
  ;;(load-theme 'zenburn t)
  )
	     


(use-package base16-theme
  :ensure t
  :config
  ;;(load-theme 'base16-monokai t)
  )

(use-package monokai-pro-theme 
	:ensure t
	:config
	(load-theme 'monokai-pro-spectrum t))


(use-package bind-key
	     :ensure t)

(use-package default-text-scale
    :ensure t
    :config
    (setq default-text-scale-amount 10)
    :bind
    ;; Plus makes it better
    ("M-+" . default-text-scale-increase)
    ;; Underscore makes it smaller (- is already bound)
    ("M-_" . default-text-scale-decrease))

(use-package ag)

(use-package helm-ag
  :after ag)

(use-package helm-projectile
  :after helm
  :config
  (helm-projectile-on))

(use-package diminish)

(use-package helm
  :diminish helm-mode
  :init
  (require 'helm-config)
  :bind
  ("C-c f" . helm-projectile-find-file-dwim)
  ("M-x" . helm-M-x)
  ("C-x r b" . helm-filtered-bookmarks)
  ("C-x C-f" . helm-find-files)
  :init
  (helm-mode 1)
  (customize-set-variable 'helm-ff-lynx-style-map t))

(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :demand t
  :bind
  ("M-<down>" . next-error)
  ("M-<up>" . previous-error)
  ;; :init
  ;; (setq flycheck-standard-error-navigation nil)
  )

(use-package company
  :diminish company-mode
  :hook (prog-mode . company-mode)
  :config (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1)
  (setq company-async-timeout 10))



(use-package lsp-mode
  :commands lsp
  :diminish lsp-mode
  :bind
  ("M-." . 'lsp-find-definition)
  ("M-t" . 'lsp-find-type-definition)
  ("M-?" . 'lsp-find-references)
  ;; ("C-c t" . rust-test)
  ;; ("C-c b" . cargo-process-build)
  :config
  ;;(require 'lsp-clients)
  (setq lsp-prefer-flymake nil))


(use-package rust-mode
  :hook (rust-mode . lsp)
  :bind
  ("C-c g" . rust-run)
  ("C-c t" . rust-test)
  ("C-c b" . cargo-process-build)
  :init
  (which-function-mode 1)
  (setq compilation-error-regexp-alist-alist
      (cons '(cargo "^\\([^ \n]+\\):\\([0-9]+\\):\\([0-9]+\\): \\([0-9]+\\):\\([0-9]+\\) \\(?:[Ee]rror\\|\\([Ww]arning\\)\\):" 1 (2 . 4) (3 . 5) (6))
        compilation-error-regexp-alist-alist))
  :config
  (setq rust-format-on-save t))

;; Add keybindings for interacting with Cargo
(use-package cargo
  :hook (rust-mode . cargo-minor-mode)
  :diminish cargo-minor-mode)

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package racer
  :after rust-mode
  :diminish racer-mode
  :hook (rust-mode . racer-mode)
  :bind
  ("M-j" . racer-find-definition)
  ;; (:map racer-mode-map ("M-." . #'xref-find-definitions))
  (:map racer-mode-map ("M-." . nil))
  )

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))


(use-package yasnippet
  :demand t
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets")))

	
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yasnippet magit racer flycheck-rust cargo rust-mode lsp-mode company-lsp company flycheck diminish helm-projectile helm-ag ag default-text-scale zenburn-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
