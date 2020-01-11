#!/bin/ruby

def nextMove(n,r,c,grid)
  princessCoordinates = Hash.new
  botCoordinates = {x: c, y: r}
  move = ""

  grid.each_with_index do |el, i| #find player coordinates

    foundP = el.split(//).find_index("p")
    if foundP #found princess
      princessCoordinates[:x] = el.split(//).find_index("p")
      princessCoordinates[:y] = i
      break
    end

  end #grid.each_with_index

  if !princessCoordinates.empty? && !botCoordinates.empty? #if one is empty then no 'm' or 'p' found in grid, therefore no move

    if princessCoordinates != botCoordinates #if hashes are not the same then 'm' has not found 'p'

      ycoordDistance = princessCoordinates[:y] <=> botCoordinates[:y] #check difference in y coordinates
      xcoordDistance = princessCoordinates[:x] <=> botCoordinates[:x] #check difference in x coordinates

      if ycoordDistance != 0
        botCoordinates[:y] = botCoordinates[:y] + ycoordDistance
        move = ycoordDistance.negative? ? "UP" : "DOWN"
      elsif xcoordDistance != 0
        botCoordinates[:x] = botCoordinates[:x] + xcoordDistance
        move = xcoordDistance.negative? ? "LEFT" : "RIGHT"
      end

    end #if princessCoordinates != botCoordinates

  end #if coordinate hashes not empty?

  print move
end

n = gets.to_i

r,c = gets.strip.split.map {|num| num.to_i}

grid = Array.new(n)

(0...n).each do |i|
    grid[i] = gets
end

nextMove(n,r,c,grid)
