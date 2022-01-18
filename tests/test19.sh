for a in 1 2 3 4 5
do
  echo "$a"
  interne=1

  for b in 1 2 3 4 5
  do
    echo " lol $interne"
    let "interne+=1"
  done

  let "externe+=1" 
  echo
done              

exit 0
