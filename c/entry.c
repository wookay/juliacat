#include <stdio.h>

//  clang -dynamiclib -std=gnu99 entry.c -o libentry.A.dylib

// julia> ccall((:entry, "libentry.A"), Int32, (Int32, Ptr{Ptr{Uint8}}), 3, ["a","b","c"])
// entry 0 a
// entry 1 b
// entry 2 c
// 1

int entry(int argc, char *argv[])
{
    for (int idx =0; idx < argc; idx++) {
      printf("entry %d %s\n", idx, argv[idx]);
    }
    fflush(stdout);
    return 1;
}
