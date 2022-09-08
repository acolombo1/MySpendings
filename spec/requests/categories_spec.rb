require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    it 'Categories index: returns http status: redirection (302)' do
      get '/categories'
      expect(response).to have_http_status(302)
    end
  end
end
