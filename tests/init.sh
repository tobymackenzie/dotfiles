#!/usr/bin/env bash
#--setup
exit=0
echo "running init.sh test"
testPath=$(dirname $(realpath ${BASH_SOURCE[0]}))
cd $testPath
mkdir -p $testPath/tmp

#--run
TJMDOTHOME="${testPath}/tmp" TJMTESTINIT=1 bash ${testPath}/../src/init.sh

#--verify
expect=$(git diff --no-index $testPath/init.expect <(find tmp -print | sort))
if [ $? -eq 0 ]; then
	echo "Success initing"
else
	>&2 echo "Failures initing, see diff:${expect}"
	exit=1
fi

#--cleanup
rm -rf $testPath/tmp
exit $exit
