;; Add themes/ to the path, prelude doesn't do it automatically anymore.
;; See https://github.com/bbatsov/prelude/issues/438
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Zenburn is loaded by default by Prelude.
;; We use a slightly modified Zenburn:
(load-theme 'zzenburn t)


;; The block below was used in the past to customize Zenburn. Works, but makes it
;; less refined than the default theme (a few elements will have weird colors).

;; ;; Customize zenburn a bit
;; (defun setup-my-colors ()
;;   ;; Customize zenburn
;;   (let ((class '((class color) (min-colors 89)))
;;         (zenburn-fg "#dcdccc")
;;         (zenburn-bg-1 "#101010")
;;         (zenburn-bg-05 "#161616")
;;         (zenburn-bg "#1b1b1b")
;;         (zenburn-bg+05 "#232323")
;;         (zenburn-bg+1 "#3f3f3f")
;;         (zenburn-error "#800080")
;;         (zenburn-yellow "#d4ef59")
;;         (zenburn-red "#CC9393")
;;         (zenburn-red-3 "#9C6363")
;;         (zenburn-green-1 "#5F7F5F")
;;         (zenburn-blue-3 "#366060")
;;         )
;;     (custom-theme-set-faces
;;      'zenburn
;;      `(default ((,class (:background ,zenburn-bg))))
;;      `(highlight ((,class (:background ,zenburn-bg-05))))
;;      `(mode-line-inactive ((,class (:background ,zenburn-bg-05))))
;;      `(whitespace-space ((,class (:background ,zenburn-bg :foreground ,zenburn-bg+05)))) ; normal spaces
;;      `(whitespace-hspace ((,class (:background ,zenburn-bg :foreground ,zenburn-bg+05))))
;;      `(whitespace-tab ((,class (:background ,zenburn-bg :foreground ,zenburn-bg+05)))) ; normal tabs
;;      `(whitespace-newline ((,class (:foreground ,zenburn-bg+05))))
;;      `(whitespace-trailing ((,class (:background ,zenburn-error))))
;;      `(whitespace-line ((,class (:background ,zenburn-bg :foreground ,zenburn-yellow)))) ; long lines
;;      `(region ((,class (:background ,zenburn-bg-1))))
;;      )
;;     )
;;   )
;; ;; because of smart-mode-line I can't set the colors for mode-line properly in the block
;; ;; above with the other colors, so have to set it here (and only the background seems to work)
;; (set-face-background 'mode-line-inactive "#1b1b1b")
;; (set-face-background 'mode-line "#050505")
;; ;; trigger the setup in after-init-hook, needed because of smart-mode-line
;; (if after-init-time (sml/setup)
;;   (add-hook 'after-init-hook 'setup-my-colors))
