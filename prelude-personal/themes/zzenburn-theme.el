;;; zzenburn-theme.el --- A low contrast color theme for Emacs.

;; Copyright (C) 2011-2013 Bozhidar Batsov

;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: http://github.com/bbatsov/zzenburn-emacs
;; Version: 20140104.1137
;; X-Original-Version: 2.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; A port of the popular Vim theme Zzenburn for Emacs 24, built on top
;; of the new built-in theme support in Emacs 24.

;;; Credits:

;; Jani Nurminen created the original theme for vim on such this port
;; is based.

;;; Code:

(deftheme zzenburn "The Zzenburn color theme adapted by @daronco")

;;; Color Palette

(defvar zzenburn-colors-alist
  '(("zzenburn-fg+1"     . "#FFFFEF")
    ("zzenburn-fg"       . "#DCDCCC")
    ("zzenburn-fg-1"     . "#656555")
    ("zzenburn-bg-2"     . "#000000")
    ("zzenburn-bg-1"     . "#161616")
    ("zzenburn-bg-05"    . "#282828")
    ("zzenburn-bg"       . "#2F2F2F")
    ("zzenburn-bg+1"     . "#4F4F4F")
    ("zzenburn-bg+2"     . "#5F5F5F")
    ("zzenburn-bg+3"     . "#6F6F6F")
    ("zzenburn-red+1"    . "#DCA3A3")
    ("zzenburn-red"      . "#CC9393")
    ("zzenburn-red-1"    . "#BC8383")
    ("zzenburn-red-2"    . "#AC7373")
    ("zzenburn-red-3"    . "#9C6363")
    ("zzenburn-red-4"    . "#8C5353")
    ("zzenburn-orange"   . "#DFAF8F")
    ("zzenburn-yellow"   . "#F0DFAF")
    ("zzenburn-yellow-1" . "#E0CF9F")
    ("zzenburn-yellow-2" . "#D0BF8F")
    ("zzenburn-green-1"  . "#5F7F5F")
    ("zzenburn-green"    . "#7F9F7F")
    ("zzenburn-green+1"  . "#8FB28F")
    ("zzenburn-green+2"  . "#9FC59F")
    ("zzenburn-green+3"  . "#AFD8AF")
    ("zzenburn-green+4"  . "#BFEBBF")
    ("zzenburn-cyan"     . "#93E0E3")
    ("zzenburn-blue+1"   . "#94BFF3")
    ("zzenburn-blue"     . "#8CD0D3")
    ("zzenburn-blue-1"   . "#7CB8BB")
    ("zzenburn-blue-2"   . "#6CA0A3")
    ("zzenburn-blue-3"   . "#5C888B")
    ("zzenburn-blue-4"   . "#4C7073")
    ("zzenburn-blue-5"   . "#366060")
    ("zzenburn-magenta"  . "#DC8CC3"))
  "List of Zzenburn colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro zzenburn-with-color-variables (&rest body)
  "`let' bind all colors defined in `zzenburn-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   zzenburn-colors-alist))
     ,@body))

;;; Theme Faces
(zzenburn-with-color-variables
  (custom-theme-set-faces
   'zzenburn
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(link ((t (:foreground ,zzenburn-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,zzenburn-yellow-2 :underline t :weight normal))))
   `(default ((t (:foreground ,zzenburn-fg :background ,zzenburn-bg))))
   `(cursor ((t (:foreground ,zzenburn-fg :background ,zzenburn-fg+1))))
   `(escape-glyph ((t (:foreground ,zzenburn-yellow :bold t))))
   `(fringe ((t (:foreground ,zzenburn-fg :background ,zzenburn-bg+1))))
   `(header-line ((t (:foreground ,zzenburn-yellow
                                  :background ,zzenburn-bg-1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,zzenburn-bg-05))))
   `(success ((t (:foreground ,zzenburn-green :weight bold))))
   `(warning ((t (:foreground ,zzenburn-orange :weight bold))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,zzenburn-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,zzenburn-green))))
   `(compilation-error-face ((t (:foreground ,zzenburn-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,zzenburn-fg))))
   `(compilation-info-face ((t (:foreground ,zzenburn-blue))))
   `(compilation-info ((t (:foreground ,zzenburn-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,zzenburn-green))))
   `(compilation-line-face ((t (:foreground ,zzenburn-yellow))))
   `(compilation-line-number ((t (:foreground ,zzenburn-yellow))))
   `(compilation-message-face ((t (:foreground ,zzenburn-blue))))
   `(compilation-warning-face ((t (:foreground ,zzenburn-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,zzenburn-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,zzenburn-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,zzenburn-yellow :weight bold))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,zzenburn-fg))))
   `(grep-error-face ((t (:foreground ,zzenburn-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,zzenburn-blue))))
   `(grep-match-face ((t (:foreground ,zzenburn-orange :weight bold))))
   `(match ((t (:background ,zzenburn-bg-1 :foreground ,zzenburn-orange :weight bold))))
;;;;; isearch
   `(isearch ((t (:foreground ,zzenburn-yellow-2 :weight bold :background ,zzenburn-bg-1))))
   `(isearch-fail ((t (:foreground ,zzenburn-fg :background ,zzenburn-red-4))))
   `(lazy-highlight ((t (:foreground ,zzenburn-yellow-2 :weight bold :background ,zzenburn-bg-05))))

   `(menu ((t (:foreground ,zzenburn-fg :background ,zzenburn-bg))))
   `(minibuffer-prompt ((t (:foreground ,zzenburn-yellow))))
   `(mode-line
     ((,class (:foreground ,zzenburn-green+1
                           :background ,zzenburn-bg-1
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,zzenburn-green-1
                      :background ,zzenburn-bg-05
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,zzenburn-bg-1))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,zzenburn-bg+2))))
   `(trailing-whitespace ((t (:background ,zzenburn-red))))
   `(vertical-border ((t (:foreground ,zzenburn-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,zzenburn-fg :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,zzenburn-green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,zzenburn-green-1))))
   `(font-lock-constant-face ((t (:foreground ,zzenburn-green+4))))
   `(font-lock-doc-face ((t (:foreground ,zzenburn-green+2))))
   `(font-lock-function-name-face ((t (:foreground ,zzenburn-cyan))))
   `(font-lock-keyword-face ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,zzenburn-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,zzenburn-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,zzenburn-red))))
   `(font-lock-type-face ((t (:foreground ,zzenburn-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,zzenburn-orange))))
   `(font-lock-warning-face ((t (:foreground ,zzenburn-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,zzenburn-fg))))
   `(newsticker-default-face ((t (:foreground ,zzenburn-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,zzenburn-green+3))))
   `(newsticker-extra-face ((t (:foreground ,zzenburn-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,zzenburn-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,zzenburn-green))))
   `(newsticker-new-item-face ((t (:foreground ,zzenburn-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,zzenburn-red))))
   `(newsticker-old-item-face ((t (:foreground ,zzenburn-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,zzenburn-fg))))
   `(newsticker-treeview-face ((t (:foreground ,zzenburn-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,zzenburn-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,zzenburn-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,zzenburn-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,zzenburn-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,zzenburn-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,zzenburn-bg-1 :foreground ,zzenburn-yellow))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,zzenburn-fg-1 :background ,zzenburn-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,zzenburn-green+2 :background ,zzenburn-bg :inverse-video nil))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,zzenburn-cyan :weight bold))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,zzenburn-fg))))
   `(ack-file ((t (:foreground ,zzenburn-blue))))
   `(ack-line ((t (:foreground ,zzenburn-yellow))))
   `(ack-match ((t (:foreground ,zzenburn-orange :background ,zzenburn-bg-1 :weight bold))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,zzenburn-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,zzenburn-yellow))))
   `(font-latex-italic-face ((t (:foreground ,zzenburn-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,zzenburn-orange))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,zzenburn-bg+3 :foreground ,zzenburn-bg-2))))
   `(ac-selection-face ((t (:background ,zzenburn-blue-4 :foreground ,zzenburn-fg))))
   `(popup-tip-face ((t (:background ,zzenburn-yellow-2 :foreground ,zzenburn-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,zzenburn-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,zzenburn-bg-1))))
   `(popup-isearch-match ((t (:background ,zzenburn-bg :foreground ,zzenburn-fg))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,zzenburn-green+1))))
   `(android-mode-error-face ((t (:foreground ,zzenburn-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,zzenburn-fg))))
   `(android-mode-verbose-face ((t (:foreground ,zzenburn-green))))
   `(android-mode-warning-face ((t (:foreground ,zzenburn-yellow))))
;;;;; bm
   `(bm-face ((t (:background ,zzenburn-yellow-1 :foreground ,zzenburn-bg))))
   `(bm-fringe-face ((t (:background ,zzenburn-yellow-1 :foreground ,zzenburn-bg))))
   `(bm-fringe-persistent-face ((t (:background ,zzenburn-green-1 :foreground ,zzenburn-bg))))
   `(bm-persistent-face ((t (:background ,zzenburn-green-1 :foreground ,zzenburn-bg))))
;;;;; clojure-test-mode
   `(clojure-test-failure-face ((t (:foreground ,zzenburn-orange :weight bold :underline t))))
   `(clojure-test-error-face ((t (:foreground ,zzenburn-red :weight bold :underline t))))
   `(clojure-test-success-face ((t (:foreground ,zzenburn-green+1 :weight bold :underline t))))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,zzenburn-blue :foreground ,zzenburn-bg))))
   `(ctbl:face-continue-bar ((t (:background ,zzenburn-bg-05 :foreground ,zzenburn-bg))))
   `(ctbl:face-row-select ((t (:background ,zzenburn-cyan :foreground ,zzenburn-bg))))
;;;;; diff
   `(diff-added ((,class (:foreground ,zzenburn-green+4 :background nil))
                 (t (:foreground ,zzenburn-green-1 :background nil))))
   `(diff-changed ((t (:foreground ,zzenburn-yellow))))
   `(diff-removed ((,class (:foreground ,zzenburn-red :background nil))
                   (t (:foreground ,zzenburn-red-3 :background nil))))
   `(diff-refine-added ((t :inherit diff-added :weight bold)))
   `(diff-refine-change ((t :inherit diff-changed :weight bold)))
   `(diff-refine-removed ((t :inherit diff-removed :weight bold)))
   `(diff-header ((,class (:background ,zzenburn-bg+2))
                  (t (:background ,zzenburn-fg :foreground ,zzenburn-bg))))
   `(diff-file-header
     ((,class (:background ,zzenburn-bg+2 :foreground ,zzenburn-fg :bold t))
      (t (:background ,zzenburn-fg :foreground ,zzenburn-bg :bold t))))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,zzenburn-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,zzenburn-orange))))
   `(diredp-date-time ((t (:foreground ,zzenburn-magenta))))
   `(diredp-deletion ((t (:foreground ,zzenburn-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,zzenburn-red))))
   `(diredp-dir-heading ((t (:foreground ,zzenburn-blue :background ,zzenburn-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,zzenburn-cyan))))
   `(diredp-exec-priv ((t (:foreground ,zzenburn-red))))
   `(diredp-executable-tag ((t (:foreground ,zzenburn-green+1))))
   `(diredp-file-name ((t (:foreground ,zzenburn-blue))))
   `(diredp-file-suffix ((t (:foreground ,zzenburn-green))))
   `(diredp-flag-mark ((t (:foreground ,zzenburn-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,zzenburn-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,zzenburn-red))))
   `(diredp-link-priv ((t (:foreground ,zzenburn-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,zzenburn-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,zzenburn-orange))))
   `(diredp-no-priv ((t (:foreground ,zzenburn-fg))))
   `(diredp-number ((t (:foreground ,zzenburn-green+1))))
   `(diredp-other-priv ((t (:foreground ,zzenburn-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,zzenburn-red-1))))
   `(diredp-read-priv ((t (:foreground ,zzenburn-green-1))))
   `(diredp-symlink ((t (:foreground ,zzenburn-yellow))))
   `(diredp-write-priv ((t (:foreground ,zzenburn-magenta))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,zzenburn-fg :background ,zzenburn-red-4))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,zzenburn-fg :background ,zzenburn-red-4))))
   `(ediff-current-diff-B ((t (:foreground ,zzenburn-fg :background ,zzenburn-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,zzenburn-fg :background ,zzenburn-blue-5))))
   `(ediff-even-diff-A ((t (:background ,zzenburn-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,zzenburn-bg+1))))
   `(ediff-even-diff-B ((t (:background ,zzenburn-bg+1))))
   `(ediff-even-diff-C ((t (:background ,zzenburn-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,zzenburn-fg :background ,zzenburn-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,zzenburn-fg :background ,zzenburn-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,zzenburn-fg :background ,zzenburn-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,zzenburn-fg :background ,zzenburn-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,zzenburn-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,zzenburn-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,zzenburn-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,zzenburn-bg+2))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,zzenburn-green+4 :background ,zzenburn-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,zzenburn-red :background ,zzenburn-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,zzenburn-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,zzenburn-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,zzenburn-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,zzenburn-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,zzenburn-cyan :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,zzenburn-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-red-1) :inherit unspecified))
      (t (:foreground ,zzenburn-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-yellow) :inherit unspecified))
      (t (:foreground ,zzenburn-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-cyan) :inherit unspecified))
      (t (:foreground ,zzenburn-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,zzenburn-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,zzenburn-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,zzenburn-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,zzenburn-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,zzenburn-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-orange) :inherit unspecified))
      (t (:foreground ,zzenburn-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-red) :inherit unspecified))
      (t (:foreground ,zzenburn-red-1 :weight bold :underline t))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,zzenburn-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,zzenburn-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,zzenburn-yellow))))
   `(erc-keyword-face ((t (:foreground ,zzenburn-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,zzenburn-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default))))
   `(erc-notice-face ((t (:foreground ,zzenburn-green))))
   `(erc-pal-face ((t (:foreground ,zzenburn-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,zzenburn-orange :background ,zzenburn-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,zzenburn-green+4))))
   `(erc-underline-face ((t (:underline t))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,zzenburn-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,zzenburn-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,zzenburn-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,zzenburn-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,zzenburn-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,zzenburn-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,zzenburn-magenta :weight bold))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-from))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((t (:foreground ,zzenburn-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,zzenburn-blue))))
   `(gnus-summary-high-read ((t (:foreground ,zzenburn-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,zzenburn-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,zzenburn-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,zzenburn-blue))))
   `(gnus-summary-low-read ((t (:foreground ,zzenburn-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,zzenburn-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,zzenburn-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,zzenburn-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,zzenburn-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,zzenburn-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,zzenburn-fg))))
   `(gnus-summary-selected ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,zzenburn-blue))))
   `(gnus-cite-10 ((t (:foreground ,zzenburn-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,zzenburn-yellow))))
   `(gnus-cite-2 ((t (:foreground ,zzenburn-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,zzenburn-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,zzenburn-green+2))))
   `(gnus-cite-5 ((t (:foreground ,zzenburn-green+1))))
   `(gnus-cite-6 ((t (:foreground ,zzenburn-green))))
   `(gnus-cite-7 ((t (:foreground ,zzenburn-red))))
   `(gnus-cite-8 ((t (:foreground ,zzenburn-red-1))))
   `(gnus-cite-9 ((t (:foreground ,zzenburn-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,zzenburn-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,zzenburn-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,zzenburn-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,zzenburn-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,zzenburn-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,zzenburn-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,zzenburn-bg+2))))
   `(gnus-signature ((t (:foreground ,zzenburn-yellow))))
   `(gnus-x ((t (:background ,zzenburn-fg :foreground ,zzenburn-bg))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,zzenburn-blue))))
   `(guide-key/key-face ((t (:foreground ,zzenburn-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,zzenburn-green+1))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,zzenburn-green
                      :background ,zzenburn-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,zzenburn-yellow
                      :background ,zzenburn-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,zzenburn-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,zzenburn-bg+1))))
   `(helm-visible-mark ((t (:foreground ,zzenburn-bg :background ,zzenburn-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,zzenburn-green+4 :background ,zzenburn-bg-1))))
   `(helm-separator ((t (:foreground ,zzenburn-red :background ,zzenburn-bg))))
   `(helm-time-zone-current ((t (:foreground ,zzenburn-green+2 :background ,zzenburn-bg))))
   `(helm-time-zone-home ((t (:foreground ,zzenburn-red :background ,zzenburn-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,zzenburn-orange :background ,zzenburn-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,zzenburn-magenta :background ,zzenburn-bg))))
   `(helm-bookmark-info ((t (:foreground ,zzenburn-green+2 :background ,zzenburn-bg))))
   `(helm-bookmark-man ((t (:foreground ,zzenburn-yellow :background ,zzenburn-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,zzenburn-magenta :background ,zzenburn-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,zzenburn-red :background ,zzenburn-bg))))
   `(helm-buffer-process ((t (:foreground ,zzenburn-cyan :background ,zzenburn-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,zzenburn-fg :background ,zzenburn-bg))))
   `(helm-buffer-size ((t (:foreground ,zzenburn-fg-1 :background ,zzenburn-bg))))
   `(helm-ff-directory ((t (:foreground ,zzenburn-cyan :background ,zzenburn-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,zzenburn-fg :background ,zzenburn-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,zzenburn-green+2 :background ,zzenburn-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,zzenburn-red :background ,zzenburn-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,zzenburn-yellow :background ,zzenburn-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,zzenburn-bg :background ,zzenburn-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,zzenburn-cyan :background ,zzenburn-bg))))
   `(helm-grep-file ((t (:foreground ,zzenburn-fg :background ,zzenburn-bg))))
   `(helm-grep-finish ((t (:foreground ,zzenburn-green+2 :background ,zzenburn-bg))))
   `(helm-grep-lineno ((t (:foreground ,zzenburn-fg-1 :background ,zzenburn-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,zzenburn-red :background ,zzenburn-bg))))
   `(helm-moccur-buffer ((t (:foreground ,zzenburn-cyan :background ,zzenburn-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,zzenburn-fg-1 :background ,zzenburn-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,zzenburn-fg :background ,zzenburn-bg))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,zzenburn-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,zzenburn-bg-05)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,zzenburn-bg+1))
                   (t :weight bold)))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,zzenburn-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,zzenburn-yellow))))
   `(ido-indicator ((t (:foreground ,zzenburn-yellow :background ,zzenburn-red-4))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,zzenburn-bg+2 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,zzenburn-orange))))
   `(js2-error ((t (:foreground ,zzenburn-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,zzenburn-green-1))))
   `(js2-jsdoc-type ((t (:foreground ,zzenburn-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,zzenburn-green+3))))
   `(js2-function-param ((t (:foreground, zzenburn-green+3))))
   `(js2-external-variable ((t (:foreground ,zzenburn-orange))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,zzenburn-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,zzenburn-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,zzenburn-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,zzenburn-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,zzenburn-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,zzenburn-red+1))))
   `(jabber-activity-face((t (:foreground ,zzenburn-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,zzenburn-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,zzenburn-red-1 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,zzenburn-fg :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,zzenburn-bg+1))))
   `(ledger-font-pending-face ((t (:foreground ,zzenburn-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,zzenburn-fg))))
   `(ledger-font-posting-account-face ((t (:foreground ,zzenburn-blue-1))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,zzenburn-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,zzenburn-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,zzenburn-orange))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,zzenburn-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,zzenburn-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,zzenburn-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,zzenburn-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,zzenburn-red-1 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,zzenburn-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,zzenburn-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,zzenburn-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,zzenburn-green+2 :background ,zzenburn-bg))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,zzenburn-green+2 :background ,zzenburn-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,zzenburn-red+1 :background ,zzenburn-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,zzenburn-blue+1 :background ,zzenburn-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,zzenburn-magenta :background ,zzenburn-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,zzenburn-yellow :background ,zzenburn-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
   `(magit-section-title ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(magit-branch ((t (:foreground ,zzenburn-orange :weight bold))))
   `(magit-item-highlight ((t (:background ,zzenburn-bg+1 :bold nil))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,zzenburn-fg))))
   `(egg-help-header-1 ((t (:foreground ,zzenburn-yellow))))
   `(egg-help-header-2 ((t (:foreground ,zzenburn-green+3))))
   `(egg-branch ((t (:foreground ,zzenburn-yellow))))
   `(egg-branch-mono ((t (:foreground ,zzenburn-yellow))))
   `(egg-term ((t (:foreground ,zzenburn-yellow))))
   `(egg-diff-add ((t (:foreground ,zzenburn-green+4))))
   `(egg-diff-del ((t (:foreground ,zzenburn-red+1))))
   `(egg-diff-file-header ((t (:foreground ,zzenburn-yellow-2))))
   `(egg-section-title ((t (:foreground ,zzenburn-yellow))))
   `(egg-stash-mono ((t (:foreground ,zzenburn-green+4))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,zzenburn-green+1))))
   `(message-header-other ((t (:foreground ,zzenburn-green))))
   `(message-header-to ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(message-header-from ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,zzenburn-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,zzenburn-green))))
   `(message-mml ((t (:foreground ,zzenburn-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,zzenburn-orange))))
   `(mew-face-header-from ((t (:foreground ,zzenburn-yellow))))
   `(mew-face-header-date ((t (:foreground ,zzenburn-green))))
   `(mew-face-header-to ((t (:foreground ,zzenburn-red))))
   `(mew-face-header-key ((t (:foreground ,zzenburn-green))))
   `(mew-face-header-private ((t (:foreground ,zzenburn-green))))
   `(mew-face-header-important ((t (:foreground ,zzenburn-blue))))
   `(mew-face-header-marginal ((t (:foreground ,zzenburn-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,zzenburn-red))))
   `(mew-face-header-xmew ((t (:foreground ,zzenburn-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,zzenburn-red))))
   `(mew-face-body-url ((t (:foreground ,zzenburn-orange))))
   `(mew-face-body-comment ((t (:foreground ,zzenburn-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,zzenburn-green))))
   `(mew-face-body-cite2 ((t (:foreground ,zzenburn-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,zzenburn-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,zzenburn-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,zzenburn-red))))
   `(mew-face-mark-review ((t (:foreground ,zzenburn-blue))))
   `(mew-face-mark-escape ((t (:foreground ,zzenburn-green))))
   `(mew-face-mark-delete ((t (:foreground ,zzenburn-red))))
   `(mew-face-mark-unlink ((t (:foreground ,zzenburn-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,zzenburn-green))))
   `(mew-face-mark-unread ((t (:foreground ,zzenburn-red-2))))
   `(mew-face-eof-message ((t (:foreground ,zzenburn-green))))
   `(mew-face-eof-part ((t (:foreground ,zzenburn-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,zzenburn-cyan :background ,zzenburn-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,zzenburn-bg :background ,zzenburn-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,zzenburn-bg :background ,zzenburn-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,zzenburn-blue))))
   `(mingus-pausing-face ((t (:foreground ,zzenburn-magenta))))
   `(mingus-playing-face ((t (:foreground ,zzenburn-cyan))))
   `(mingus-playlist-face ((t (:foreground ,zzenburn-cyan ))))
   `(mingus-song-file-face ((t (:foreground ,zzenburn-yellow))))
   `(mingus-stopped-face ((t (:foreground ,zzenburn-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,zzenburn-yellow))))
   `(nav-face-button-num ((t (:foreground ,zzenburn-cyan))))
   `(nav-face-dir ((t (:foreground ,zzenburn-green))))
   `(nav-face-hdir ((t (:foreground ,zzenburn-red))))
   `(nav-face-file ((t (:foreground ,zzenburn-fg))))
   `(nav-face-hfile ((t (:foreground ,zzenburn-red-4))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,zzenburn-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,zzenburn-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,zzenburn-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,zzenburn-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,zzenburn-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,zzenburn-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,zzenburn-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,zzenburn-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,zzenburn-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,zzenburn-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,zzenburn-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,zzenburn-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,zzenburn-bg+1))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,zzenburn-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,zzenburn-fg :weight bold))))
   `(org-checkbox ((t (:background ,zzenburn-bg+2 :foreground ,zzenburn-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,zzenburn-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,zzenburn-red-1))))
   `(org-done ((t (:bold t :weight bold :foreground ,zzenburn-green+3))))
   `(org-formula ((t (:foreground ,zzenburn-yellow-2))))
   `(org-headline-done ((t (:foreground ,zzenburn-green+3))))
   `(org-hide ((t (:foreground ,zzenburn-bg-1))))
   `(org-level-1 ((t (:foreground ,zzenburn-orange))))
   `(org-level-2 ((t (:foreground ,zzenburn-green+4))))
   `(org-level-3 ((t (:foreground ,zzenburn-blue-1))))
   `(org-level-4 ((t (:foreground ,zzenburn-yellow-2))))
   `(org-level-5 ((t (:foreground ,zzenburn-cyan))))
   `(org-level-6 ((t (:foreground ,zzenburn-green+2))))
   `(org-level-7 ((t (:foreground ,zzenburn-red-4))))
   `(org-level-8 ((t (:foreground ,zzenburn-blue-4))))
   `(org-link ((t (:foreground ,zzenburn-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,zzenburn-green+4))))
   `(org-scheduled-previously ((t (:foreground ,zzenburn-red))))
   `(org-scheduled-today ((t (:foreground ,zzenburn-blue+1))))
   `(org-sexp-date ((t (:foreground ,zzenburn-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,zzenburn-green+2))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,zzenburn-orange))))
   `(org-todo ((t (:bold t :foreground ,zzenburn-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,zzenburn-red :weight bold :underline nil))))
   `(org-column ((t (:background ,zzenburn-bg-1))))
   `(org-column-title ((t (:background ,zzenburn-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,zzenburn-fg :background ,zzenburn-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,zzenburn-bg :background ,zzenburn-red-1))))
   `(org-ellipsis ((t (:foreground ,zzenburn-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,zzenburn-cyan :underline t))))
;;;;; outline
   `(outline-1 ((t (:foreground ,zzenburn-orange))))
   `(outline-2 ((t (:foreground ,zzenburn-green+4))))
   `(outline-3 ((t (:foreground ,zzenburn-blue-1))))
   `(outline-4 ((t (:foreground ,zzenburn-yellow-2))))
   `(outline-5 ((t (:foreground ,zzenburn-cyan))))
   `(outline-6 ((t (:foreground ,zzenburn-green+2))))
   `(outline-7 ((t (:foreground ,zzenburn-red-4))))
   `(outline-8 ((t (:foreground ,zzenburn-blue-4))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,zzenburn-yellow-2 :inherit mode-line))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,zzenburn-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,zzenburn-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,zzenburn-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,zzenburn-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,zzenburn-fg :background ,zzenburn-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,zzenburn-bg :background ,zzenburn-orange))))
   `(proof-error-face ((t (:foreground ,zzenburn-fg :background ,zzenburn-red-4))))
   `(proof-highlight-dependency-face ((t (:foreground ,zzenburn-bg :background ,zzenburn-yellow-1))))
   `(proof-highlight-dependent-face ((t (:foreground ,zzenburn-bg :background ,zzenburn-orange))))
   `(proof-locked-face ((t (:background ,zzenburn-blue-5))))
   `(proof-mouse-highlight-face ((t (:foreground ,zzenburn-bg :background ,zzenburn-orange))))
   `(proof-queue-face ((t (:background ,zzenburn-red-4))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,zzenburn-red-2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,zzenburn-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,zzenburn-bg))))
   `(proof-warning-face ((t (:foreground ,zzenburn-bg :background ,zzenburn-yellow-1))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,zzenburn-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,zzenburn-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,zzenburn-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,zzenburn-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,zzenburn-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,zzenburn-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,zzenburn-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,zzenburn-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,zzenburn-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,zzenburn-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,zzenburn-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,zzenburn-blue-5))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,zzenburn-blue))))
   `(rcirc-other-nick ((t (:foreground ,zzenburn-orange))))
   `(rcirc-bright-nick ((t (:foreground ,zzenburn-blue+1))))
   `(rcirc-dim-nick ((t (:foreground ,zzenburn-blue-2))))
   `(rcirc-server ((t (:foreground ,zzenburn-green))))
   `(rcirc-server-prefix ((t (:foreground ,zzenburn-green+1))))
   `(rcirc-timestamp ((t (:foreground ,zzenburn-green+2))))
   `(rcirc-nick-in-message ((t (:foreground ,zzenburn-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:bold t))))
   `(rcirc-prompt ((t (:foreground ,zzenburn-yellow :bold t))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:bold t))))
   `(rcirc-url ((t (:bold t))))
   `(rcirc-keyword ((t (:foreground ,zzenburn-yellow :bold t))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,zzenburn-green))))
   `(rpm-spec-doc-face ((t (:foreground ,zzenburn-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,zzenburn-red))))
   `(rpm-spec-macro-face ((t (:foreground ,zzenburn-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,zzenburn-red))))
   `(rpm-spec-package-face ((t (:foreground ,zzenburn-red))))
   `(rpm-spec-section-face ((t (:foreground ,zzenburn-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,zzenburn-blue))))
   `(rpm-spec-var-face ((t (:foreground ,zzenburn-red))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,zzenburn-orange))))
   `(rst-level-2-face ((t (:foreground ,zzenburn-green+1))))
   `(rst-level-3-face ((t (:foreground ,zzenburn-blue-1))))
   `(rst-level-4-face ((t (:foreground ,zzenburn-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,zzenburn-cyan))))
   `(rst-level-6-face ((t (:foreground ,zzenburn-green-1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,zzenburn-yellow :bold t))))
   `(sh-quoted-exec ((t (:foreground ,zzenburn-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,zzenburn-red+1 :background ,zzenburn-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,zzenburn-bg+3 :weight bold))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,zzenburn-red+1 :background ,zzenburn-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,zzenburn-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,zzenburn-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,zzenburn-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-red)))
      (t
       (:underline ,zzenburn-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-orange)))
      (t
       (:underline ,zzenburn-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-yellow)))
      (t
       (:underline ,zzenburn-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,zzenburn-green)))
      (t
       (:underline ,zzenburn-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,zzenburn-green+2))))
   `(speedbar-directory-face ((t (:foreground ,zzenburn-cyan))))
   `(speedbar-file-face ((t (:foreground ,zzenburn-fg))))
   `(speedbar-highlight-face ((t (:foreground ,zzenburn-bg :background ,zzenburn-green+2))))
   `(speedbar-selected-face ((t (:foreground ,zzenburn-red))))
   `(speedbar-separator-face ((t (:foreground ,zzenburn-bg :background ,zzenburn-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,zzenburn-yellow))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,zzenburn-fg
                                    :background ,zzenburn-bg))))
   `(tabbar-selected ((t (:foreground ,zzenburn-fg
                                      :background ,zzenburn-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,zzenburn-fg
                                        :background ,zzenburn-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,zzenburn-bg
                                       :background ,zzenburn-bg-1))))
   `(term-color-red ((t (:foreground ,zzenburn-red-2
                                       :background ,zzenburn-red-4))))
   `(term-color-green ((t (:foreground ,zzenburn-green
                                       :background ,zzenburn-green+2))))
   `(term-color-yellow ((t (:foreground ,zzenburn-orange
                                       :background ,zzenburn-yellow))))
   `(term-color-blue ((t (:foreground ,zzenburn-blue-1
                                      :background ,zzenburn-blue-4))))
   `(term-color-magenta ((t (:foreground ,zzenburn-magenta
                                         :background ,zzenburn-red))))
   `(term-color-cyan ((t (:foreground ,zzenburn-cyan
                                       :background ,zzenburn-blue))))
   `(term-color-white ((t (:foreground ,zzenburn-fg
                                       :background ,zzenburn-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,zzenburn-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,zzenburn-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,zzenburn-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,zzenburn-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,zzenburn-cyan))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,zzenburn-bg-05))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,zzenburn-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,zzenburn-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,zzenburn-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,zzenburn-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,zzenburn-green+2 :background ,zzenburn-bg))))
   `(w3m-lnum-match ((t (:background ,zzenburn-bg-1
                                     :foreground ,zzenburn-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,zzenburn-yellow))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,zzenburn-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,zzenburn-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,zzenburn-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,zzenburn-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,zzenburn-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,zzenburn-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,zzenburn-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,zzenburn-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,zzenburn-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,zzenburn-bg+1 :foreground ,zzenburn-bg+1))))
   `(whitespace-hspace ((t (:background ,zzenburn-bg+1 :foreground ,zzenburn-bg+1))))
   `(whitespace-tab ((t (:background ,zzenburn-red-1))))
   `(whitespace-newline ((t (:foreground ,zzenburn-bg+1))))
   `(whitespace-trailing ((t (:background ,zzenburn-red))))
   `(whitespace-line ((t (:background ,zzenburn-bg :foreground ,zzenburn-magenta))))
   `(whitespace-space-before-tab ((t (:background ,zzenburn-orange :foreground ,zzenburn-orange))))
   `(whitespace-indentation ((t (:background ,zzenburn-yellow :foreground ,zzenburn-red))))
   `(whitespace-empty ((t (:background ,zzenburn-yellow))))
   `(whitespace-space-after-tab ((t (:background ,zzenburn-yellow :foreground ,zzenburn-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,zzenburn-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,zzenburn-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,zzenburn-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,zzenburn-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,zzenburn-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,zzenburn-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,zzenburn-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,zzenburn-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,zzenburn-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,zzenburn-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,zzenburn-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,zzenburn-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,zzenburn-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,zzenburn-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,zzenburn-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,zzenburn-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,zzenburn-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,zzenburn-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,zzenburn-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,zzenburn-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,zzenburn-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,zzenburn-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,zzenburn-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,zzenburn-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,zzenburn-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,zzenburn-green+4))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,zzenburn-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,zzenburn-bg-1 :foreground ,zzenburn-bg-1))))
   ))

;;; Theme Variables
(zzenburn-with-color-variables
  (custom-theme-set-variables
   'zzenburn
;;;;; ansi-color
   `(ansi-color-names-vector [,zzenburn-bg ,zzenburn-red ,zzenburn-green ,zzenburn-yellow
                                          ,zzenburn-blue ,zzenburn-magenta ,zzenburn-cyan ,zzenburn-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,zzenburn-bg-05)
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,zzenburn-red-1)
       ( 40. . ,zzenburn-red)
       ( 60. . ,zzenburn-orange)
       ( 80. . ,zzenburn-yellow-2)
       (100. . ,zzenburn-yellow-1)
       (120. . ,zzenburn-yellow)
       (140. . ,zzenburn-green-1)
       (160. . ,zzenburn-green)
       (180. . ,zzenburn-green+1)
       (200. . ,zzenburn-green+2)
       (220. . ,zzenburn-green+3)
       (240. . ,zzenburn-green+4)
       (260. . ,zzenburn-cyan)
       (280. . ,zzenburn-blue-2)
       (300. . ,zzenburn-blue-1)
       (320. . ,zzenburn-blue)
       (340. . ,zzenburn-blue+1)
       (360. . ,zzenburn-magenta)))
   `(vc-annotate-very-old-color ,zzenburn-magenta)
   `(vc-annotate-background ,zzenburn-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar zzenburn-add-font-lock-keywords nil
  "Whether to add font-lock keywords for zzenburn color names.
In buffers visiting library `zzenburn-theme.el' the zzenburn
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar zzenburn-colors-font-lock-keywords nil)

;; (defadvice rainbow-turn-on (after zzenburn activate)
;;   "Maybe also add font-lock keywords for zzenburn colors."
;;   (when (and (derived-mode-p 'emacs-lisp-mode)
;;              (or zzenburn-add-font-lock-keywords
;;                  (equal (file-name-nondirectory (buffer-file-name))
;;                         "zzenburn-theme.el")))
;;     (unless zzenburn-colors-font-lock-keywords
;;       (setq zzenburn-colors-font-lock-keywords
;;             `((,(regexp-opt (mapcar 'car zzenburn-colors-alist) 'words)
;;                (0 (rainbow-colorize-by-assoc zzenburn-colors-alist))))))
;;     (font-lock-add-keywords nil zzenburn-colors-font-lock-keywords)))

;; (defadvice rainbow-turn-off (after zzenburn activate)
;;   "Also remove font-lock keywords for zzenburn colors."
;;   (font-lock-remove-keywords nil zzenburn-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'zzenburn)

;;;###autoload
(add-to-list 'safe-local-eval-forms
             '(when (require 'rainbow-mode nil t) (rainbow-mode 1)))

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; zzenburn-theme.el ends here
