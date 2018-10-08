;;; �ǥե���ȤΥե���ȥ��åȤʤ�
;;; Time-stamp: "2006-01-09 11:19:25 hamada"

(if (or (and window-system (>= emacs-major-version 19))
	(>= emacs-major-version 21))
    (progn

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; �ե����/������ɥ�������������

      (if window-system
	  (progn
	    (load "~/.emacs-fontset.el")
	    (setq default-frame-alist
		  (append
		   '((font . "fontset-14") ;; �ǥե���ȥե���ȥ��å�
		     ;(width . 80) (height . 40) ;; ������ɥ�������
		     )
		   default-frame-alist))))

      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; font-lock-mode
      ;; ����Ĥ���
      (global-font-lock-mode t)
      ;; font-lock�Ǥ�������٥�
      (setq font-lock-maximum-decoration t) 
      (setq fast-lock nil)
      (setq lazy-lock nil)
      (setq jit-lock t)

      (setq hilit-background-mode 'dark)

;;      ;; hilit19 ���ɤ߹���
;;      (require 'hilit19)
      


      )
)
