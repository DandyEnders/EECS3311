mkdir -p /tmp/EECS3311/lab5
ec -c_compile -project_path /tmp/EECS3311/lab5 -config chess/chess.ecf

cd ./chess/regression-testing/
bash ./regression_test.bash
cd ../../
