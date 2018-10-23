;; Time-stamp: <2018-10-23 12:06:40 hamada>

(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)

;; --- Time-stamp ---
(if (not (memq 'time-stamp write-file-hooks))
    (setq write-file-hooks
          (cons 'time-stamp write-file-hooks)))

;; --- display time ---
(display-time)
