export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=30
export SVN_EDITOR=nvim
export EDITOR=nvim
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:\
$HOME/bin:\
$HOME/.cache/rebar3/bin:\
$HOME/.rbenv/bin:\
$HOME/.cargo/bin:\
$HOME/.asdf/shims/:\
/Users/ricardo.pereira/.pyenv/versions/3.9.0/bin:\
/usr/local/opt/curl/bin:\
/usr/local/Cellar/qt@5.5/5.5.1_1/bin:\
/Library/Frameworks/Python.framework/Versions/3.9/bin:\
/usr/local/Cellar/hive/2.3.7/bin:\
/usr/local/go/bin:\
/usr/local/sbin:\
/usr/local/opt/openssl/bin:\
/usr/local/opt/icu4c/bin:\
/usr/local/opt/icu4c/sbin:\
$HOME/Library/Python/3.9/bin

export LDFLAGS="-L/usr/local/opt/openssl/lib -L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include -I/usr/local/opt/icu4c/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig"

export GPG_TTY=`tty`
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/Contents/Home"
export GOPATH="$HOME/go"
export LANG="en_US.UTF-8"
export ERL_AFLAGS="-kernel shell_history enabled"

# GCP
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ricardo.pereira/Downloads/google-cloud-sdk/path.zsh.inc' ]; then
  . '/Users/ricardo.pereira/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ricardo.pereira/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then
  . '/Users/ricardo.pereira/Downloads/google-cloud-sdk/completion.zsh.inc'
fi

