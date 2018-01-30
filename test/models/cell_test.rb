require 'test_helper'

class CellTest < ActiveSupport::TestCase
  test "cell is live" do
    c = Cell.new(0,0,Cell::LIVE_STATE)
    assert c.live?
  end

  test "cell is dead" do
    c = Cell.new(0,0,Cell::DEAD_STATE)
    assert c.dead?
  end

  test "change state of cell to live" do
    c = Cell.new(0,0,Cell::DEAD_STATE)
    c.live!
    assert c.live?
  end

  test "change state of cell to dead" do
    c = Cell.new(0,0,Cell::LIVE_STATE)
    c.dead!
    assert c.dead?
  end
  
  test "get neighbours of a cell" do
    c = Cell.new(3,3,Cell::LIVE_STATE)
    neighbours = [Cell.new(3,4,Cell::LIVE_STATE),
                  Cell.new(3,2,Cell::DEAD_STATE),
                  Cell.new(4,3,Cell::LIVE_STATE),
                  Cell.new(2,3,Cell::DEAD_STATE),
                  Cell.new(4,4,Cell::LIVE_STATE),
                  Cell.new(4,2,Cell::DEAD_STATE),
                  Cell.new(2,4,Cell::LIVE_STATE),
                  Cell.new(2,2,Cell::DEAD_STATE)
                 ]

    grid_cells = [Cell.new(0,0,Cell::LIVE_STATE),
                  Cell.new(0,1,Cell::DEAD_STATE),
                  Cell.new(1,0,Cell::LIVE_STATE),
                  Cell.new(2,0,Cell::DEAD_STATE),
                  Cell.new(0,2,Cell::LIVE_STATE),
                  Cell.new(4,0,Cell::DEAD_STATE),
                  Cell.new(0,4,Cell::LIVE_STATE),
                  Cell.new(5,5,Cell::DEAD_STATE),                  
                  Cell.new(3,4,Cell::LIVE_STATE),
                  Cell.new(3,2,Cell::DEAD_STATE),
                  Cell.new(4,3,Cell::LIVE_STATE),
                  Cell.new(2,3,Cell::DEAD_STATE),
                  Cell.new(4,4,Cell::LIVE_STATE),
                  Cell.new(4,2,Cell::DEAD_STATE),
                  Cell.new(2,4,Cell::LIVE_STATE),
                  Cell.new(2,2,Cell::DEAD_STATE)]
    assert_equal neighbours.length, c.neighbours(grid_cells).length
  end
  
  test "get live neighbours of a cell" do
    c = Cell.new(3,3,Cell::LIVE_STATE)
    live_neighbours = [Cell.new(3,4,Cell::LIVE_STATE),
                  Cell.new(4,3,Cell::LIVE_STATE),
                  Cell.new(4,4,Cell::LIVE_STATE),
                  Cell.new(2,4,Cell::LIVE_STATE),
                 ]

    grid_cells = [Cell.new(0,0,Cell::LIVE_STATE),
                  Cell.new(0,1,Cell::DEAD_STATE),
                  Cell.new(1,0,Cell::LIVE_STATE),
                  Cell.new(2,0,Cell::DEAD_STATE),
                  Cell.new(0,2,Cell::LIVE_STATE),
                  Cell.new(4,0,Cell::DEAD_STATE),
                  Cell.new(0,4,Cell::LIVE_STATE),
                  Cell.new(5,5,Cell::DEAD_STATE),                  
                  Cell.new(3,4,Cell::LIVE_STATE),
                  Cell.new(3,2,Cell::DEAD_STATE),
                  Cell.new(4,3,Cell::LIVE_STATE),
                  Cell.new(2,3,Cell::DEAD_STATE),
                  Cell.new(4,4,Cell::LIVE_STATE),
                  Cell.new(4,2,Cell::DEAD_STATE),
                  Cell.new(2,4,Cell::LIVE_STATE),
                  Cell.new(2,2,Cell::DEAD_STATE)]
    assert_equal live_neighbours.length, c.live_neighbours(grid_cells).length    
  end
end
