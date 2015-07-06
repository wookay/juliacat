juliacat
========

Julia practices

Linux, OSX: [![Build Status](https://api.travis-ci.org/wookay/juliacat.svg?branch=master)](https://travis-ci.org/wookay/juliacat)
Windows: [![Build status](https://ci.appveyor.com/api/projects/status/lgd95jb11om4u3sq?svg=true)](https://ci.appveyor.com/project/wookay/juliacat)

    $ julia --color=yes TestCases/runtests.jl
    Started
    ................................................................................................................................................................................................
    Finished in 8.9208 seconds.
    53 tests, 201 assertions, 0 failures, 0 errors

    $ julia --color=yes TestCases/test_cxx.jl
    loading Cxx elapsed in 2.395767964 seconds.
    Started
    ....
    Finished in 2.8421 seconds.
    2 tests, 4 assertions, 0 failures, 0 errors
