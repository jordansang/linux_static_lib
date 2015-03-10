.PHONY: build test clean

build: libmylib.a

libmylib.a: my_math.o my_print.o
				ar crv $@ my_math.o my_print.o
				
my_math.o: my_math.c
				gcc -c my_math.c
				
my_print.o: my_print.c
				gcc -c my_print.c
				
test: a.out

a.out: test.c
				gcc test.c -L. -lmylib
				
clean:
			rm -rf my_math.o my_print.o libmylib.a a.out