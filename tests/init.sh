#!/usr/bin/env bash
#--setup
exit=0
echo "running init.sh test"
testPath=$(dirname $(realpath ${BASH_SOURCE[0]}))
cd $testPath
mkdir -p $testPath/tmp

#--run
TJM_DOTFILES_HOME="${testPath}/tmp" bash ${testPath}/../src/init.sh

#--verify
expect=$(diff $testPath/init.expect <(ls -1AR tmp))
if [ $? -eq 0 ]; then
	echo "Success initing"
else
	>&2 echo "Failures initing, see diff:${expect}"
	exit=1
fi

#--cleanup
rm -rf $testPath/tmp
exit $exit
