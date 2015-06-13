# half_pyramid.jl
#                           wookay.noh at gmail.com

type Star
  data::Array
end

function Base.show(io::IO, s::Star)
  row, col = size(s.data)
  for m in 1:row
    for n in 1:col
      print(io, s.data[m,n])
    end
    m < row && println(io)
  end
end

==(a::Star, b::Star) = ==(a.data, b.data)

function star(a::Array)
  Star(map(x->x==1?"*":" ", a))
end

using Base.Test
@test Star(["*" " "]) == star([1 0])
@test Star(["*" " "; " " "*"]) == star([1 0; 0 1])

buf = IOBuffer()

tri = Array(LowerTriangular(ones(Int,5,5)))

show(buf, star(tri))
println(buf)
@test """\
*    
**   
***  
**** 
*****
""" == takebuf_string(buf)

show(buf, star(rotl90(tri)))
println(buf)
@test """\
    *
   **
  ***
 ****
*****
""" == takebuf_string(buf)

show(buf, star(rotr90(tri)))
println(buf)
@test """\
*****
**** 
***  
**   
*    
""" == takebuf_string(buf)

close(buf)
