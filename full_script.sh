

./create_octo.sh $1
./octo_merge.sh $1

git merge master "($ < branch_list.txt)"
cat branch_list.txt | xargs -0 git merge master {}
./clean_octo.sh $1