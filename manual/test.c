#include <julia.h>

int main(int argc, char *argv[])
{
    /* required: setup the julia context */
    //jl_init(JULIA_INIT_DIR);
    jl_init_with_image(getenv("JULIA_LIB_DIR"), "sys.ji");

    /* run julia commands */
    jl_eval_string("println(pi)");

    /* strongly recommended: notify julia that the
         program is about to terminate. this allows
         julia time to cleanup pending write requests
         and run all finalizers
    */
    jl_atexit_hook();
    return 0;
}
