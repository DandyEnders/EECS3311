if [ $1 = "eclean" ]
then
	bash run_eclean.bash
fi


mkdir -p /tmp/EECS3311/lab5
echo "Use /tmp/EECS3311/lab5 as compile directory."

cd ./chess
estudio chess.ecf &

cd ../
