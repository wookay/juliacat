build:
	gcc -o test -I$(JULIA_DIR)/include/julia -L$(JULIA_DIR)/lib/julia -ljulia test.c

r:
	DYLD_LIBRARY_PATH=$(JULIA_PATH)/usr/lib ./test

c:
	rm test
