export DOWNGRADE_FROM_ALA=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GPG_TTY=$(tty)
export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/nvim
export BAT_THEME='Coldark-Dark'

stty -ixon
shopt -s autocd

HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
export HISTFILESIZE=
export HISTSIZE=

use_color=true
set -o vi
export LS_OPTIONS='-hN --color=auto --group-directories-first'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'
alias ccat="highlight --out-format=ansi"
alias grep="grep --color=auto"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_PREVIEW_COMMAND="bat --style=numbers,changes --wrap never --color always {} || ccat {}"
export FZF_CTRL_T_OPTS="--min-height 30 --preview-window right:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"
export FZF_CTRL_T_COMMAND='ag --hidden -g ""'
export FZF_ALT_C_COMMAND='fd --hidden --type directory . $PWD'

[[ -f ~/.bash_prompt ]] && . ~/.bash_prompt
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r /usr/share/fzf/completion.bash ] && . /usr/share/fzf/completion.bash
[ -r /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash
[[ $- != *i* ]] && return

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
eval "$(pyenv init --path)"

echo -e "\e]2;Alacritty: $PWD\007"
cd() {
	builtin cd "$@"
	echo -e "\e]2;Alacritty: $PWD\007\c"
}

alias lf=lfrun
# lf icons
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

eval "$(starship init bash)"
eval "$(direnv hook bash)"
eval "$(register-python-argcomplete pipx)"
