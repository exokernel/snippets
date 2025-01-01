# Git Tricks

## Tracking $HOME with git (without interferring with .gitignore in sub directories)

* Turn your $HOME into a git repo

    ```zsh
    git init --separate-git-dir=$HOME/.homedir.git .
    ```

    This also has the nifty advantage of creating a `.git` file with the contents:

    ```text
    gitdir: /path/to/your/homedir/.homedir.git
    ```

    where `/path/to/your/homedir` is the same as `$HOME` of course.

    This means `git` will automatically use that directory for all its config an metadata and you won't need the `gith` alias mentioned below.

    Why not just use `.git` then? Good question! I don't have a good answer for that. Something, something conflicts with .git/ in subdirs?

    Maybe you can! But this setup is working well for me and if you choose not to have the `.git` file and use the alias `gith` described below, then the advantage is that you have to run a special command to use git in your homedir, which is kinda a good practice for safety, or something?

* In your .zshrc

    ```zsh
    alias gith="git --git-dir='$HOME/.homedir.git'"
    ```

* In your $GIT_DIR/info/exclude

    ```gitignore
    # .gitignore
    #
    # Ignore these
    *

    # Track these
    !.bashrc
    !.gitignore
    ```

This will ensure that you can have

* a global `$HOME/.gitignore` that works normally to exclude files in all your git repos that are in subdirectories of $HOME

* you're excluding everything in your $HOME dir except what you explicitly chose to track
