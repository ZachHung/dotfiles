# Abbreviation
abbr -a ff fzf
abbr -a vf 'vim $(fzf)'
abbr -a v vim
abbr -a cc clear
abbr -a -- g git
abbr -a -- pn pnpm
abbr -a -- yr yarn
abbr -a -- np npm
abbr -a dk docker
abbr -a dkc docker compose
abbr -a ls 'eza --color=always --group-directories-first --icons' # preferred listing
abbr -a la "eza -a --color=always --group-directories-first --icons" # all files and dirs
abbr -a ll 'eza -l --color=always --group-directories-first --icons' # long format
abbr -a lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
abbr -a l. "eza -a | grep -E '^\.'" # dotfiles
abbr -a --position anywhere -- -h '-h 2>&1 | bat --language=help --style=plain' # replace -h with bathelp
abbr -a --position anywhere -- --help '--help 2>&1 | bat --language=help --style=plain' # replace --help with bathelp
abbr -a cd z
abbr -a cdi zi
