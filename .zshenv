#export JAVA_HOME=$(/usr/libexec/java_home)
export YELLOW=`echo -e '\033[1;33m'`
export LIGHT_CYAN=`echo -e '\033[1;36m'`
export GREEN=`echo -e '\033[0;32m'`
export NOCOLOR=`echo -e '\033[0m'`
export LESS="-iMSx4 -FXR"
export PAGER="sed \"s/^\(([0-9]\+ [rows]\+)\)/$GREEN\1$NOCOLOR/;s/^\(-\[\ RECORD\ [0-9]\+\ \][-+]\+\)/$GREEN\1$NOCOLOR/;s/|/$GREEN|$NOCOLOR/g;s/^\([-+]\+\)/$GREEN\1$NOCOLOR/\" 2>/dev/null | less"

export JAVA_HOME=$(/usr/libexec/java_home -v11)

export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

export BROWSER="firefox developer edition"

export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi
source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
export PATH="/usr/local/sbin:$PATH"

alias pev2='wget https://www.github.com/dalibo/pev2/releases/latest/download/index.html -O ~/Tools/pev2.html && open -a Firefox\ Developer\ Edition -g ~/Tools/pev2.html'

alias=tmux="tmux -2 -f tmux.conf"

for file in ~/.zshenv_*; do
    source "$file"
done
