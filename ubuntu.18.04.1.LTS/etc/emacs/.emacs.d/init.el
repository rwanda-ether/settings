;; Time-stamp: <2018-10-23 12:23:29 hamada>

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

;; --- scroll-step --- 
(setq scroll-step 1)

;; --- save place ---
(require 'saveplace)
(setq-default save-place t)

;; --- disable the startup message ---
(setq inhibit-startup-message t)

;; --- for CUDA ---
(setq auto-mode-alist
      (cons (cons "\\.cu$" 'c++-mode) auto-mode-alist))

;; --- tab width ---
(setq-default tab-width 4)

