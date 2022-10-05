

./create_octo.sh $1
./octo_merge.sh $1


echo -n "git merge master" >> merge_command.sh
for i in $(eval echo "{1..$1}")
do
    echo -n " octo_branch_$i" >> merge_command.sh
done

./clean_octo.sh $1