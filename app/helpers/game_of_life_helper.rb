module GameOfLifeHelper
  def print_cell_status(status)
    if status == Cell::LIVE_STATE
      '*'
    elsif status == Cell::DEAD_STATE
      '.'
    end
  end
end
