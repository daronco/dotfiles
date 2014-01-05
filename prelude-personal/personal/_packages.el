; Copied from prelude-packages.el
; Installs my personal packages

(defvar personal-packages
  '(flymake-ruby flymake-cursor flymake-css flymake-sass
    flymake-haml flymake-coffee flymake-python-pyflakes
    jade-mode xclip rspec-mode multiple-cursors smart-mode-line
    less-css-mode)
  "A list of packages to ensure are installed at launch.")

(defun personal-packages-installed-p ()
  (loop for p in personal-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun personal-install-packages ()
  (unless (personal-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Emacs prelude-personal is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dolist (p personal-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(personal-install-packages)

(require 'rspec-mode)
