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
- Install Steps
    - To install apt packages
        - sudo apt install fzf ripgrep tmuxp zsh
    - To install tpm
        - git clone https://github.com/tmux-plugins/tpm ~/.dotfiles/.tmux/plugins/tpm
        - run <C-a>I to install tpm plugins
        - symlink ~/.dotfiles/tmux/git_status.sh to ~/.tmux/plugins/tmux/custom/ for catpuccin git status
    - To install tmux 3.1
        - sudo apt-get -y remove tmux (to uninstall)
        - wget https://github.com/tmux/tmux/releases/download/3.1/tmux-3.1.tar.gz
        - tar xf tmux-3.1.tar.gz
        - rm -f tmux-3.1.tar.gz
        - sudo mv tmux-3.1 /usr/local/src (if not there)
        - tmux -V (to confirm)
    - To install conda
        - https://docs.conda.io/projects/conda/en/latest/user-guide/install/linux.html
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
