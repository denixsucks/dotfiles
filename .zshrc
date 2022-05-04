# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# Path to your oh-my-zsh installation.
export ZSH="/home/denix/.oh-my-zsh"
ZSH_THEME="bira"

alias py='python3'
plugins=(
    git 
	zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
alias vim='nvim'
export EDITOR='nvim'
alias ls='ls-icons'
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="italic"
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
alias dolphin='QT_QPA_PLATFORMTHEME="qt5ct" dolphin'

export UNITY_EDITOR_LOCATION="/home/denix/unity/Hub/Editor/"
export UNITY_PROJECTS_LOCATION="/home/denix/unity-projects/"
export CHROME_EXECUTABLE="/bin/chromium"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
