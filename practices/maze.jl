# https://github.com/joewing/maze

@enum Cell Space Wall

type Maze
  data::Matrix{Cell}
  Maze(width, height) = init(new(Array{Cell}(height, width)))
end

function init(maze::Maze)
  fill!(maze.data, Wall)
  rows, cols = size(maze.data)
  for i=1:rows
    maze.data[i,1] = Space
    maze.data[i,cols] = Space
  end
  for j=1:cols
    maze.data[1,j] = Space
    maze.data[rows,j] = Space
  end
  maze.data[3,3] = Space
  carve(maze, 3, 3)
  maze.data[2,3] = Space
  maze.data[rows-1,cols-2] = Space
  maze
end

function carve(maze::Maze, x::Int, y::Int)
  upx = [1 -1 0 0]
  upy = [0 0 1 -1]
  dir = rand(0:3)
  count = 0
  while count < 4
    x1 = x + upx[dir+1]
    y1 = y + upy[dir+1]
    x2 = x1 + upx[dir+1]
    y2 = y1 + upy[dir+1]
    if is(maze.data[x1,y1], Wall) && is(maze.data[x2,y2], Wall)
      maze.data[x1,y1] = Space
      maze.data[x2,y2] = Space
      carve(maze, x2, y2)
    else
      dir = (dir + 1) % 4
      count += 1
    end
  end
end

function Base.show(io::IO, maze::Maze)
  rows, cols = size(maze.data)
  for i=1:rows
    for j=1:cols
      print(io, is(maze.data[i,j], Space) ? "  " : "[]")
    end
    println(io)
  end
end

print(Maze(39, 23))
