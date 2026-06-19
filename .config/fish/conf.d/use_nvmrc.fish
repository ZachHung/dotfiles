function set_nvm --on-event fish_prompt
    functions -q nvm; or return 0

    string match -q $PWD $PREV_PWD; and return 1
    string match -eq $PREV_PWD $PWD; and not test -e '.nvmrc'; and return 1
    set -g PREV_PWD $PWD

    if test -e '.nvmrc'
        nvm use --silent
        set NVM_DIRTY true
    else if not string match $NVM_DIRTY true
        not string match -eq (nvm current) $nvm_default_version; and nvm use --silent default
        set NVM_DIRTY
    end
end
