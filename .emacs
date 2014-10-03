(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '
             ("marmallade" . "http://marmalade-repo.org/packages/"))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d")
(setq user-mail-address "wilsonpjunior@gmail.com")
(column-number-mode)
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))
;; No backup files
(setq make-backup-files nil)

;; splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-screen t)

;; font face/size
;;(add-to-list 'default-frame-alist '(font . "10x14"))

;; No f*cking bell
(setq ring-bell-function 'ignore)

;; show white spaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; moving from one window to another
(global-set-key [(ctrl <)] 'next-multiframe-window)
(global-set-key [(ctrl >)] 'previous-multiframe-window)

;; moving from one frame to another
(global-set-key [(C-tab)] 'other-window)
(global-set-key [(shift C-tab)] '(lambda () (interactive) (other-window -1)))

;; Mac specific stuff
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  ;; sets fn-delete to be right-delete
  (global-set-key [kp-delete] 'delete-char)
  (menu-bar-mode 1))



;; scrolling without changing the cursor
(global-set-key [(meta n)] '(lambda () (interactive) (scroll-up 1)))
(global-set-key [(meta p)] '(lambda () (interactive) (scroll-down 1)))


;; ecb
(setq ecb-tip-of-the-day nil)

;; scrool
(setq scroll-conservatively 10000)

;; No f*cking bell
(setq ring-bell-function 'ignore)

;; encoding
(setq current-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(setq current-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)


;; disable arrow keys
;;(global-unset-key (kbd "<left>") )
;;(global-unset-key (kbd "<right>") )
;;(global-unset-key (kbd "<up>") )
;;(global-unset-key (kbd "<down>") )

;; javascript mode
(autoload 'javascript-mode "javascript" nil t)

(defun duplicate()
 "Duplicate it."
 (interactive)
 (let (
       (beg (line-beginning-position))
       (end (line-end-position)))
   (copy-region-as-kill beg end)
   (beginning-of-line)
   (forward-line 1)
   (yank)
   (newline)
   (forward-line -1)))

(global-set-key "\M-s\M-s" 'duplicate)

(defun print-to-pdf ()
  (interactive)
  (ps-spool-buffer-with-faces)
  (switch-to-buffer "*PostScript*")
  (write-file "/tmp/tmp.ps")
  (kill-buffer "tmp.ps")
  (setq cmd (concat "ps2pdf14 /tmp/tmp.ps " (buffer-name) ".pdf"))
  (shell-command cmd)
  (shell-command "rm /tmp/tmp.ps")
  (message (concat "Saved to:  " (buffer-name) ".pdf"))


  )

(require 'php-mode)
(require 'lua-mode)

;; rhtml mode
;;(add-to-list 'load-path "~/.emacs.d/rhtml")
;;(require 'rhtml-mode)
;;(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))

;; vala mode
(autoload 'vala-mode "vala-mode" "Major mode for editing Vala code." t)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

(add-to-list 'load-path "~/.emacs.d/vendor/jade-mode")
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; CoffeScript mode
(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

(add-hook 'html-mode-hook
  '(lambda() (html-custom)))


;; Always do syntax highlighting
;;(global-font-lock-mode 1)

;; Font face/size
;;(add-to-list 'default-frame-alist '(font . "Monospace 8"))
(add-to-list 'default-frame-alist '(font . "12x13"))


;; Whitespaces
(setq show-trailing-whitespace t)
;;; Also highlight parens
(setq show-paren-delay 0 show-paren-style 'parenthesis)
(show-paren-mode 1)

;; no bars
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)

;; highlight mark region
(transient-mark-mode 1)

;; gdb
(setq gdb-many-windows 1)

;; js2
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; show line numbers
(require 'linum)
(global-linum-mode 1)

;; scroll smoothly
(setq scroll-conservatively 10000)

(put 'upcase-region 'disabled nil)

;; spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Better use the default C-x *left* and C-x *right*
;(global-set-key [(meta next)]  'next-buffer)
;(global-set-key [(meta prior)] 'previous-buffer)
;; (global-set-key "\M-\C-n" 'next-buffer)
;; (global-set-key "\M-\C-p" 'previous-buffer)

; clipboard
(setq x-select-enable-clipboard t)

;; ---- key bindings ---

;; comments
(global-set-key [(ctrl c) (c)] 'comment-region)
(global-set-key [(ctrl c) (d)] 'uncomment-region)

;; scrolling

(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1))
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1))

(global-set-key [(meta n)] 'gcm-scroll-down)
(global-set-key [(meta p)] 'gcm-scroll-up)

;; scrolling other window
;(global-set-key "\M-\C-n" 'scroll-other-window)
;(global-set-key "\M-\C-p" 'scroll-other-window-down)

;; new window
;(global-set-key "\C-x\C-n"  'make-frame)

;; other window
(global-set-key [f5] 'projectile-find-file)
(global-set-key [f6] 'projectile-grep)
(global-set-key [f7] 'mc/mark-next-like-this)
(global-set-key [f8] 'dash-at-point)


;; mutt
(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(setq feature-default-language "pt")
;; ;; point to cucumber languages.yml or gherkin i18n.yml to use
;; ;; exactly the same localization your cucumber uses
(setq feature-default-i18n-file "~/.emacs.d/i18n.yml")

;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))


;; Set the number to the number of columns to use.
(setq-default fill-column 79)

;; Add Autofill mode to mode hooks.
;;(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Show line number in the mode line.
(line-number-mode 1)

;; Show column number in the mode line.
(column-number-mode 1)

(add-to-list 'load-path "~/.emacs.d/vendor/column-marker")
(require 'column-marker)
(set-face-background 'column-marker-1 "red")
(add-hook 'python-mode-hook
          (lambda () (interactive)
            (column-marker-1 fill-column)))


(setq flycheck-highlighting-mode 'lines)

(require 'py-autopep8)
(add-hook 'before-save-hook 'py-autopep8-before-save)

(defun git () (interactive) (magit-status "."))
(defun git-blame () (interactive) (mo-git-blame-current))

(add-hook 'python-mode-hook 'jedi:setup)

;; disable gui dialogs
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

(defun web-mode-hook ()
  "Hooks for web mode."

  (setq web-mode-markup-indent-offset 2)
  (web-mode-set-engine "django"))
(add-hook 'web-mode-hook 'web-mode-hook)

;; Loading YAS personal snippets
(yas-global-mode)
(yas/load-directory "~/.emacs.d/yasnippets") ;mine, not systems

;(require 'dropdown-list)
;(setq yas/prompt-functions '(yas/dropdown-prompt))

;; autocomplete setup
(require 'auto-complete-config)

(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; projectile to search fast mode file
(projectile-global-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)

(smartparens-global-mode)

(toggle-frame-fullscreen)

;; compact mode
(defvar-local hidden-mode-line-mode nil)
(defvar-local hide-mode-line nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))

;; Activate hidden-mode-line-mode
(hidden-mode-line-mode 1)
(add-hook 'after-change-major-mode-hook 'hidden-mode-line-mode)

(defmacro with-face (str &rest properties)
    `(propertize ,str 'face (list ,@properties)))

  (defun sl/make-header ()
    ""
    (let* ((sl/full-header (abbreviate-file-name buffer-file-name))
           (sl/header (file-name-directory sl/full-header))
           (sl/drop-str "[...]"))
      (if (> (length sl/full-header)
             (window-body-width))
          (if (> (length sl/header)
                 (window-body-width))
              (progn
                (concat (with-face sl/drop-str
                                   :background "blue"
                                   :weight 'bold
                                   )
                        (with-face (substring sl/header
                                              (+ (- (length sl/header)
                                                    (window-body-width))
                                                 (length sl/drop-str))
                                              (length sl/header))
                                   ;; :background "red"
                                   :weight 'bold
                                   )))
            (concat (with-face sl/header
                               ;; :background "red"
                               :foreground "#8fb28f"
                               :weight 'bold
                               )))
        (concat (with-face sl/header
                           ;; :background "green"
                           ;; :foreground "black"
                           :weight 'bold
                           :foreground "#8fb28f"
                           )
                (with-face (file-name-nondirectory buffer-file-name)
                           :weight 'bold
                           ;; :background "red"
                           )))))

  (defun sl/display-header ()
    (setq header-line-format
          '("" ;; invocation-name
            (:eval (if (buffer-file-name)
                       (sl/make-header)
                     "%b")))))



  (add-hook 'buffer-list-update-hook
            'sl/display-header)






(color-theme-initialize)
(require 'solarized-dark-theme)


(server-mode)
