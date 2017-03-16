#!/bin/sh

die(){
    echo "[err] $@"
    exit 1
}

if [ $# -eq 0 ]; then
    FILES=`ls dot*`
else
    FILES="$@"
fi

for fff in ${FILES}
do
    [ -f ${fff} ] || die "${fff} isn't found"

    target=`echo ${fff} | sed s/dot_/\./`
    echo ln -s $(pwd)/${fff} ${HOME}/${target}
    ln -s $(pwd)/${fff} ${HOME}/${target}
done
