;; All keys defined in a minor mode so they can be easily turned on/off
;; From: http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs#answer-683575
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-c C-i") 'indent-region)
(define-key my-keys-minor-mode-map (kbd "C-c C-l") 'goto-line)
(define-key my-keys-minor-mode-map (kbd "C-c C-s") 'isearch-forward-regexp)
(define-key my-keys-minor-mode-map (kbd "C-c C-r") 'isearch-backward-regexp)
(define-key my-keys-minor-mode-map (kbd "C-c M-r") 'replace-string)

;; Redefine C-<left> and C-<right> to be the same as M-<left> and M-<right>
;; They are set differently by paredit: http://emacswiki.org/emacs/ParEdit
;; They are set differently by smartparens
(define-key my-keys-minor-mode-map (kbd "C-<left>") 'backward-word)
(define-key my-keys-minor-mode-map (kbd "C-<right>") 'forward-word)

;; Rspec
(define-key my-keys-minor-mode-map (kbd "C-c M-f") 'rspec-verify)         ; entire file
(define-key my-keys-minor-mode-map (kbd "C-c M-s") 'rspec-verify-single)  ; current spec
(define-key my-keys-minor-mode-map (kbd "C-c M-a") 'rspec-verify-all)     ; everything
(define-key my-keys-minor-mode-map (kbd "C-c M-t") 'rspec-toggle-spec-and-target)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)
(my-keys-minor-mode 1)

;;; multiple-cursors
;; (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; (global-set-key (kbd "C-c C-n") 'mc/mark-next-like-this)
;; (global-set-key (kbd "C-c C-p") 'mc/mark-previous-like-this)
;; (global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this-dwin)
