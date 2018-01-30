class Cell
  
  attr_accessor :x, :y, :state
  NEIGHBOURS = [{'x' => 0, 'y' => 1},
                {'x' => 0, 'y' => -1},
                {'x' => 1, 'y' => 0},
                {'x' => -1, 'y' => 0},
                {'x' => 1, 'y' => 1},
                {'x' => 1, 'y' => -1},
                {'x' => -1, 'y' => 1},
                {'x' => -1, 'y' => -1},
               ]
  LIVE_STATE = 'l'
  DEAD_STATE = 'd'
  
  def initialize(x,y,state)
    @x = x
    @y = y
    @state = state
  end

  def live?
    self.state == LIVE_STATE
  end

  def  live!
    self.state = LIVE_STATE
  end

  def dead?
    self.state == DEAD_STATE
  end

  def  dead!
    self.state = DEAD_STATE
  end

  def neighbours(grid_cells)
    neighbours = []
    NEIGHBOURS.each do |n|
      xpoint = self.x + n['x']
      ypoint = self.y + n['y']
      neighbours << grid_cells.detect{|c| (c.x == xpoint and c.y == ypoint)}
    end
    neighbours.compact
  end

  def live_neighbours(grid_cells)
    neighbours(grid_cells).select{|x| x.live?}
  end
end
