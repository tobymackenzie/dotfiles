TJM Dotfiles
============

The dotfiles (configuration files for various POSIX applications) of Toby Mackenzie. Primarily config for:

- fish (shell) + CLI helper aliases and commands
- git
- vim

Designed for Toby Mackenzie to easily set up and maintain configuration across multiple machines, but can be used by anybody who likes what they see.

Requirements
----------

Only works on POSIX-like OS's such as Mac, Linux, BSD.  Generally requires bash or compatible shell.

Usage
----------

Clone this repo to wherever you want and `cd` into the repo directory.  Then run the dotfiles script to install all dotfiles:

```
./bin/dotfiles
```

It will ask you to confirm replacing any files (it will store a backup of them).

Install and init can be done as this one liner:

``` sh
(: ${pth:=~/.dotfiles} && git clone https://github.com/tobymackenzie/dotfiles.git $pth && $pth/bin/dotfiles init) && exec $SHELL
```

where the `pth` shell variable can be used to set a folder for storing the dotfiles project. That `exec` bit at the end replaces the current shell with a new shell so that these dotfiles settings are loaded.

Once ran, modify any of the dotfiles to your liking.  See ["Configuration" section](#configuration) below for setting `$PATH`, etc.

Configuration
-------------

You can create a `_local` folder in the project with the following configuration files:

- alias: sourced file with list of shell aliases, must be sourcable by any of bash, fish, and zsh that are being used
- bash: custom sourced file for bash shell
- fish: custom sourced file for fish shell
- path: line-break separated list of paths to use as `$PATH`.  Be sure to include `$PATH` where the existing paths should go.  Works for bash, zsh, and fish
- zsh: custom sourced file for zsh shell

Modifying
---------
This project is organized into folders for each different type of thing the configuration is for ('/sh' for sh based shells, 'vim' for vim, etc).  Each folder has a 'dotfiles.json' that specifies what files are to be symlinked where.  If you add any files that need to be symlinked in the home folder (or elsewhere) add them to the 'dotfiles.json'.
