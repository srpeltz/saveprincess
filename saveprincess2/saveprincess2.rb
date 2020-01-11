#!/bin/ruby
def nextMove(n,r,c,grid)
  princessCoordinates = Hash.new
  botCoordinates = {x: c, y: r}
  move = ""

  grid.each_with_index do |el, i| #find player coordinates

    foundP = el.split(//).find_index("p")
    if foundP #found princess
      princessCoordinates = {
        x: el.split(//).find_index("p"),
        y: i
      }
      break
    end

  end #grid.each_with_index

  if ((princessCoordinates != botCoordinates) && (!princessCoordinates.empty? && !botCoordinates.empty?)) #if hashes are not empty and not the same then 'm' has not found 'p'

    ycoordDistance = princessCoordinates[:y] <=> botCoordinates[:y] #check difference in y coordinates
    xcoordDistance = princessCoordinates[:x] <=> botCoordinates[:x] #check difference in x coordinates

    if ycoordDistance != 0
      botCoordinates[:y] = botCoordinates[:y] + ycoordDistance
      move = ycoordDistance.negative? ? "UP" : "DOWN"
    elsif xcoordDistance != 0
      botCoordinates[:x] = botCoordinates[:x] + xcoordDistance
      move = xcoordDistance.negative? ? "LEFT" : "RIGHT"
    end

  else
    print "no princess and/or bot found..."
  end #if coordinate hashes not empty and not equal

  print move
end #nextMove

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
