#!/bin/sh

#Script based on the "fexec" function of ARCO Lab http://arco.inf-cr.uclm.es

COMPILER=rake1.9
ICON="gtk-yes"

while [ 1 ]; do
    $COMPILER
    retval=$?

    echo DONE:$retval

    if [ $retval -eq 0 ]; then
	ICON="gtk-yes"
    else
	ICON="gtk-no"
    fi

    notify-send -t 1000 -i $ICON "OKANE returned: $retval"

    inotifywait -qr -e MODIFY . || break
    
    sync
    sleep 0.5
done
