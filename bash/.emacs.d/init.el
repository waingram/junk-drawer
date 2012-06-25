;; Emacs personalization

(defvar system-type-as-string (prin1-to-string system-type))

;; I like line numbers
(setq-default line-number-mode 't)
(setq-default column-number-mode 't)

;; read compressed files
(auto-compression-mode 1)

;; don't beep
(setq-default visible-bell t)

;; highlight marked region
(setq-default transient-mark-mode t)

;; font lock
(global-font-lock-mode t)

;; pretty text
(setq font-lock-maximum-decoration t)

;; colors
(set-foreground-color "white")
(set-background-color "black")
(set-cursor-color "yellow")
(set-mouse-color "white")

;; font
(set-default-font "9x15bold")

;; frames
(setq default-frame-alist
      '((background-color . "black")
	(foreground-color . "white")
	(scroll-bar-foreground-color . "red")
	(vertical-scroll-bars . right)
	(scroll-bar-width . 17)
	(top . 20)
	(left . 10)
	(mouse-color . "white")
	(cursor-color . "yellow")
	(font . "9x15bold")
	(width . 130)
	(height . 38)))

(setq initial-frame-alist
      '((top . 20)
	(left . 10)
	(width . 140)
	(height . 39)))

;; ruby
(setq ruby-indent-level 4)
;; Treat .rjs files as Ruby
(setq auto-mode-alist (cons '("\\.rjs\\'" . ruby-mode) auto-mode-alist))
;; Rakefiles are Ruby files:
(setq auto-mode-alist (cons '("\\Rakefile\\'" . ruby-mode) auto-mode-alist))
;; So is Gemfile:
(setq auto-mode-alist (cons '("\\Gemfile\\'" . ruby-mode) auto-mode-alist))

;; mouse
(defun up-slow () (interactive) (scroll-up 1))
(defun down-slow () (interactive) (scroll-down 1))

(defun up-semi-slow () (interactive) (scroll-up 2))
(defun down-semi-slow () (interactive) (scroll-down 2))

(defun up-medium () (interactive) (scroll-up 3))
(defun down-medium () (interactive) (scroll-down 3))

(global-set-key [mouse-4] 'down-medium)
(global-set-key [mouse-5] 'up-medium)

(global-set-key [S-mouse-4] 'down-slow)
(global-set-key [S-mouse-5] 'up-slow)

(defun up-fast () (interactive) (scroll-up 8))
(defun down-fast () (interactive) (scroll-down 8))
(global-set-key [C-mouse-4] 'down-fast)
(global-set-key [C-mouse-5] 'up-fast)

;; Ordinarily emacs jumps by half a page when scrolling -- reduce:
(setq scroll-step 1)

;; keyboard scroll 
(global-set-key "\M-N" 'up-semi-slow)
(global-set-key "\M-P" 'down-semi-slow)

;; window title
(setq frame-title-format
      (list ""
	    "%b"
	    " @ "
	    system-name
            " ("
            system-type-as-string
            ")"
	    ))



;; font-face
(set-face-foreground 'bold "LightGoldenrod")
(set-face-background 'bold "grey20")

(set-face-foreground 'bold-italic "yellow green")

(set-face-foreground 'italic "yellow3")

(set-face-background 'region "DarkSlateGrey")

(set-face-foreground 'isearch "white")
(set-face-background 'isearch "SteelBlue3")

(set-face-foreground 'font-lock-comment-face "green")
(set-face-background 'font-lock-comment-face "black")

(set-face-foreground 'font-lock-string-face "LightSalmon")
(set-face-background 'font-lock-string-face "black")

(set-face-foreground 'font-lock-doc-face "LightSalmon2")
(set-face-background 'font-lock-doc-face "black")

(set-face-foreground 'font-lock-function-name-face "gold")
(set-face-background 'font-lock-function-name-face "gray10")

(set-face-foreground 'font-lock-variable-name-face "LightGoldenrod")
(set-face-background 'font-lock-variable-name-face "black")

(set-face-foreground 'font-lock-keyword-face "gold")
(set-face-background 'font-lock-keyword-face "black")

;; Face: font-lock-type-face
;; Documentation: Font Lock mode face used to highlight types and classes.
(set-face-foreground 'font-lock-type-face "cyan")

(set-face-foreground 'modeline "black")
(set-face-background 'modeline "SteelBlue2") ;; "#5cacee"

(set-face-foreground 'highlight "black")
(set-face-foreground 'secondary-selection "black")