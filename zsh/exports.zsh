export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=30
export SVN_EDITOR=nvim
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/usr/local/share/dotnet:/Users/Ricardo/bin::/Users/Ricardo/.cache/rebar3/bin:/usr/local/Cellar/python/2.7.14_3/bin:/usr/local/go/bin"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/opt/curl/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/Cellar/qt@5.5/5.5.1_1/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export GOPATH="$HOME/go"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
export LANG="en_US.UTF-8"
export ERL_AFLAGS="-kernel shell_history enabled"

