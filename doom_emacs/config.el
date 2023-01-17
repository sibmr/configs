;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font "mononoki Nerd Font:pixelsize=32:foundry=UKWN:weight=normal:slant=normal:width=normal:scalable=true")

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; hooks
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; tabs mode
(setq tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))

;; ;; keymap
;; (defun my-keychord (initial-key final-key effect-func)
;;   (interactive)
;;   (let* ((timeout 0.2)
;;          (event (read-event nil nil timeout)))
;;     ;; check if a key is pressed
;;     (if event
;;         ;; timeout met
;;         (if (and (characterp event) (= event final-key))
;;             ;; if timeout and final key pressed, do effect-func
;;             (funcall effect-func)
;;           ;; otherwise insert keys
;;           (insert initial-key)
;;           (push event unread-command-events))
;;       ;; timeout exceeded
;;       (insert initial-key))))

;; (defun my-keychord-list (timeout initial-key key-effect-list)
;;   (interactive)
;;   (let* ((event (read-event nil nil timeout)))
;;     ;; check if a key is pressed
;;     (if event
;;         ;; timeout met
;;         (if (characterp event)
;;             ;; if timeout and final key pressed, do effect-func
;;             (dolist (key-effect key-effect-list)
;;               (if (= event (nth 0 key-effect))
;;                   (funcall (nth 1 key-effect))))
;;           ;; otherwise insert keys
;;           (insert initial-key)
;;           (push event unread-command-events))
;;       ;; timeout exceeded
;;       (insert initial-key))))

;; ;; map brackets to öö and ää
;; (map! :desc "map" :i "ö" (lambda () (interactive)
;;         (my-keychord-list 0.4 ?ö (list
;;                 (list ?ö '(lambda ()
;;                             (setq unread-command-events
;;                                   (listify-key-sequence "{"))))
;;                 (list ?ä '(lambda ()
;;                             (setq unread-command-events
;;                                   (listify-key-sequence "["))))))))

;; (map! :desc "map" :i "ä" (lambda () (interactive)
;;         (my-keychord-list 0.4 ?ä (list
;;                 (list ?ä '(lambda ()
;;                             (setq unread-command-events
;;                                   (listify-key-sequence "}"))))
;;                 (list ?ö '(lambda ()
;;                             (setq unread-command-events
;;                                   (listify-key-sequence "]"))))))))

;; (map! :desc "map" :i "j" (lambda () (interactive)
;;         (my-keychord-list 0.1 ?j (list
;;                 (list ?j 'evil-normal-state)))))

 (map! :desc "comment line" :leader "k" (lambda () (interactive)
         (comment-line 1)))


(setq key-chord-two-keys-delay 0.2)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-insert-state-map "öö"
                  (lambda () (interactive)
                    (setq unread-command-events (listify-key-sequence "{"))))
(key-chord-define evil-insert-state-map "ää"
                  (lambda () (interactive)
                    (setq unread-command-events (listify-key-sequence "}"))))
(key-chord-define evil-insert-state-map "ÖÖ"
                  (lambda () (interactive)
                    (setq unread-command-events (listify-key-sequence "["))))
(key-chord-define evil-insert-state-map "ÄÄ"
                  (lambda () (interactive)
                    (setq unread-command-events (listify-key-sequence "]"))))

(key-chord-mode 1)
