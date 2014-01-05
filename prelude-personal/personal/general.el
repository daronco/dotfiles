; TODO: shortcuts for regex search
; TODO: downcase and uppercase
; TODO: bookmarks
; TODO: orgmode: http://orgmode.org/

; Disabled guru-mode
(defun disable-guru-mode ()
  (guru-mode -1))
(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)

; Disable line wrapping
(setq-default truncate-lines t)

; Indentation
(setq-default tab-width 2)              ; 2-space indent as default
(setq ruby-indent-level 2)              ; 2-space in ruby
(add-hook 'python-mode-hook             ; 2-space indent in python
          '(lambda ()
             (setq python-indent 2)))
(setq js-indent-level 2)                ; 2-space indent for javascript
(setq css-indent-offset 2)              ; 2-space in css/scss

; Always show whitespaces
(global-whitespace-mode 1) ; TODO: it's working but whitespaces aren't being shown

; Default line-length to 100 chars
(setq whitespace-line-column 100)

; Turn xclip on (requires system package xclip installed!)
(if (boundp 'xclip-mode)
    (xclip-mode 1))

; Remove the hook that enables abbrev-mode in text files
; Was causing an annoying error that removed words after pressing space
; with the message:
; "Symbol's function definition is void: snippet-insert"
(remove-hook 'text-mode-hook 'abbrev-mode)

; Scroll half page on page-up and page-down
; From: http://www.emacswiki.org/emacs/HalfScrolling
(defun window-half-height ()
  (max 1 (/ (1- (window-height (selected-window))) 2)))
(defun scroll-up-half ()
  (interactive)
  (scroll-up (window-half-height)))
(defun scroll-down-half ()
  (interactive)
  (scroll-down (window-half-height)))
(global-set-key [next] 'scroll-up-half)
(global-set-key [prior] 'scroll-down-half)

; Scroll when near the bottom/top of screen
(setq scroll-margin 7)

; Do NOT compile scss on save >.<
(setq scss-compile-at-save nil)

;; smart-mode-line makes the mode-line better
(require 'smart-mode-line)
(setq sml/override-theme nil) ; don't override the colors set by the theme
(if after-init-time (sml/setup)
  (add-hook 'after-init-hook 'sml/setup))

; TODO: markdown mode sucks right now, page down and up are mapped to other things
;       tried THOUSANDS of commands to unset the mapping of "M-[" (because page down
;       and up are interpreted as "M-[ ~ 6" and "M-[ ~ 5") but didn't work.
;       For now I just commented the keybindings in markdown-mode's file.
;       Search for: (define-key map (kbd "M-[") 'markdown-beginning-of-block)
