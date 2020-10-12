;;; doom-rouille-theme.el --- ported from Rouge Theme -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-rouille-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-rouille-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-rouille-theme
  :type 'boolean)

(defcustom doom-rouille-brighter-tabs t
  "If non-nil, tabs will a more vivid background color."
  :group 'doom-rouille-theme
  :type 'boolean)

(defcustom doom-rouille-comment-bg doom-rouille-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-rouille-theme
  :type 'boolean)

(defcustom doom-rouille-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-rouille-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-rouille
  "A dark theme inspired by Doom's Rouge."

  ;; name           default   256       16
  ((bg           '("#172030" nil       nil           )) ;; modified
   (bg-alt       '("#172030" nil       nil           ))
   (base0        '("#070A0E" "black"   "black"       ))
   (base1        '("#0E131D" "#1e1e1e" "brightblack" ))
   (base2        '("#151D2B" "#2e2e2e" "brightblack" ))
   (base3        '("#1F2A3F" "#262626" "brightblack" ))
   (base4        '("#5D636E" "#3f3f3f" "brightblack" ))
   (base5        '("#64727d" "#64727d" "brightblack" ))
   (base6        '("#646464" "#6b6b6b" "brightblack" ))
   (base7        '("#E8E9EB" "#979797" "brightblack" ))
   (base8        '("#F0F4FC" "#dfdfdf" "white"       ))
   (fg           '("#cecece" "#bbb"    "white"       ))
   (fg-alt       '("#A7ACB9" "#bfbfbf" "brightwhite" ))

   (grey       base5                                 )
   ;; (red       '("#c6797e" "#c6797e" "red"          ))
   (red          '("#b05655" "#b05655" "red"          ))
   (light-red    '("#DB6E8F" "#DB6E8F" "red"          ))
   (light-orange '("#f0bd94" "#f0bd94" "brightred"    ))
   (orange       '("#eabe9a" "#eabe9a" "brightred"    ))
   (dark-orange  '("#b15c3d" "#b15c3d" "brightred"    ))
   (green        '("#A3B09A" "#A3B9A4" "green"        ))
   (teal         '("#7ea9a9" "#7ea9a9" "brightgreen"  ))
   (yellow       '("#F7E3AF" "#F7E3AF" "yellow"       ))
   (blue         '("#6e94b9" "#6e94b9" "brightblue"   ))
   (dark-blue    '("#1E6378" "#1E6378" "blue"         ))
   (magenta      '("#b18bb1" "#b18bb1" "magenta"      ))
   (salmon       '("#eb997f" "#eb997f" "orange"       ))
   (violet       '("#5D80AE" "#5D80AE" "brightmagenta"))
   (cyan         '("#88C0D0" "#88C0D0" "brightcyan"   ))
   (dark-cyan    '("#507681" "#507681" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      dark-orange)
   (vertical-bar   (doom-darken base1 0.2))
   (selection      base4)
   (builtin        dark-orange) ;;
   (comments       grey)
   (doc-comments   green)
   (constants      light-orange) ;;
   (functions      salmon)
   (keywords       magenta)
   (methods        dark-orange) ;;
   (operators      magenta)
   (type           red) ;;
   (strings        green)
   (variables      orange) ;;
   (numbers        red) ;;
   (region         base4)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange) ;;
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-pad
    (when doom-rouille-padded-modeline
      (if (integerp doom-rouille-padded-modeline) doom-rouille-padded-modeline 4)))

   (tabs-bg (if doom-rouille-brighter-tabs base6 bg))
   (tabs-fg (if doom-rouille-brighter-tabs base8 fg))
   (tabs-bar-bg (if doom-rouille-brighter-tabs bg orange))
   (tabs-marker (if doom-rouille-brighter-tabs base8 highlight))

   (modeline-fg     nil)
   (modeline-fg-alt base6)

   (modeline-bg base1)
   (modeline-bg-l `(,(doom-darken (car bg) 0.1) ,@(cdr base0)))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((lazy-highlight :background base4)

   ;; ivy
   (ivy-current-match :background base3)
   (ivy-minibuffer-match-face-2 :foreground highlight :weight 'bold)
   
   ;; ivy-posframe
   (ivy-posframe :background bg-alt)
   (ivy-posframe-border :background bg-alt)
   ;; (ivy-posframe-border :background highlight :weight 'regular)

   ((line-number &override) :foreground (doom-lighten 'base5 0.2))
   ((line-number-current-line &override) :foreground base7)
   ((paren-face-match &override) :foreground orange :background base3 :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base3 :background orange :weight 'ultra-bold)
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light)
   ((vimish-fold-fringe &override)  :foreground teal)
   
   ;; font-lock
   (font-lock-keyword-face :slant 'italic :foreground keywords)
   (font-lock-comment-face :foreground comments :slant 'italic)
   (font-lock-doc-face :foreground doc-comments :slant 'italic)
   (font-lock-preprocessor-face :foreground magenta :slant 'italic)
   ;; vertical border
   (vertical-border :foreground base6)
   
   ;; mode-line
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground highlight)

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))
   (solaire-hl-line-face :background base3)

   ;; doom-modeline
   (doom-modeline-project-root-dir :foreground base6)

   ;; ediff
   (ediff-fine-diff-A    :background (doom-darken violet 0.4) :weight 'bold)
   (ediff-current-diff-A :background (doom-darken base0 0.25))

   ;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground orange)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))

   ;; magit
   (magit-diff-hunk-heading           :foreground bg                    :background (doom-blend highlight bg 0.3) :extend t)
   (magit-diff-hunk-heading-highlight :foreground bg                    :background highlight :weight 'bold :extend t)
   (magit-section-heading :foreground highlight)
   
   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)

   ;; centuar-tabs
   (centaur-tabs-selected :foreground tabs-fg :background tabs-bg)
   (centaur-tabs-selected-modified :foreground tabs-fg :background tabs-bg)
   (centaur-tabs-unselected-modified :foreground tabs-fg :background bg)
   (centaur-tabs-active-bar-face :background tabs-bar-bg)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected :foreground tabs-marker)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected :foreground tabs-marker)

   ;; neotree
   (neo-root-dir-face :foreground orange)

   ;; treemacs
   (treemacs-root-face :foreground highlight :weight 'ultra-bold :height 1.2)
   (doom-themes-treemacs-root-face :foreground highlight :weight 'ultra-bold :height 1.2)
   (doom-themes-treemacs-file-face :foreground highlight)
   (treemacs-directory-face :foreground highlight)

   ;; tooltip 
   (tooltip :background base3 :foreground fg-alt))
  ;; --- extra variables ---------------------
  ()
  )

;;; doom-rouille-theme.el ends here
