require 'spec_helper'
describe API do
  describe 'Clients' do
    describe 'GET /v1/clients' do
      describe 'should return client list' do
        before do
          @client = FactoryBot.create(:client)
          get '/api/v1/clients'
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
          get "/api/v1/clients/#{@client.id}"
        end

        it 'returns 200 success status' do
          expect(response.response_code).to eq 200
        end
      end
    end

    describe 'POST /v1/clients' do
      describe 'should save parameters' do
        before do
          post '/api/v1/clients'
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
          put "/api/v1/clients/#{@client.id}"
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
          delete "/api/v1/clients/#{@client.id}"
        end

        it 'returns 200 success status' do
          expect(response.response_code).to eq 200
        end
      end
    end
  end
end

