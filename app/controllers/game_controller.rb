require "longuest_word"

class GameController < ApplicationController
  def game
    @grid = generate_grid(12).join(" ")
    @start_time = Time.now

    if session[:count].nil?
      session[:count] = 1
    else
      session[:count] += 1
    end

  end

  def score
    @word = params[:word]
    @grid = params[:grid].split(" ")
    start_time = params[:start_time].to_time
    end_time = Time.now
    @result = run_game(@word, @grid, start_time, end_time)
    @count = session[:count]
  end
end
