# Git Tricks

## Tracking $HOME with git (without interferring with .gitignore in sub directories)

* In your .zshrc

    ```zsh
    alias gith="git --work-tree=$HOME --git-dir='$HOME/.dotfiles.git'"
    ```

* In your $GIT_DIR/info/exclude

    ```gitignore
    # .gitignore
    *
    # keep track
    !.bashrc
    !.gitignore
    ```

This will ensure that you can have

* a global `$HOME/.gitignore` that works normally to exclude files in all your git repos that are in subdirectories of $HOME

* you're excluding everything in your $HOME dir except what you explicitly chose to track
