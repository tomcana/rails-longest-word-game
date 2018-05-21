require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @word = params[:word]
    @letters = params[:token]
    @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }
  end


  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end

end
