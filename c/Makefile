entry:
	clang -dynamiclib -std=gnu99 entry.c -o libentry.A.dylib
	julia -e "ccall((:entry, \"libentry.A\"), Int32, (Int32, Ptr{Ptr{Uint8}}), 3, [\"a\",\"b\",\"c\"])"

embed:
	gcc -o embed -I$(JULIA_PREFIX)/include/julia -L$(JULIA_PREFIX)/lib/julia -ljulia embed.c
	DYLD_LIBRARY_PATH=$(JULIA_PATH)/usr/lib ./embed

clean:
	rm -f embed libentry.A.dylib
