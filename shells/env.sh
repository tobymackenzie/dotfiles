#--paths
setdefaultenv TJM_DOTFILES_PATH ~/.dotfiles
setdefaultenv TJM_BIN_PATH ~/bin
setdefaultenv TJM_GH_BU_PATH ~/bu/github
setdefaultenv TJM_PROJ_PATH ~/projects
setdefaultenv TJM_CHECKOUTS_PATH "$TJM_PROJ_PATH"

#--common
senv BROWSER w3m
senv EDITOR vi
senv INPUTRC "$TJM_DOTFILES_PATH/etc/inputrc"
senv VISUAL vim
senv WWW_HOME "$TJM_DOTFILES_PATH/www/index.html"

#--config
setdefaultenv TJM_COLORS 'koehlertm'
setdefaultenv TJM_GH_USER 'tobymackenzie'
