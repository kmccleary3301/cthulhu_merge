./create_octo.sh $1
./make_git_command.sh $1
./merge_command.sh
rm merge_command.sh
./clean_octo.sh $1
rm octo_test.txt
