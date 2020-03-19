mkdir -p /tmp/EECS3311/lab5
ec -c_compile -finalize -project_path /tmp/EECS3311/lab5 -config chess/chess.ecf

cd ./chess/regression-testing/
bash ./regression_test_finalize_test.bash
cd ../../
