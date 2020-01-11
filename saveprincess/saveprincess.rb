#!/bin/ruby
def displayPathtoPrincess(n,grid)
    princessCoordinates = Hash.new
    botCoordinates = Hash.new
    moves = ""

    grid.each_with_index do |el, i| #find player coordinates
        foundP = el.split(//).find_index("p")
        foundM = el.split(//).find_index("m")

        if foundP #found princess
          princessCoordinates = {
            x: el.split(//).find_index("p"),
            y: i
          }
        elsif foundM #found bot
          botCoordinates = {
            x: el.split(//).find_index("m"),
            y: i
          }
        end

    end #grid.each_with_index

    if !princessCoordinates.empty? && !botCoordinates.empty? #if empty then no 'm' or 'p' found in grid, therefore no moves

        while princessCoordinates != botCoordinates do #if hashes are not the same then 'm' has not found 'p'

            ycoordDistance = princessCoordinates[:y] <=> botCoordinates[:y] #check difference in y coordinates
            if ycoordDistance != 0
                botCoordinates[:y] = botCoordinates[:y] + ycoordDistance
                moves += ycoordDistance.negative? ? "UP\n" : "DOWN\n"
            end

            xcoordDistance = princessCoordinates[:x] <=> botCoordinates[:x] #check difference in x coordinates
            if xcoordDistance != 0
                botCoordinates[:x] = botCoordinates[:x] + xcoordDistance
                moves += xcoordDistance.negative? ? "LEFT\n" : "RIGHT\n"
            end

        end #while princessCoordinates != botCoordinates

    else
      print "no princess and/or bot found..."
    end #if coordinate hashes not empty?

    print moves
end #displayPathtoPrincess


m = gets.to_i

grid = Array.new(m)

(0...m).each do |i|
    grid[i] = gets.strip
end

displayPathtoPrincess(m,grid)
