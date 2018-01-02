require 'spec_helper'
require 'rails_helper'

describe 'Clients' do
  include Rack::Test::Methods

  def app
    API
  end

  describe 'GET /v1/clients' do
    describe 'should return client list' do
      before do
        @client = FactoryBot.create(:client)
        get '/v1/clients'
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'GET /v1/clients/:id' do
    describe 'should return client details' do
      before do
        @client = FactoryBot.create(:client)
        get "/v1/clients/#{@client.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'POST /v1/clients' do
    describe 'should save parameters' do
      before do
        post '/v1/clients'
      end

      it 'returns 201 success status' do
        expect(response.response_code).to eq 201
      end
    end
  end

  describe 'PUT /v1/clients/:id' do
    describe 'should save parameters' do
      before do
        @client = FactoryBot.create(:client)
        put "/v1/clients/#{@client.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'DELETE /v1/clients/:id' do
    describe 'should delete client' do
      before(:each) do
        @client = FactoryBot.create(:client)
        delete "/v1/clients/#{@client.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end
end
