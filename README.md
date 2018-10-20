TJM Dotfiles
============
The dotfiles (configuration files for various POSIX applications) of Toby Mackenzie.  Will primarily be used by Toby Mackenzie himself to easily set up and maintain configuration across multiple machines, but can be used by anybody who likes what they see.  Feel free to take parts if you like.

Usage
----------
Clone this repo to wherever you want and `cd` into the repo directory.  Then run the dotfiles script to install all dotfiles:

```
./dotfiles
```

It will ask you to confirm replacing any files (it will store a backup of them).

Once ran, modify any of the dotfiles to your liking.  You will most likely need to add to $PATH in .bash_profile and .config/fish/config.fish depending on which shell you use.

Install Atom packages by running:

``` sh
apm install --packages-file ~/.dotfiles/packages.txt
```

and update list with:

``` sh
apm list --installed --bare > ~/.dotfiles/packages.txt
```

Modifying
---------
This project is organized into folders for each different type of thing the configuration is for ('/sh' for sh based shells, 'vim' for vim, etc).  Each folder has a 'dotfiles.json' that specifies what files are to be symlinked where.  If you add any files that need to be symlinked in the home folder (or elsewhere) add them to the 'dotfiles.json'.
