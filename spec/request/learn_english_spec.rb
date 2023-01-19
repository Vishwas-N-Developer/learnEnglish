require 'rails_helper'

RSpec.describe 'Learn_english', type: :request do
  describe 'Learn_english /learn' do
    context 'with right english words' do
      before do
        post '/api/v1/learn', params:{ text:"Do you like cats and dogs?"}
      end

      it 'returns true to learner' do
        expect(json['learner']).to eq(true)
      end

      it 'returns a successful code' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'With wrong english words' do
      before do
        post '/api/v1/learn', params:{ text:"Do you likee cats adn dogs?" }
      end

      it 'returns non_english_words' do
        expect(json['non_english_words']).to eq(["likee", "adn"])
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(201)
      end
    end
  end
end