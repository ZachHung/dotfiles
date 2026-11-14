# fnm
# Only in interactive shells: Tide's background prompt job (and any `fish -c`)
# would otherwise rerun `fnm env` on every repaint. When Tide kills that job
# mid-startup, fnm panics with "Broken pipe". Child processes inherit PATH anyway.
status is-interactive; or exit

set FNM_PATH "$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]
  fish_add_path --global --move "$FNM_PATH"
  fnm env --use-on-cd --version-file-strategy=recursive --shell fish | source
end
