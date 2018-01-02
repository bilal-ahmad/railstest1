require 'spec_helper'

describe 'Projects' do

  describe 'GET /v1/projects' do
    describe 'should return project list' do
      before do
        @client = FactoryBot.create(:client)
        @project = FactoryBot.create(:project, client: @client)
        get '/api/v1/projects'
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'GET /v1/projects/:id' do
    describe 'should return project details' do
      before do
        @client = FactoryBot.create(:client)
        @project = FactoryBot.create(:project, client: @client)
        get "/api/v1/projects/#{@project.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'POST /v1/projects' do
    describe 'should save parameters' do
      before do
        post '/api/v1/projects'
      end

      it 'returns 201 success status' do
        expect(response.response_code).to eq 201
      end
    end
  end

  describe 'PUT /v1/projects/:id' do
    describe 'should save parameters' do
      before do
        @client = FactoryBot.create(:client)
        @project = FactoryBot.create(:project, client: @client)
        put "/api/v1/projects/#{@project.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'DELETE /v1/projects/:id' do
    describe 'should delete project' do
      before(:each) do
        @client = FactoryBot.create(:client)
        @project = FactoryBot.create(:project, client: @client)
        delete "/api/v1/projects/#{@project.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end
end
