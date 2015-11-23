System Image Building
* http://docs.julialang.org/en/latest/devdocs/sysimg/

* Makefile

```
λ ~/head/julia master make
    CC src/jltypes.o
    CC src/gf.o
    CC src/ast.o
    CC src/builtins.o
    CC src/module.o
    CC src/interpreter.o
    CC src/alloc.o
    CC src/dlload.o
    CC src/sys.o
    CC src/init.o
    CC src/task.o
    CC src/array.o
    CC src/dump.o
    CC src/toplevel.o
    CC src/jl_uv.o
    CC src/jlapi.o
    CC src/signal-handling.o
    CC src/simplevector.o
    CC src/APInt-C.o
    CC src/runtime_intrinsics.o
    CC src/runtime_ccall.o
    CC src/threadgroup.o
    CC src/threading.o
    CC src/gc.o
    CC src/codegen.o
    CC src/disasm.o
    CC src/debuginfo.o
    CC src/llvm-simdloop.o
    LINK usr/lib/libjulia.dylib
    PERL base/version_git.jl.phony
    JULIA usr/lib/julia/inference0.ji
essentials.jl
reflection.jl
options.jl
promotion.jl
tuple.jl
range.jl
expr.jl
error.jl
bool.jl
number.jl
int.jl
operators.jl
pointer.jl
abstractarray.jl
array.jl
hashing.jl
nofloat_hashing.jl
functors.jl
reduce.jl
intset.jl
dict.jl
iterator.jl
inference.jl
    JULIA usr/lib/julia/inference.ji
essentials.jl
reflection.jl
options.jl
promotion.jl
tuple.jl
range.jl
expr.jl
error.jl
bool.jl
number.jl
int.jl
operators.jl
pointer.jl
abstractarray.jl
array.jl
hashing.jl
nofloat_hashing.jl
functors.jl
reduce.jl
intset.jl
dict.jl
iterator.jl
inference.jl
    JULIA usr/lib/julia/sys.o
exports.jl
essentials.jl
docs/bootstrap.jl
base.jl
reflection.jl
options.jl
promotion.jl
tuple.jl
range.jl
expr.jl
error.jl
bool.jl
number.jl
int.jl
operators.jl
pointer.jl
refpointer.jl
functors.jl
abstractarray.jl
subarray.jl
array.jl
hashing.jl
rounding.jl
float.jl
complex.jl
rational.jl
abstractarraymath.jl
arraymath.jl
simdloop.jl
reduce.jl
bitarray.jl
intset.jl
dict.jl
set.jl
iterator.jl
build_h.jl
version_git.jl
c.jl
osutils.jl
char.jl
ascii.jl
iobuffer.jl
string.jl
strings/types.jl
strings/basic.jl
strings/search.jl
strings/util.jl
strings/io.jl
unicode.jl
unicode/UnicodeError.jl
unicode/types.jl
unicode/checkstring.jl
unicode/utf8.jl
unicode/utf16.jl
unicode/utf32.jl
unicode/utf8proc.jl
parse.jl
shell.jl
regex.jl
pcre.jl
base64.jl
io.jl
iostream.jl
libc.jl
libdl.jl
env.jl
intfuncs.jl
nullable.jl
task.jl
lock.jl
show.jl
stream.jl
uv_constants.jl
socket.jl
filesystem.jl
process.jl
multimedia.jl
grisu.jl
methodshow.jl
floatfuncs.jl
math.jl
float16.jl
cartesian.jl
multidimensional.jl
primes.jl
reducedim.jl
ordering.jl
collections.jl
sort.jl
version.jl
gmp.jl
mpfr.jl
combinatorics.jl
hashing2.jl
dSFMT.jl
random.jl
printf.jl
meta.jl
Enums.jl
serialize.jl
channels.jl
multi.jl
managers.jl
loading.jl
mmap.jl
sharedarray.jl
datafmt.jl
deepcopy.jl
interactiveutil.jl
replutil.jl
test.jl
i18n.jl
Terminals.jl
LineEdit.jl
REPLCompletions.jl
REPL.jl
client.jl
util.jl
linalg.jl
broadcast.jl
statistics.jl
irrationals.jl
dft.jl
dsp.jl
sysinfo.jl
quadgk.jl
fastmath.jl
libgit2.jl
pkg.jl
profile.jl
Dates.jl
sparse.jl
markdown/Markdown.jl
docs/Docs.jl
deprecated.jl
require.jl
docs/helpdb.jl
docs/basedocs.jl
threads.jl
base/precompile.jl
    LINK usr/lib/julia/sys.dylib
ld: warning: object file (usr/lib/julia/sys.o) was built for newer OSX version (15.0) than being linked (10.7)
```
