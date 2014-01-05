(require 'flymake)

; Flymake for Ruby
; Code from http://www.emacswiki.org/emacs/FlymakeRuby
; Added the -w flag for warnings

;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
          (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" "-w" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '(".+\\.rake$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()

;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
(if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
    (flymake-mode))))

; From: http://stackoverflow.com/questions/8746671#comments-8746930
; Not really needed if flymake-cursor is used
(defun flymake-show-error ()
  (interactive)
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))
