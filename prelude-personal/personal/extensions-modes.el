;;; Associate files and extensions with modes
;;; and hooks to some modes

(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rdoc$" . text-mode) auto-mode-alist))

;;; Hook fic-mode to some modes
(add-hook 'coffee-mode-hook 'turn-on-fic-mode)
(add-hook 'javascript-mode-hook 'turn-on-fic-mode)
(add-hook 'js-mode-hook 'turn-on-fic-mode)
(add-hook 'ruby-mode-hook 'turn-on-fic-mode)
(add-hook 'css-mode-hook 'turn-on-fic-mode)
(add-hook 'html-mode-hook 'turn-on-fic-mode)
(add-hook 'scss-mode-hook 'turn-on-fic-mode)
(add-hook 'less-mode-hook 'turn-on-fic-mode)
(add-hook 'el-mode-hook 'turn-on-fic-mode)
(add-hook 'jade-mode-hook 'turn-on-fic-mode)
(font-lock-fontify-buffer)
