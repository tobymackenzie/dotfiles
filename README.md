TJM Dotfiles
============

Toby Mackenzie's dotfiles (user level configuration for command shells and other software), as well as various useful shell scripts. Primarily config for:

- fish and zsh shells
- git
- vim

Designed for Toby Mackenzie to easily set up and maintain configuration across multiple machines, but can be used by anybody who likes what they see.  Many of the scripts in `bin` should be broadly applicable.

The `dotfiles` script (aliased to `.f` once installed) is used to place config files where software expects them to be.  This is done because most of these files must be in specific places in the home directory and we don't want this project to be the entire home directory.

Requirements
----------

- POSIX-like systems such as Mac, Linux, and BSD
- bash or compatible shell
- git is required for normal install / update methods

Usage
----------

To install, clone this repo to wherever you want and `cd` into the repo directory.  Then run the dotfiles script to install all dotfiles:

```
./bin/dotfiles
```

It will ask you to confirm replacing any existing files (it will store a backup of them).  Once installed, software must be reloaded to load the new configuration.  Shells can often be reloaded in place with `exec $SHELL`.

Install and init can be done as this one liner:

``` sh
(: ${pth:=~/.dotfiles} && git clone https://github.com/tobymackenzie/dotfiles.git $pth && $pth/bin/dotfiles init) && exec $SHELL
```

where the `pth` shell variable can be used to set a folder for storing the dotfiles project.

Once loaded, you can run `.f` to update to the latest version (uses `git`).  You can run `.f init` to place any newly added dotfiles.  Running `reshell` will reload the existing shell in place to get any changes.

Configuration
-------------

Modify any of the dotfiles to your liking.  You can create a `_local` folder in the project with the following configuration files:

- alias: sourced file with list of shell aliases, must be source-able by any of bash, fish, and zsh that are being used
- bash: custom sourced file for bash shell
- fish: custom sourced file for fish shell
- path: line-break separated list of paths to use as `$PATH`.  Be sure to include `$PATH` where the existing paths should go.  Works for bash, zsh, and fish
- zsh: custom sourced file for zsh shell

Modifying
---------

This project is organized into folders for each different type of thing the configuration is for ('/sh' for sh based shells, 'vim' for vim, etc).  Look through the files and modify any to taste.  If you add any files that need to be symlinked in the home folder (or elsewhere) add them to the `src/links.config` file.

License
-------

<footer>
<p>SPDX-License-Identifier: 0BSD</p>
</footer>

