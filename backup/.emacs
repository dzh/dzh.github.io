(setq user-full-name    "dzh")
(setq user-mail-address "archer.dzh@gmail.com")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(default-input-method "chinese-py")
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(fringe-mode 0 nil (fringe))
 '(menu-bar-mode nil)
 '(scala-mode-indent:step 4)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-width-console 29)
 '(sr-speedbar-width-x 29)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil))
;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
;'(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant oblique :weight normal :height 100 :width normal :foundry "unknown" :family "TlwgMono"))))
;'(ecb-default-highlight-face ((((class color) (background dark)) (:background "darkblue")))))

(put 'dired-find-alternate-file 'disabled nil)

;;设置默认工作目录
(setq default-directory "/home/dzh/lx/")
(setq visible-bell t);关闭出错时的提示声
(setq frame-title-format "%n%F/%b");在窗口的标题栏上显示文件名称
(setq default-major-mode 'text-mode);一打开就起用 text 模式。
(global-font-lock-mode t);语法高亮
(auto-image-file-mode t);打开图片显示功能
(fset 'yes-or-no-p 'y-or-n-p);
(show-paren-mode t);显示括号匹配
(column-number-mode t);显示列号
(display-time-mode 1);显示时间，格式如下
(setq display-time-24hr-format t);
(setq display-time-day-and-date t);
(setq inhibit-startup-message t);
(mouse-avoidance-mode 'animate);光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。很好玩阿，这个功能
(setq mouse-yank-at-point t);支持中键粘贴
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴
(setq default-fill-column 1000);默认显示 80列就换行
(setq frame-title-format;设置标题栏显示文件的完整路径名
'("%S" (buffer-file-name "%f"
(dired-directory dired-directory "%b"))))
;; 语法加亮
(global-font-lock-mode t)
;(require 'hl-line)
;(global-hl-line-mode t)
;; 高亮显示选择区域
(setq transient-mark-mode t)
;; 不产生备份文件
(setq make-backup-files nil)
(setq-default make-backup-files nil) 
;; 取消自动保存
;(auto-save-mode 0)

;解决emacs shell 乱码
;(setq ansi-color-for-comint-mode t)
;(customize-group 'ansi-colors)
;(kill-this-buffer);关闭customize窗口

(require 'linum)
(setq linum-format "%2d")

;对所有文件生效
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))



; 编程相关的===========================
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4);设置Tab宽度为4
;(setq indent-line-function 'insert-tab)
;(setq tab-width 4 indent-tabs-mode nil);设置Tab换为4个空格,不用Tab进行排版
;(customize-variable (quote tab-stop-list))
;(custom-set-variables '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))
;键绑定初始化==========================
;; 导入重做
;(require 'redo)
;; tabbar
;(require 'tabbar)
;(tabbar-mode t)
;;设置键绑定==========================(不知道有什么用)
(global-set-key [C-up] 'tabbar-backward-group)
(global-set-key [C-down] 'tabbar-forward-group)
(global-set-key [C-left] 'tabbar-backward)
(global-set-key [C-right] 'tabbar-forward)
; 自定义键绑定==========================
(global-set-key [f6] 'dired-jump);文件管理器
(global-set-key [f10] 'menu-bar-mode);打开/关闭菜单
(global-set-key (kbd "C-v") 'yank);粘贴
(global-set-key (kbd "C-z") 'undo);撤消
(global-set-key (kbd "C-y") 'redo);重做
(global-set-key (kbd "C-s") 'save-buffer);保存
(global-set-key (kbd "C-a") 'mark-whole-buffer);全选
(global-set-key (kbd "C-f") 'isearch-forward);向下查找
(global-set-key [delete] 'delete-char);delete 删除一个字符

;;;;小知识：由于配置文件越来越大，你的*.el配置文件最好都编译为*.elc文件，这样在启动emacs速度会有很大的提升
;(defun autocompile nil
;"compile itself if ~/.emacs"
;(interactive)
;(if (string= (buffer-file-name) (concat default-directory ".emacs"))
;(byte-compile-file (buffer-file-name))))
;(add-hook 'after-save-hook 'autocompile)

;;;删除一行
(defun zl-delete-line nil
"delete the whole line"
(interactive)
(beginning-of-line);光标移动到行首
(push-mark);做个标记
(beginning-of-line 2);移动到下一行行首
(kill-region (point) (mark)));光标和标记之间的删掉
(global-set-key (kbd "C-d") 'zl-delete-line);删除一行

;;新建一行，不管光标在哪
(defun zl-newline nil
"open new line belowe current line"
(interactive)
(end-of-line)
(newline))
(global-set-key [S-return] 'zl-newline);绑定Shift-回车

(global-set-key [f11] 'my-fullscreen)

;全屏
(defun my-fullscreen ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0))
)
(setq initial-frame-alist '((top . 0) (left . 0) (width . 167) (height . 50)))

(put 'set-goal-column 'disabled nil)
(global-set-key(kbd "C-SPC") 'nil)

;cedet
(load-file "~/program/emacs/cedet/common/cedet.el")
(global-ede-mode 1) ;Enable the Project managerment system
;(semantic-load-enable-code-helpers) ;Enable prototype help and smart completion
;(senator-completion-menu-popup)
;(semantic-ia-complete-symbol-menu)
;(semantic-idle-completions-mode 1)
(semantic-load-enable-minimum-features)
;(semantic-load-enable-semantic-debugging-helpers)
;(semantic-load-enable-all-exuberent-ctags-support)

(require 'semantic-ia)
(require 'semantic-gcc)

;(load-file "~/program/emacs/cedet/contrib/semantic-tag-folding.el")
(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)
(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c , =") 'semantic-tag-folding-show-block)
(define-key semantic-tag-folding-mode-map (kbd "C-c ' -") 'semantic-tag-folding-fold-all)  
(define-key semantic-tag-folding-mode-map (kbd "C-c ' =") 'semantic-tag-folding-show-all)
(global-srecode-minor-mode 1)

(enable-visual-studio-bookmarks)

;jdee
(add-to-list 'load-path (expand-file-name "~/program/emacs/jde/lisp"))
(add-to-list 'load-path (expand-file-name "~/program/emacs/cedet/common"))
;(load-file (expand-file-name "~/program/emacs/cedet/common/cedet.el"))
(add-to-list 'load-path (expand-file-name "~/program/emacs/elib"))
(setq defer-loading-jde t)
(setq jde-enable-abbrev-mode t)
(if defer-loading-jde
 	(progn
	 	(autoload 'jde-mode "jde" "JDE mode." t)
		(setq auto-mode-alist
		 	(append
			 '(("\\.java\\'" . jde-mode))
			 auto-mode-alist)))
	(require 'jde))

;javascript
(load-file (expand-file-name "~/program/emacs/js/javascript.el"))
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

;ecb
(add-to-list 'load-path "~/program/emacs/ecb")
;(setq ecb-windows-width 555550)
(setq ecb-tip-of-the-day nil)
(require 'ecb)

;;template
(setq load-path(cons(expand-file-name "~/program/emacs/template/lisp")
				load-path))
(require 'template)
(template-initialize)
(setq template-default-directories (cons "~/program/emacs/template/templates/" template-default-directories))

;;lisp
(add-to-list 'load-path "/home/dzh/program/emacs/slime")
(setq inferior-lisp-program "/usr/bin/clisp")  ;SBCL or Clisp
(require 'slime)
(slime-setup)
;(slime-setup '(slime-fancy))
;(slime) ;M-x slime

(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
      (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))
;(set-face-foreground 'font-lock-comment-face "#ff7f24") ;M-x set-face-foreground

;;cscope
(require 'cc-mode) 
(load-file"/home/dzh/program/emacs/cscope/xcscope.el") 
(require 'xcscope) 
(setq cscope-do-not-update-database t) ;加速cscope寻找速度 

;;ibus
(add-to-list 'load-path "~/program/emacs/ibus")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
;(ibus-define-common-key ?\C-\s nil)
;(ibus-define-common-key ?\C-/ nil)
;(setq ibus-cursor-color '("red" "blue" "limegreen"))

;;color theme
(add-to-list 'load-path "~/program/emacs/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-subtle-hacker)
;(color-theme-jsc-dark)
;(color-theme-charcoal-black)
(color-theme-jonadabian-slate)
;(color-theme-late-night)
;(color-theme-shaman)

;;sr-speedbar
(add-to-list 'load-path "~/program/emacs/sr-speedbar")
(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(sr-speedbar-open)
;;nc
(add-to-list 'load-path "~/program/emacs/nc")
(autoload 'nc "nc" "Emulate MS-DOG file shell" t)

;;org
(setq load-path (cons "~/program/emacs/org-7.9.2/lisp" load-path))
(setq load-path (cons "~/program/emacs/org-7.9.2/contrib/lisp" load-path))
(require 'org-install)
;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode)) ; not needed since Emacs 22.2
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;scala-mode
(add-to-list 'load-path "~/program/emacs/scala-mode-master")
(require 'scala-mode-auto)
(add-to-list 'auto-mode-alist '("\\.scala\\'" . scala-mode))

;;yasnippet
(add-to-list 'load-path "~/program/emacs/yasnippet-master")
(require 'yasnippet)
(yas-global-mode 1)

;; git-emacs
(add-to-list 'load-path "~/git/git-emacs/")
(require 'git-emacs)

