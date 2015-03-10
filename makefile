.PHONY: build test clean

all:build test

build: libmylib.a

libmylib.a: my_math.o my_print.o
				ar crv ./lib/libmylib.a ./src/my_math.o ./src/my_print.o
				rm -rf ./src/my_math.o ./src/my_print.o
				
my_math.o: 
				gcc -o ./src/my_math.o -c ./src/my_math.c
				
my_print.o: 
				gcc -o ./src/my_print.o -c ./src/my_print.c
				
test: a.out

a.out: 
				gcc -o ./bin/a  ./src/test.c -L./lib -lmylib -I.
				
clean:
			rm -rf ./src/my_math.o ./src/my_print.o ./lib/libmylib.a ./bin/a