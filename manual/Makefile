build:
	gcc -o test -I$(JULIA_PREFIX)/include/julia -L$(JULIA_PREFIX)/lib/julia -ljulia test.c

r:
	DYLD_LIBRARY_PATH=$(JULIA_PATH)/usr/lib ./test

c:
	rm -f test
