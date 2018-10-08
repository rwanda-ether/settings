;;; Dot.emacs.default -- Coloring mule/emacs to more easier and more fun. -*-emacs-lisp-*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Color-Mate  Ver.10.1
;;         by ���� ͵�� (yokota@netlab.is.tsukuba.ac.jp)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   Coloring mule/emacs to more easier and more fun.
;;   mule / emacs �ǡ�������Ѥ��Ƹ��䤹�����̤ˤ��ޤ�
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Author: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Maintainer: YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>
;; Version: 10.1
;; Keywords: color hilit19 font-lock color-mate
;; Content-Type: text/plain; charset=x-euc-jp

;$Id: .emacs-color.el,v 1.5 2004/04/03 17:44:18 daisuke Exp $

;----------------------------------;
; ����ե�������ɤ߹��ߥѥ�������
;----------------------------------;
; Add "~/elisp/color-mate" to your load path.
;
; Color-Mate �Υե����뤬 ~/elisp/color-mate �ʳ��ξ���ͭ����Ϥ�����
; �ѹ����Ʋ�������
;(setq load-path
;      (cons
;       (expand-file-name
;	"~/elisp/color-mate") load-path))


;(if (string-match "XEmacs" emacs-version)
;  (setq color-mate:base-path "/usr/lib/xemacs/site-packages/lisp/color-mate")
;  (setq color-mate:base-path "/usr/share/emacs/site-lisp/color-mate")
;)
;(setq load-path
;      (append
;       (list color-mate:base-path
;	     (concat color-mate:base-path "/theme")
;	     (concat color-mate:base-path "/contrib")
;	     (concat color-mate:base-path "/kanakan-cursor"))
;       load-path))

;-------------------------------------------------------;
; �ե���Ȥ��礭�������� 10,12,14,16,18,20,24 �������٤ޤ�
;-------------------------------------------------------;
;(setq default-fontset "fontset-12")

;-------------------------------------------------------;
; �ơ������� ����������Υơ��ޥե����������Ǥ�������
;-------------------------------------------------------;
;; theme file name (default "SunnyDay")

;(setq color-mate:theme-file "SunnyDay")
;(setq color-mate:theme-file "SunnyDay-LCD")
;(setq color-mate:theme-file "GreenTea")
;(setq color-mate:theme-file "Maron")
;(setq color-mate:theme-file "MidNight")
;(setq color-mate:theme-file "Null")
;(setq color-mate:theme-file "Stone")
;(setq color-mate:theme-file "WaterWorld")
;(setq color-mate:theme-file "Wine")

; cm_select �ǥơ������򤷤�emacs/xemacs ��ư������Ϥ�����
; emacs-color (or xemacs-color) [�ơ���̾]  �ǵ�ư�Ǥ��ޤ�
(load "cm_select")

;-------------------------------------------------------;
; ����¾������ �ܤ����ϳ���el�Υإå��������򸫤Ƥ�������
;-------------------------------------------------------;
;;; summary-color ������
;
;(setq summary-color-mailer 'mew)
;(setq summary-color-list 
;                   '(("Charley"  "Yellow" "black") ; ʸ��:����,  �ط�: ��
;                     ("Bob" "Red")             ; ʸ��:��,  �ط�: �Ѥ��ʤ�.
;                     ("Taro" "Gray")))         ; ʸ��:����,  �ط�: �Ѥ��ʤ�.
;; (require 'summary-color)

;;; vregister ������
;
;(load "vregister.el")

;------------------------------------------;
; Drag & Drop Support for "Mule for Win32"
;------------------------------------------;
(if (and (boundp 'MULE)
	 (eq window-system 'win32))
    (load "win32dropfiles"))

;-----------------;
; Color-Mate ��ư
;-----------------;
; start Color-Mate
(if (and (>= (string-to-int emacs-version) 19)
	 window-system )
    (progn
      (require 'color-mate)
      (color-mate)
      (require 'color-mate-face)
      (color-mate:face)
      ))

;----------------------;
; kanakan-cursor �λ���
;----------------------;
;; cursor color with Input Method. (for mule/emacs20/xemacs20)
;
(if (and (>= (string-to-int emacs-version) 19)
	 window-system )
    (progn

      ;; color-mate:theme ���饫�����뿧�������ȴ�������褦�ˤ��롣
      (require 'assoc)
      (require 'color-mate-util)

      ;; skk (mule/xemacs)
      ;; skk version 9.6 �Υ��������忧��ǽ����Ѥ��롣
      ;; ������ skk ������򤷤Ƥ�������
      ;; skk-cursor2 �Ͽ��κ�����򤷤Ƥ�������ʤΤ� skk ����Ѥ��Ƥ��ʤ��Ƥ�
      ;; ¾�˰��ƶ���Ϳ������Ϥʤ���
      (if (and (fboundp 'skk-mode)
	      (not (featurep 'xemacs)))
	  (require 'skk-cursor2))

      ;; ����� skk version 8 ��
;      (if (fboundp 'skk-mode)
;	  (progn
;	    ;; ���� Color-Mate ������ȹ�碌��
;	    (setq skk-cursor-color-for-default     color-mate-cursor-color)
;	    (global-unset-key "\C-x\C-j")
;	    (global-unset-key "\C-xj")
;	    (global-set-key   "\C-x\C-j" 'skk-mode-with-color-cursor)
;	    (global-set-key   "\C-xj" 'skk-auto-fill-mode-with-color-cursor)
;	    (autoload 'skk-mode-with-color-cursor "skk-cursor" nil t)
;	    (autoload 'skk-auto-fill-mode-with-color-cursor "skk-cursor" nil t)
;	    ))

      ;; leim
      ;; leim �Ȥ� Emacs/XEmacs20 �Ѥ�¿�������ϥ饤�֥��Ǥ���
      ;; leim-cursor �����ܸ�����Ǥʤ���¾�θ�������ϻ��ˤ�ͭ���Ȥʤ�ޤ���
      ;; �������� leim �� Emacs19 �� skk �ȵ�ǽ�����ͤ��뤿�ᡢ Emacs20 ��
      ;; ������ leim �� skk ��Ʊ�����Ѥ�����ޤ���
      (if (>= (string-to-int emacs-version) 20)
	  (progn
	    (setq leim-mode-off-cursor-color
		  (aget color-mate:theme 'cursor-background-color))
	    (require 'leim-cursor)))

      ;; Wnn
      (if (and (boundp 'WNN)
	       (not (featurep 'xemacs)))
	  (progn
	    ;; ���� Color-Mate ������ȹ�碌��
	    (setq egg-mode-off-cursor-color
		  (aget color-mate:theme 'cursor-background-color))
	    (require 'egg-cursor)))

      ;; canna
      ;; Canna �� mule �Ǥ� canna.el �����ˤ˥��ɤ���Ƥ���Τ�
      ;; (featurep 'canna) �Ǥ� (canna) ��¹Ԥ�����ʬ����ʤ���
      ;; �����Ǥ�������������ɤ�����ʬ����ʤ����� canna-empty-info
      ;; �Ȥ����ѿ������� Canna ��ư����� t �ˤʤ�������Ѥ���
      ;; �桼������ Canna ��ȤäƤ��뤫(���˵�ư���Ƥ��뤫)��Ƚ�ꤹ�롣
      ;;
      (if (and (boundp 'CANNA) canna-empty-info
	       (not (featurep 'xemacs)))
	  (progn
	    ;; ���� Color-Mate ������ȹ�碌��
	    (setq canna-mode-off-cursor-color
		  (aget color-mate:theme 'cursor-background-color))
	    (require 'canna-cursor)))

      ;; SJ3
      (if (and (boundp 'SJ3)
	       (not (featurep 'xemacs)))
	  (progn
	    ;; ���� Color-Mate ������ȹ�碌��
	    (setq sj3-mode-off-cursor-color
		  (aget color-mate:theme 'cursor-background-color))
	    (require 'sj3-cursor)))

      ;; Windows IME (Mule for Windows)
      (if (and (boundp 'MULE)
	       (eq window-system 'win32))
          (progn
            (setq win32-ime-mode-off-cursor-color
                  (aget color-mate:theme 'cursor-background-color))
            (require 'win32-cursor)))
      ))

;;; Dot.emacs.default ends here
