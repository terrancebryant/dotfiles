# set -e

# . lib-ui.sh
# . lib-misc.sh

info "Beginning bootstrapping for OS X...\n"

# Download and install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
	info "Installing XCode Command Line Tools\n"
	xcode-select --install
fi

# Download and install zsh
if [[ ! -x /usr/local/bin/zsh ]]; then
	info "Installing zsh\n"
	brew install zsh
fi

# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
	info "Installing Homebrew\n"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Modify the path
export PATH=/usr/local/bin:$PATH

# Download and install git
if [[ ! -x /usr/local/bin/git ]]; then
	info "Installing git\n"
	brew install git
fi

success "Bootstrapping is complete\n"

if [ ! "$SHELL" == "/usr/local/bin/zsh" ]; then
        info "Switching to Oh-My-Zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi