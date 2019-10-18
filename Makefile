CC=gcc-9
PROG = gauss_seidel_test

CFLAGS = -Wall -Wextra -Wpedantic -ggdb -O0
LDLIBS = -lgfortran `pkg-config --libs lapack`

default: bin/$(PROG)

bin/$(PROG): bin/$(PROG).o bin/gauss_seidel.o
	$(CC) $(CFLAGS) $^ $(LDLIBS) -o $@

bin/$(PROG).o: src/$(PROG).f
	$(CC) $(CFLAGS) -o $@ -c $<

bin/gauss_seidel.o: src/gauss_seidel.f
	$(CC) $(CFLAGS) -o $@ -c $<

clean:
	rm -fv bin/*.o bin/$(PROG)
