#--paths
setdefaultenv TJMDOT ~/.dotfiles
setdefaultenv TJMLBIN ~/bin
setdefaultenv TJMBIN "$TJMDOT/bin"
setdefaultenv TJMGHBUPATH ~/bu/github
setdefaultenv TJMPROJ ~/projects
setdefaultenv TJMCHECKOUT "$TJMPROJ"

#--common
senv BROWSER w3m
senv EDITOR vi
senv INPUTRC "$TJMDOT/etc/inputrc"
senv LESS "--ignore-case --incsearch --jump-target=4 --mouse --quiet --RAW-CONTROL-CHARS --status-column"
senv VISUAL vim
senv WWW_HOME "$TJMDOT/www/index.html"

#--config
setdefaultvar TJMCOLORSET 'koehlertm'
setdefaultvar TJMGHUSER 'tobymackenzie'
