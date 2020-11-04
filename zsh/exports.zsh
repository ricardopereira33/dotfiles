export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=30
export SVN_EDITOR=nvim
export EDITOR=nvim
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/bin::$HOME/.cache/rebar3/bin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/Cellar/qt@5.5/5.5.1_1/bin:$PATH"
export PATH="/usr/local/Cellar/python/2.7.14_3/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.asdf/shims/:$PATH"

# icu4c & openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/icu4c/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig"

export GPG_TTY=`tty`
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home"
export GOPATH="$HOME/go"
export LANG="en_US.UTF-8"
export ERL_AFLAGS="-kernel shell_history enabled"
