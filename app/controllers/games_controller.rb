require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @array = []
    @array << ("A".."Z").to_a.sample until @array.size == 10
    @array
  end

  def score
    @words_array = params[:word].upcase.split("")
    @grid = params[:letters].split
    @parsed = checkword(params[:word])
    if @words_array.all? { |letter| @grid.include? letter } && @words_array.tally.all? { |letter, count| count <= @grid.tally[letter] }
      if @parsed["found"]
        @message = "Congratulations! #{@parsed["word"].upcase} is a valid English word!"
      else
        @message = "Sorry but #{params[:word].upcase} does not seem to be a valid English word..."
      end
    else
      @message = "Sorry but #{params[:word].upcase} can't be built out of #{@grid}."
    end
  end
  
  def checkword(word)
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = URI.open(url).read
    JSON.parse(word_serialized)
  end
end

#<ActionController::Parameters {"authenticity_token"=>"lpkIKx5Jn-StoVaBw23q3rGsl9Ue4SS-f64H66-rjVxNjF7maHypdSipK0En6FdZyRhn2RR9cV4Q0IZi8JmieA", "word"=>"Game", "controller"=>"games", "action"=>"score"} permitted: false>