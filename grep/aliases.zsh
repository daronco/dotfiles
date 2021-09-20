IGNORES='--exclude-dir=.git --exclude-dir=.svn --exclude-dir=doc --exclude-dir=rdoc --exclude-dir=node_modules --exclude-dir=tmp --exclude-dir=public --exclude-dir=.meteor --exclude-dir=log --exclude-dir=tmp --exclude-dir=builtAssets --exclude-dir=extras --exclude-dir=vendor --exclude-dir=coverage --exclude="*.log" --exclude="*.bz2" --exclude-dir=pkg --exclude-dir=_other --exclude-dir=_tmp --exclude-dir=.sass-cache --exclude-dir=venv --exclude-dir=.venv --exclude-dir=__pycache__ --exclude-dir=dist --exclude-dir=.cache --exclude-dir=.volumes --exclude-dir=private'
GREP='grep --exclude="*~" --color=auto'
alias grep="$GREP"
alias grepr="$GREP $IGNORES -r"
