
echo -n "git merge -s octopus master" >> merge_command.sh
for i in $(eval echo "{1..$1}")
do
    echo -n " octo_branch_$i" >> merge_command.sh;
done