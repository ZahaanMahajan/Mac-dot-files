# ─────────────────────────────────────────────
# ⚙️  general utilities
# ─────────────────────────────────────────────
alias vim='nvim'
alias ls='colorls'
alias ide='~/.ide.zsh'
alias lsa='colorls -a'
alias al='vim ~/.alias.zsh'
alias lc='colorls -la --sd'
alias reload='source ~/.zshrc'
alias ports='lsof -i -p -n | grep listen'
alias sync_config='./.sync_zsh_config.zsh'
alias brewup='brew update && brew upgrade && brew cleanup'
alias now='date +"Date: %d %B %Y - Time: %I:%M %p" | sed "s/AM/am/;s/PM/pm/"'

# ─────────────────────────────────────────────
# Python Alias
# ─────────────────────────────────────────────
alias python='python3'

# ─────────────────────────────────────────────
# Flutter Alias
# ─────────────────────────────────────────────
alias flutter='fvm flutter'
alias dart='fvm dart'

# ─────────────────────────────────────────────
# 🧠 tmux aliases
# ─────────────────────────────────────────────
alias tm='tmux'
alias tma='tmux attach-session'
alias tmat='tmux attach-session -t'
alias tmks='tmux kill-session -a'
alias tml='tmux list-sessions'
alias tmn='tmux new-session'
alias tmns='tmux new -s'
alias tms='tmux new-session -s'

# ─────────────────────────────────────────────
# 🔧 kill process by port
# usage: kill 3000
# ─────────────────────────────────────────────
alias kill='f() { lsof -t -i:$1 | xargs kill -9; }; f'

# ─────────────────────────────────────────────
# 🐙 git & github aliases
# ─────────────────────────────────────────────

# basic
alias ga='git add .'
alias gc='git commit -m'
alias gpu='git push'
alias gpl='git pull'
alias grb='git rebase'
alias gm='git merge'
alias gss='git status'
alias gl='git log'
alias glo='git log --oneline'

# remotes
alias gf='git fetch'
alias gra='git remote add'
alias grv='git remote -v'
alias grm='git remote rm'
alias gri='git remote show origin'

# branching
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbd='git branch -d'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcp='git cherry-pick'

# push/pull
alias gpo='git push origin'
alias gplo='git pull origin'

# stashing
alias gst='git stash'
alias gstp='git stash pop'
alias gstc='git stash clear'
alias gsta='git stash apply'
alias gstl='git stash list'
alias gstd='git stash drop'

# cleanup & undo
alias gclean='git clean -fd'
alias gprune='git remote prune origin'
alias gundo='git reset --soft head~1'

# logging & diff
alias gd='git diff'
alias gds='git diff --staged'
alias gll='git log --oneline --graph --decorate --all'

# github cli
alias gpullpr='gh pr checkout'
alias gprlist='gh pr list'
alias gprview='gh pr view --web'
alias gopen='gh repo view --web'
alias gissue='gh issue list'

# ─────────────────────────────────────────────
# 📂 yazi file manager function
# ─────────────────────────────────────────────
sf() {
  local tmp="$(mktemp -t "yazi-cwd.xxxxxx")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$pwd" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# ─────────────────────────────────────────────
# 🕒 video duration summary (requires ffprobe)
# ─────────────────────────────────────────────
alias duration='
find . -maxdepth 2 -type f ! -name ".*" -exec sh -c "
  sum=0;
  for file in \"\$@\"; do
    duration=\$(ffprobe -v error -select_streams v:0 -show_entries format=duration \
              -of default=noprint_wrappers=1:nokey=1 \"\$file\" 2>/dev/null);
    if [ -n \"\$duration\" ]; then
      echo \"file: \$file - duration: \$(echo \$duration | awk '\''{printf \"%02d:%02d:%02d\n\", \$1/3600, (\$1%3600)/60, \$1%60}'\'')\";
      sum=\$(echo \"\$sum + \$duration\" | bc);
    fi;
  done;
  echo \"total duration: \$(echo \$sum | awk '\''{printf \"%02d:%02d:%02d\n\", \$1/3600, (\$1%3600)/60, \$1%60}'\'')\"
" _ {} +'

# ─────────────────────────────────────────────
# 📦 extract various archive types
# usage: extract file.zip
# ─────────────────────────────────────────────
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)  tar xjf "$1" ;;
      *.tar.gz)   tar xzf "$1" ;;
      *.bz2)      bunzip2 "$1" ;;
      *.rar)      unrar x "$1" ;;
      *.gz)       gunzip "$1" ;;
      *.tar)      tar xf "$1" ;;
      *.tbz2)     tar xjf "$1" ;;
      *.tgz)      tar xzf "$1" ;;
      *.zip)      unzip "$1" ;;
      *.z)        uncompress "$1" ;;
      *.7z)       7z x "$1" ;;
      *)          echo "❌ unknown archive type: '$1'" ;;
    esac
  else
    echo "❌ file does not exist: '$1'"
  fi
}


