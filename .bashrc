alias ls='ls -n --color'
alias tlmgr='tllocalmgr'
alias fzathura='zathura $(fzf)'
alias calcurse='calcurse -D $HOME/Dropbox/.calcurse/'
export PATH="$HOME/.scripts:$PATH"

# ranger shortcuts
alias cranger='ranger $HOME/Dropbox/school/classes'
alias tranger='ranger $HOME/Dropbox/school/textbooks'
alias dranger='ranger $HOME/Downloads'

function _update_ps1() {
	    PS1=$(powerline-shell $?)
    }

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
	    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#git repo to track dotfiles
alias config='/usr/bin/git --git-dir=/home/connor/.cfg --work-tree=/home/connor'
