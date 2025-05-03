# init
# Git補完（必要なら）
#  mkdir -p ~/.zsh
#  curl -o ~/.zsh/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh

# Git補完用 fpath 設定
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Git # -----------------
autoload -Uz vcs_info

# 🔍 Git push pending / up-to-date の判定追加
function update_git_remote_status() {
  local ahead behind
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    # リモートの状態取得（fetchなし）
    local remote_info=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null)
    ahead=$(echo $remote_info | awk '{print $1}')
    behind=$(echo $remote_info | awk '{print $2}')

    if [[ -n "$ahead" && "$ahead" -gt 0 ]]; then
      GIT_REMOTE_STATUS=">"
    elif [[ -n "$behind" && "$behind" -eq 0 ]]; then
      GIT_REMOTE_STATUS="="
    else
      GIT_REMOTE_STATUS=""
    fi
  else
    GIT_REMOTE_STATUS=""
  fi
}

# vcs_info + リモート差分を含めた表示に更新
precmd() {
  vcs_info
  update_git_remote_status
}

# 表示形式を変更
zstyle ':vcs_info:git:*' formats '🍡 %b%c%u'        # ブランチ + 状態
zstyle ':vcs_info:git:*' actionformats '🍡 %b|%a%c%u' # rebase などのとき
zstyle ':vcs_info:*' enable git

# ステータス記号のカスタマイズ（任意）
zstyle ':vcs_info:git:*' unstagedstr '!'    # ワーキングツリーに未ステージ変更
zstyle ':vcs_info:git:*' stagedstr '+'      # ステージ済み変更
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' get-revision true
zstyle ':vcs_info:git:*' get-untracked-files true
zstyle ':vcs_info:git:*' untrackedstr '?'   # 未追跡ファイルあり

# プロンプト設定
setopt PROMPT_SUBST
# PS1='%F{blue}%~%f (%F{green}${vcs_info_msg_0_}%f) %# '
PS1='%F{blue}%~%f (%F{green}${vcs_info_msg_0_}${GIT_REMOTE_STATUS}%f) %# '

# -----------------

# rbenv
# eval "$(rbenv init -)"

# nodenv
# eval "$(nodenv init -)"

# .bashrc の読み込み
if [ -f ~/alias-list/.bashrc ]; then
  source ~/alias-list/.bashrc
fi

# Setting PATH for Python 3.9
export PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
alias python=python3
alias pip=pip3

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/nakagawakazusa/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Created by `pipx` on 2025-04-26 02:28:34
export PATH="$PATH:/Users/nakagawakazusa/.local/bin"
export PATH="$PATH:/Users/nakagawakazusa/Library/Python/3.9/bin"

# nvmの設定
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
