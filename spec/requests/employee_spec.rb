require 'rails_helper'

describe 'Employees' do
  before(:all) do
    @client = FactoryBot.create(:client)
    @project = FactoryBot.create(:project, client: @client)
  end
  describe 'GET /v1/employees' do
    describe 'should return employee list' do
      before do
        @employee = FactoryBot.create(:employee, project: @project)
        get '/api/v1/employees'
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'GET /v1/employees/:id' do
    describe 'should return employee details' do
      before do
        @employee = FactoryBot.create(:employee, project: @project)
        get "/api/v1/employees/#{@employee.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'POST /v1/employees' do
    describe 'should save parameters' do
      before do
        post '/api/v1/employees'
      end

      it 'returns 201 success status' do
        expect(response.response_code).to eq 201
      end
    end
  end

  describe 'PUT /v1/employees/:id' do
    describe 'should save parameters' do
      before do
        @employee = FactoryBot.create(:employee, project: @project)
        put "/api/v1/employees/#{@employee.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'DELETE /v1/employees/:id' do
    describe 'should delete employee' do
      before(:each) do
        @employee = FactoryBot.create(:employee, project: @project)
        delete "/api/v1/employees/#{@employee.id}"
      end

      it 'returns 200 success status' do
        expect(response.response_code).to eq 200
      end
    end
  end

  describe 'POST /v1/employees/projects/project_id' do
    describe 'should save parameters' do
      before(:each) do
        post "/api/v1/employees/projects/#{@project.id}"
      end

      it 'returns 201 success status' do
        expect(response.response_code).to eq 201
      end
    end
  end
end
