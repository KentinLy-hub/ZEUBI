# true, false

if [ true ]; then
    echo success
else
    echo test1 failed
fi
if [ false ]; then
    echo success
else
    echo test2 failed
fi



# simple conditions

if [ 1 -eq 1 ]; then
    echo success
else
    echo test3 failed
fi
if [ 1 -gt 1 ]; then
    echo test4 failed
else
    echo success
fi



# exclamation conditions

if [ ! 1 -eq 1 ]; then
    echo test5 failed
else
    echo success
fi
if [ ! 1 -gt 1 ]; then
    echo success;
else
    echo test6 failed
fi



# many spaces

if [      1             -eq          1          ]; then
    echo success
else
    echo test7 failed
fi



# void

if [          ]; then
    echo test8 failed
else
    echo success
fi

if [ ]; then
    echo test8 failed
else
    echo success
fi
