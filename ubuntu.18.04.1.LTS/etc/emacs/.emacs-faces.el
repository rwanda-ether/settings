;;; デフォルトのフォントセットなど
;;; Time-stamp: "2006-01-09 11:19:25 hamada"

(if (or (and window-system (>= emacs-major-version 19))
	(>= emacs-major-version 21))
    (progn

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; フォント/ウィンドウサイズの設定

      (if window-system
	  (progn
	    (load "~/.emacs-fontset.el")
	    (setq default-frame-alist
		  (append
		   '((font . "fontset-14") ;; デフォルトフォントセット
		     ;(width . 80) (height . 40) ;; ウィンドウサイズ
		     )
		   default-frame-alist))))

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; font-lock-mode
      ;; 色をつける
      (global-font-lock-mode t)
      ;; font-lockでの装飾レベル
      (setq font-lock-maximum-decoration t) 
      (setq fast-lock nil)
      (setq lazy-lock nil)
      (setq jit-lock t)

      (setq hilit-background-mode 'dark)

;;      ;; hilit19 の読み込み
;;      (require 'hilit19)
      


      )
)
