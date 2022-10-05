

./create_octo.sh $1
./octo_merge.sh $1


echo -n "git merge -s octopus master" >> merge_command.sh
for i in $(eval echo "{1..$1}")
do
    echo -n " octo_branch_$i" >> merge_command.sh
done
#./merge_command.sh
#./clean_octo.sh $1
#rm branch_list.txt
#rm merge_command.sh