if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Welcome prompt
set fish_greeting (curl -s -m 0.5 "wttr.in/?format=3")

# window localhost
set -gx winhost (grep -G '^nameserver' /etc/resolv.conf | awk '{print $2}')

# echo $FZF_DEFAULT_OPTS

# fzf default options
set -x fzf_preview_dir_cmd "exa -l --color=always --group-directories-first --icons"
set -x FZF_DEFAULT_COMMAND 'fdfind --type file --color=always'
set -x FZF_CTRL_T_COMMAND FZF_DEFAULT_COMMAND
set -x FZF_DEFAULT_OPTS '
    --cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*"
    --ansi
'

# bat default options
set -x BAT_THEME ansi

# set LS_COLORS using vivid
set -x LS_COLORS (vivid generate nord)

# Abbreviation
abbr -a cc clear
abbr -a -- g git
abbr -a -- pn pnpm
abbr -a -- yr yarn
abbr -a -- np npm
abbr -a .. 'cd ..'
abbr -a ls 'exa  -l --color=always --group-directories-first --icons' # preferred listing
abbr -a la "exa -a --color=always --group-directories-first --icons" # all files and dirs
abbr -a ll 'exa -l --color=always --group-directories-first --icons' # long format
abbr -a lt 'exa -aT --color=always --group-directories-first --icons' # tree listing
abbr -a l. "exa -a | grep -E '^\.'"

# Utilities
starship init fish | source


# Color scheme
set -U fish_color_error 81a1c1 # #81a1c1 default color when typing suggestion
set -U fish_color_autosuggestion 6B7280 # #6B7280 suggestion
set -U fish_color_command 81a1c1 # #81a1c1 binary command
set -U fish_color_quote a3be8c # #a3be8c text color inside the quote
set -U fish_color_comment a3be8c # #a3be8c comment color
set -U fish_color_valid_path --underline # attribute for a valid path
set -U fish_color_param 88c0d0 # #88c0d0 paremeter color such `--version`
set -U fish_color_cancel bf616a # #bf616a
set -U fish_color_end 81a1c1 # #81a1c1
set -U fish_color_escape 444444 # #444444q
set -U fish_color_history_current d08770 # #d08770
set -U fish_color_match bf616a # #bf616a
set -U fish_color_normal eceff4 # #eceff4
set -U fish_color_operator b48ead # #b48ead
set -U fish_color_redirection 005faf # #005faf
set -U fish_color_search_match 81a1c1 # #81a1c1
set -U fish_color_selection white --bold '--background=brblack'
set -U fish_color_status red
set -U fish_pager_color_completion 81a1c1 # #81a1c1
set -U fish_pager_color_description yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite '--background=cyan'

# nvm default version
set -gx nvm_default_version "v18.15.0"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
