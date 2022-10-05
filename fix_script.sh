for i in $(eval echo "{0..$1}")
do
    let "a = 2000 - $i";
    let "b = 1999 - $i";
    eval "git merge -s octopus octo_branch_$a octo_branch_$b";
done

git push