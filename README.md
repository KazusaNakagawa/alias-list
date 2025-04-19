## alias-list

* alias 設定の控え

* `alias-list/`: for source control

## flow

- [contrib/completion/git-prompt.sh](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)

```sh
# touch file & copy git-prompt.sh
mkdir -p /usr/local/etc/bash_completion.d
touch /usr/local/etc/bash_completion.d/git-prompt.sh

# clone
git clone git@github.com:KazusaNakagawa/alias-list.git

# copy
cp .zshrc-3 ~/.zshrc

# reflect
source ~/.zshrc
```
