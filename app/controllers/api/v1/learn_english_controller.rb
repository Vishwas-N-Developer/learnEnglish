require 'open-uri'
class Api::V1::LearnEnglishController < ApplicationController
  def learn
    text = (learner_params[:text]+" ").gsub!(/[^0-9A-Za-z]/, ' ').split
    res = checklearn(text)

    if res.empty?
      render json: {learner: true }, status: 200
    else
      render json:{non_english_words: res}, status: 201
    end
  end

  private

  def checklearn(text)
    unmatched_word = []
    content = URI.open("https://raw.githubusercontent.com/jeremy-rifkin/Wordlist/master/master.txt", "r")
    text.each do |word|
      next if File.foreach(content).find {|line| line =~ /\b#{word.capitalize}\b/ }
      unmatched_word << word
    end
    unmatched_word
  end

  def learner_params
    params.permit(:text)
  end
end
