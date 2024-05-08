### TODO

- Harpoon
    - [ ] Figure out how to only using full path if it's a duplicate file name
    - [ ] Add keybinding to harpoon item to the top of the list or move it to the top if already listed
- Telescope
    - [ ] Add keymap to bring up previous picker and search
    - [ ] Add keymap to harpoon selected files instead of opening them
    - [ ] Add keymap to open it in a split
    - [ ] Add keymap to grep the current highlighted search
- Install
    - [x] Write up install/uninstall script using stow for dotfiles
    - [ ] Write up install/uninstall script for all the packages in install steps?
    - [ ] Use ansible to deploy/download everything like magic
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

- tmux-cheat-sheat
    - [ ] Add more tools and clean up
    - just use more often rather than google
- nvim
    - [ ] Lualine: add Obsidian Vault
    - 


#### Things to add or change
    - [ ] Better max line length indicator only on specific files such as Python
    - [ ] Fix Lsp stuff for Python
    - [x] Git gutter to show where I've modified, added, removed. Potentially have key mappings to undo those changes
    - [x] Folding, need to either learn nvims way or find a package
