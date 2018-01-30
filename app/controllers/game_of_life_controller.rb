class GameOfLifeController < ApplicationController
  def show
    if request.get?
      @grid = Grid.new
      @grid.generate_cells
      current_user = rand(1000)
      session[:current_user] = current_user
      puts "GET || Key:#{session[:current_user]}"
      $redis.set("Key:#{current_user}", @grid.to_json)
    elsif request.post?
      puts "POST || Key:#{session[:current_user]}"
      current_object = Grid.object_from_hash(JSON.parse($redis.get("Key:#{session[:current_user]}")))
      @grid = current_object.next_generation
      $redis.set("Key:#{session[:current_user]}", @grid.to_json)
    end
  end
end
