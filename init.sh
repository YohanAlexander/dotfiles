if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    echo "Mac OS X platform"
    # install xcode command line tools
    xcode-select -—install
    # install homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # install nerd fonts and fira code
    brew tap homebrew/cask-fonts\nbrew install --cask font-hack-nerd-font font-fira-code
    # install fzf
    brew install fzf
    /usr/local/opt/fzf/install
    # install terminal tools
    brew install gh kitty zsh ranger git-delta fd bat w3m imagemagick autojump tldr ripgrep the_silver_searcher
    # install general tools
    brew install neovim golang python nodejs
elif [  -n "$(uname -a | grep Fedora)" ]; then
    # Do something under Fedora GNU/Linux platform
    echo "Fedora GNU/Linux platform"
    # install github cli
    sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo && sudo dnf install gh
    # install nerd fonts
    sudo dnf install fira-code-fonts
    # install fzf
    sudo dnf install fzf
    /usr/local/opt/fzf/install
    # install terminal tools
    sudo dnf install kitty zsh ranger git-delta fd-find bat w3m imagemagick autojump-zsh tldr ripgrep the_silver_searcher
    # install general tools
    sudo dnf install neovim golang python nodejs
elif [  -n "$(uname -a | grep Ubuntu)" ]; then
    # Do something under GNU/Linux platform Ubuntu distro
    echo "Ubuntu GNU/Linux platform"
fi
