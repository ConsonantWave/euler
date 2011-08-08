class Problem15 < Problem
  def self.title
    "Starting in the top left corner in a 20 by 20 grid, how many routes are there to the bottom right corner?"
  end
  
  GRID_X = 20
  GRID_Y = 20
  
  def self.solve
    coords_sum = GRID_X + GRID_Y - 1
    routes = { [GRID_X, GRID_Y] => 1 }
    until coords_sum < 0
      curr_x = GRID_X < coords_sum ? GRID_X : coords_sum
      curr_y = coords_sum - curr_x
      
      until curr_y == (GRID_Y < coords_sum ? GRID_Y : coords_sum) + 1
        routes[[curr_x, curr_y]] = 0
        if curr_x < GRID_X
          routes[[curr_x, curr_y]] += routes[[curr_x + 1, curr_y]]
        end
        if curr_y < GRID_Y 
          routes[[curr_x, curr_y]] += routes[[curr_x, curr_y + 1]]
        end
        curr_x -= 1
        curr_y += 1
      end
      coords_sum -= 1
    end
    
    return routes[[0,0]]
  end
end
