if status is-interactive
    # Commands to run in interactive sessions can go here

    # Color scheme
    set fish_color_error 81a1c1 # #81a1c1 default color when typing suggestion
    set fish_color_autosuggestion 6B7280 # #6B7280 suggestion
    set fish_color_command 81a1c1 # #81a1c1 binary command
    set fish_color_quote a3be8c # #a3be8c text color inside the quote
    set fish_color_comment a3be8c # #a3be8c comment color
    set fish_color_valid_path --underline # attribute for a valid path
    set fish_color_param 88c0d0 # #88c0d0 paremeter color such `--version`
    set fish_color_cancel bf616a # #bf616a
    set fish_color_end 81a1c1 # #81a1c1
    set fish_color_escape 3b4252 # #3b4252 
    set fish_color_history_current d08770 # #d08770
    set fish_color_match bf616a # #bf616a
    set fish_color_normal eceff4 # #eceff4
    set fish_color_operator b48ead # #b48ead
    set fish_color_redirection 5e81ac # #5e81ac
    set fish_color_search_match 81a1c1 # #81a1c1
    set fish_color_selection white --bold '--background=brblack'
    set fish_color_status red
    set fish_pager_color_completion 81a1c1 # #81a1c1
    set fish_pager_color_description yellow
    set fish_pager_color_prefix white --bold --underline
    set fish_pager_color_progress brwhite '--background=cyan'

    # Load Fisher plugins
    for file in ./conf.d/*.fish
        builtin source $file 2>/dev/null
    end

    string match -q "$TERM_PROGRAM" vscode
    and . (code --locate-shell-integration-path fish)

    if not test "$TERM_PROGRAM" = vscode
        set -U fish_greeting "Hello World"
    else
        set -U fish_greeting ""
    end

    # nvm default version
    set -U nvm_default_version lts/iron

    # fzf default options
    set -gx fzf_preview_dir_cmd "eza -l --color=always --group-directories-first --icons"
    set -gx FZF_DEFAULT_COMMAND 'fd --type file --color=always'
    set -gx FZF_CTRL_T_COMMAND FZF_DEFAULT_COMMAND
    set -gx FZF_DEFAULT_OPTS "
    --ansi
    --cycle --layout=reverse --border --height=90% --preview-window=wrap --marker='*'
"

    set -gx MANPAGER "sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

    # bat default options
    set -gx BAT_THEME ansi

    # set LS_COLORS using vivid
    set -gx LS_COLORS (vivid generate nord)

    # Aliases
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."

    # Abbreviation
    source $HOME/.config/fish/abbr.fish

    # Utilities
    zoxide init --cmd cd fish | source

    # fzf.fish
    fzf_configure_bindings --directory=\cf --variables=\e\cv
    set fzf_diff_highlighter delta

    # pnpm
    set -gx PNPM_HOME "/home/zachhung/.pnpm"
    if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
    end
    # pnpm end
end
