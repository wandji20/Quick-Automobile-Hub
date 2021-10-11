require 'rails_helper'

RSpec.describe 'Sales', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/sales/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/sales/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/sales/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/sales/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
