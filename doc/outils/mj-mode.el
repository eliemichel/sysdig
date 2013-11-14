; MJ mode for emacs

;
(defvar mj-mode-hook nil)

;
(defvar mj-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    map)
  "Keymap for MJ major mode")

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.mj\\'" . mj-mode))



;;;;; COLORATION NOW

; Coloration syntaxique
(defconst mj-font-lock-keywords
  (list
   '("\\<\\(const\\|where\\|\\(end where\\)\\)\\>" . font-lock-builtin-face)   ; Constructeurs extérieurs 
   '("\\<\\(if\\|then\\|else\\|\\(end if\\)\\)\\>" . font-lock-keyword-face)   ; Constructeurs intérieurs
   '("^[a-zA-Z][a-zA-Z0-9\_]*" . font-lock-builtin-face)                       ; Déclarations fonctions mj
   '("\\(0\\|1\\|true\\|false\\) " . font-lock-constant-face)                  ; Constantes (0,1,false,true)
   '("\\<\\(not\\|and\\|or\\|xor\\|mux\\)\\>" . font-lock-function-name-face)  ; Fonctions spéciales mj
   )
  "Coloration")

; Coloration
(defvar mj-font-lock-keywords mj-font-lock-keywords
  "Default highlighting expressions for MJ mode")



;;;;; INDENTATION NOW

(defun mj-indent-line ()
  "Indent current line as MJ code"
  (interactive)
  (beginning-of-line)
  (if (bobp)
      (indent-line-to 0)
    (let ((not-indented t) cur-indent)
      (if (looking-at "^[ \t]*\\(end\\|else\\)")
	  (progn
	    (save-excursion
	      (forward-line -1)
	      (setq cur-indent (- (current-indentation) 2)))
	    (if (< cur-indent 0)
		(setq cur-indent 0)))
        (save-excursion 
          (while not-indented
            (forward-line -1)
            (if (looking-at "^[ \t]*end")
                (progn
                  (setq cur-indent (current-indentation))
                  (setq not-indented nil))
              (if (looking-at "^\\(.*[ \t]\\)?\\(if\\|else\\|where\\)")
                  (progn
                    (setq cur-indent (+ (current-indentation) 2))
                    (setq not-indented nil))
                (if (bobp)
                    (setq not-indented nil)))))))
      (if cur-indent
          (indent-line-to cur-indent)
        (indent-line-to 0)))))



;;;;; SYNTAX TABLE

(defvar mj-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?_ "w" st)
    (modify-syntax-entry ?( ". 1" st)
    (modify-syntax-entry ?* ". 23" st)
    (modify-syntax-entry ?) ". 4b" st)
    st)
  "Syntax table for mj-mode")




;;;;; ENTRY FUNCTION

(defun mj-mode ()
  "Major mode for editing MiniJazz files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table mj-mode-syntax-table)
  (use-local-map mj-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(mj-font-lock-keywords))
  (set (make-local-variable 'indent-line-function) 'mj-indent-line)
  (setq major-mode 'mj-mode)
  (setq mode-name "MJ")
  (run-hooks 'mj-mode-hook))



;;;;;
(provide 'mj-mode)
