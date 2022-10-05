

./create_octo.sh $1
./octo_merge.sh $1

git merge master "($ < branch_list.txt)"
./clean_octo.sh $1