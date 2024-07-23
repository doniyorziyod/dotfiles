set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias x "tmuxfzf"
alias q exit
alias c "clear"
alias t "tree"
alias sql "psql -U doniyor -d postgres"
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias hx helix
alias vim nvim
alias neo neovide
alias mine "sudo java -jar ~/Downloads/TLauncher.v10/TLauncher.jar"
alias updcalibre "sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin"

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.config/i3/scripts/ $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/doniyorziyod/google-cloud-sdk/path.fish.inc' ]; . '/home/doniyorziyod/google-cloud-sdk/path.fish.inc'; end
