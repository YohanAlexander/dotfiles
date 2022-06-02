#!/bin/bash

function install_terminal_tools(){
    local tools="kitty zsh ranger git-delta bat w3m imagemagick tldr ripgrep the_silver_searcher"
    if [ "$(uname)" == "Darwin" ]; then
        # install xcode command line tools
        xcode-select --install
        # install homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        # install terminal tools
        brew install gh fd autojump $tools
    elif [  -n "$(uname -a | grep Fedora)" ]; then
        # install github cli
        sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo && sudo dnf install gh
        # install terminal tools
        sudo dnf install fd-find autojump-zsh $tools
    elif [  -n "$(uname -a | grep Ubuntu)" ]; then
        # install terminal tools
        sudo apt install fd-find autojump-zsh $tools
    fi
}

function install_general_tools(){
    local tools="neovim golang python nodejs"
    if [ "$(uname)" == "Darwin" ]; then
        brew install $tools
    elif [  -n "$(uname -a | grep Fedora)" ]; then
        sudo dnf install $tools
    elif [  -n "$(uname -a | grep Ubuntu)" ]; then
        sudo apt install $tools
    fi
}

function install_oh_my_zsh(){
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    mv .zshrc.pre-oh-my-zsh .zshrc
}

function install_spaceship_prompt(){
    git clone https://github.com/denysdovhan/spaceship-prompt.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=1
    ln -s ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme
}

function install_zsh_syntax_highlighting(){
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

function install_zsh_autosuggestions(){
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}

function install_zsh_completions(){
    git clone https://github.com/clarketm/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
}

function install_fzf(){
    if [ "$(uname)" == "Darwin" ]; then
        brew install fzf
    elif [  -n "$(uname -a | grep Fedora)" ]; then
        sudo dnf install fzf
    elif [  -n "$(uname -a | grep Ubuntu)" ]; then
        sudo apt install fzf
    fi
    /usr/local/opt/fzf/install
}

function install_fzf_tab(){
    git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/fzf-tab
}

function install_nerd_fonts(){
    if [ "$(uname)" == "Darwin" ]; then
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font font-fira-code
    elif [  -n "$(uname -a | grep Fedora)" ]; then
        sudo dnf install fira-code-fonts
    elif [  -n "$(uname -a | grep Ubuntu)" ]; then
        sudo apt install fira-code-fonts
    fi
}

function install_devicons(){
    git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
}

install_terminal_tools
install_general_tools
install_oh_my_zsh
install_spaceship_prompt
install_zsh_syntax_highlighting
install_zsh_autosuggestions
install_zsh_completions
install_fzf
install_fzf_tab
install_nerd_fonts
install_devicons
