#!/bin/bash

# script that creates 1 file, with 8 lines
# commits that file, then creates a branch
# that branch changes 1 line, and commits - 3x in a row
# then do the same with a different line, on a different branch

./make_octo_txt.sh $1

# Now add and commit this file
git add octo_test.txt
git commit -m "Added the octo file with $1 lines"

# Now use a double for loop to create 8 branches and make multiple commits in each branch
# Create the 'head' branch - the branch all others are created from
echo "making branches";
for i in $(eval echo "{1..$1}")
do
    git checkout -b octo_branch_$i &> /dev/null;
    printf "branch %09d\n" $i;
    for j in {1..3}
    do
        sed -n -i -e "s/line $i _/line $i _ $RANDOM/g" octo_test.txt;
        git add octo_test.txt &> /dev/null;
        git commit -m "Commit $j for branch $i" &> /dev/null;
    done
    # Since we want all 8 branches based off same branch, checkout master.
    git checkout master &> /dev/null;
done

# At this point, branch 8 should be checkout out
# 8 branches created, with 5 commits each
# print the log graph to see what's going on
#git log --oneline --graph --decorate=short -n 20
