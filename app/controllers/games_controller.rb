require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @array = []
    @array << ("A".."Z").to_a.sample until @array.size == 10
    @array
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = URI.open(url).read
    @word = JSON.parse(word_serialized)
    @array
    if @word["found"]
      @message = "Congratulations! #{@word["word"].upcase} is a valid English word!"
    else
      @message = "Nothing"
    end
    raise
  end
end

#<ActionController::Parameters {"authenticity_token"=>"lpkIKx5Jn-StoVaBw23q3rGsl9Ue4SS-f64H66-rjVxNjF7maHypdSipK0En6FdZyRhn2RR9cV4Q0IZi8JmieA", "word"=>"Game", "controller"=>"games", "action"=>"score"} permitted: false>