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
        @status = true
      else
        @status = "meh"
      end
    else
      @status = false
    end
  end
  
  def checkword(word)
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    word_serialized = URI.open(url).read
    JSON.parse(word_serialized)
  end
end
