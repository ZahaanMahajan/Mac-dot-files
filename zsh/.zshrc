# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim

plugins=(git)

export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin/"
export PATH="$HOME/.fvm_flutter/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"

source $ZSH/oh-my-zsh.sh
source ~/.alias.zsh


eval "$(pyenv init --path)"
eval "$(pyenv init -)"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/zahaanmahajan/.dart-cli-completion/zsh-config.zsh ]] && . /Users/zahaanmahajan/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

eval "$(rbenv init - zsh)"
