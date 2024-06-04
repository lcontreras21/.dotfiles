#### Manual Instal Steps
- Install Steps
    - To install apt packages
        - sudo apt install fzf ripgrep tmuxp zsh stow
        * Install oh-my-zsh: sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        * Install Powerlevel10k: https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh
        * Make sure terminal is using zsh if fresh install
    * Install Neovim
        * Install AppImage https://github.com/neovim/neovim/blob/master/INSTALL.md
    * Install Font
        * Download from NerdFonts: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/RobotoMono.zip
    - To install tpm
        - git clone https://github.com/tmux-plugins/tpm ~/.dotfiles/tmux/.config/tmux/plugins/tpm
        - run <C-a>I to install tpm plugins
        - symlink ~/.config/tmux/git_status.sh to ~/.config/tmux/plugins/tmux/custom/ for catpuccin git status
    - To install tmux 3.1
        - sudo apt-get -y remove tmux (to uninstall)
        - wget https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1.tar.gz
        - tar xf tmux-3.1.tar.gz
        - rm -f tmux-3.1.tar.gz
        - sudo mv tmux-3.1 /usr/local/src (if not there)
        - tmux -V (to confirm)
    - To install conda
        - https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html
    * Installing dotfiles
        * Clone dotfiles repo TODO: fix nvim submodule not cloning properly
