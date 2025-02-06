default:main.c
	gcc -o main main.c -L ./ -I ./ -lsoftfloat
tree:tree.c
	gcc -o tree tree.c -L ./ -I ./ -lsoftfloat
cp_tree:
	cp array_a.txt array_b.txt result_c.txt ../../../../Simulation/case_ut/pe_tree_sim/
comp:compare.c
	gcc -o comp compare.c -L ./ -I ./ -lsoftfloat
max:max.c
	gcc -o max max.c -L ./ -I ./ -lsoftfloat
test:test.c
	gcc -o test test.c -L ./ -I ./ -lsoftfloat

max_vec:
	#rm max_vec
	#gcc -o max_vec max_vec.c -L ./ -I ./ -lsoftfloat
	./max_vec 100 7
	cp a.txt c.txt ../../../../Simulation/case_sub_sys/non_linear_sim

systolic:systolic_array.c
	gcc -o systolic_array systolic_array.c -L ./ -I ./ -lsoftfloat


