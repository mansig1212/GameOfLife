class Grid
  X_AXIS_LENGTH = 50
  Y_AXIS_LENGTH = 50

  attr_accessor :xaxis_length, :yaxis_length, :cells
  
  def initialize
    @xaxis_length = X_AXIS_LENGTH
    @yaxis_length = Y_AXIS_LENGTH
    @cells = []
  end

  def generate_cells
    live_cells = rand(15..30)
    0.upto(xaxis_length-1) do |x|
      0.upto(yaxis_length-1) do |y|
        if x.between?(5, 45) and y.between?(5, 45)
          status = rand(0..1)
          state = (status == 1 and live_cells > 0) ? Cell::LIVE_STATE : Cell::DEAD_STATE
          cells << Cell.new(x,y,state)
          live_cells -= 1 if status == 1
        else
          cells << Cell.new(x,y,Cell::DEAD_STATE)
        end        
      end
    end
  end
  
  def next_generation
    cells.each do |c|      
      live_neighbours = c.live_neighbours(self.cells)
      if c.live?
        c.dead! if (live_neighbours.length < 2 or live_neighbours.length > 3)
      elsif c.dead?
        c.live! if live_neighbours.length == 3
      end
    end
    self
  end

  def self.object_from_hash(grid_hash)
    g = Grid.new
    g.xaxis_length = grid_hash['xaxis_length']
    g.yaxis_length = grid_hash['yaxis_length']
    grid_hash['cells'].each do |c|
      g.cells << Cell.new(c['x'], c['y'], c['state'])
    end
    g
  end
end
