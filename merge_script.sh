#input: branches, filename, commits_per_branch

#make test file
touch $2
cp /dev/null $2
for i in $(eval echo "{1..$1}")
do
    echo "This is line $i _" >> $2;
    echo -e "\n" >> $2;
done

#make branches with commits
git add $2 &> /dev/null
echo "Making $2";
git commit -m "Added $2 with $1 lines" &> /dev/null
echo "Added $2 with $1 lines";
echo "making branches";

for i in $(eval echo "{1..$1}")
do
    git checkout -b octo_branch_$i &> /dev/null;
    printf "branch %09d\n" $i;
    for j in {1..$3}
    do
        sed -n -i -e "s/line $i _/line $i _ $RANDOM/g" $2;
        git add $2 &> /dev/null;
        git commit -m "Commit $j for branch $i" &> /dev/null;
    done
    git checkout master &> /dev/null;
done

#make merge command
echo -n "git merge -s octopus master" >> merge_command.sh
for i in $(eval echo "{1..$1}")
do
    echo -n " octo_branch_$i" >> merge_command.sh;
done

#execute merge command
./merge_command.sh

#remove temp  file
rm $2