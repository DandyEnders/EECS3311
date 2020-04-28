if [ $1 = "eclean" ]
then
        bash run_eclean.bash
fi


mkdir -p /tmp/EECS3311/interview
echo "Use /tmp/EECS3311/interview as compile directory."

cd ./interview
estudio interview.ecf &

cd ../

