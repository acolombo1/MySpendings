require 'rails_helper'

RSpec.describe 'Category', type: :request do
  describe 'GET /categories/1' do
    it 'Category: returns http status: redirection (302)' do
      get '/categories/1'
      expect(response).to have_http_status(302)
    end
  end
end
