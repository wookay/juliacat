# test_banner.jl
#                           wookay.noh at gmail.com

include("../juliacat/UnitTest.jl")

if VERSION.minor > 3 @eval begin

function test_banner()
  buf = IOBuffer()
  Base.banner(buf)

  b = takebuf_string(buf)
  days = Int(floor((ccall(:clock_now, Float64, ()) - Base.GIT_VERSION_INFO.fork_master_timestamp) / (60 * 60 * 24)))
  unit = days == 1 ? "day" : "days"
  commit_date = " ($(Base.GIT_VERSION_INFO.date_string))"
  distance = Base.GIT_VERSION_INFO.fork_master_distance
  commit = Base.GIT_VERSION_INFO.commit_short
  if distance == 0
    commit_string = "Commit $(commit) ($(days) $(unit) old master)"
  else
    branch = Base.GIT_VERSION_INFO.branch
    commit_string = "$(branch)/$(commit) (fork: $(distance) commits, $(days) $(unit))"
  end
  if Base.have_color
    tx = "\033[0m\033[1m" # text
    jl = "\033[0m\033[1m" # julia
    d1 = "\033[34m" # first dot
    d2 = "\033[31m" # second dot
    d3 = "\033[32m" # third dot
    d4 = "\033[35m" # fourth dot

    assert_equal("""\033[1m               $(d3)_$(tx)
           $(d1)_$(tx)       $(jl)_$(tx) $(d2)_$(d3)(_)$(d4)_$(tx)     |  A fresh approach to technical computing
          $(d1)(_)$(jl)     | $(d2)(_)$(tx) $(d4)(_)$(tx)    |  Documentation: http://docs.julialang.org
           $(jl)_ _   _| |_  __ _$(tx)   |  Type \"?help\" for help.
          $(jl)| | | | | | |/ _` |$(tx)  |
          $(jl)| | |_| | | | (_| |$(tx)  |  Version $(VERSION)$(commit_date)
         $(jl)_/ |\\__'_|_|_|\\__'_|$(tx)  |  $(commit_string)
        $(jl)|__/$(tx)                   |  $(Sys.MACHINE)

        \033[0m""", b)
  else
    assert_equal("""
                       _
           _       _ _(_)_     |  A fresh approach to technical computing
          (_)     | (_) (_)    |  Documentation: http://docs.julialang.org
           _ _   _| |_  __ _   |  Type "help()" for help.
          | | | | | | |/ _` |  |
          | | |_| | | | (_| |  |  Version $(VERSION)$(commit_date)
         _/ |\\__'_|_|_|\\__'_|  |  $(commit_string)
        |__/                   |  $(Sys.MACHINE)

        """, b)
  end

  close(buf)  
end

end end 


if is_main()
  UnitTest.run()
end
