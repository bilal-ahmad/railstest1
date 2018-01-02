module V1
  class Employees < Grape::API
    version 'v1', using: :path
    format :json
    content_type :json, 'application/json'

    resource :employees do
      # Get a list of employees
      #
      # Example Request:
      #   GET /v1/employees
      get do
        Employee.all
      end

      # Get a single employee
      #
      # Parameters:
      #   id (required) - The ID of a employee
      # Example Request:
      #   GET /v1/employees/:id
      params do
        requires :id
      end
      get ':id' do
        Employee.find(params[:id])
      end

      # Create a new employee
      #
      # Example Request:
      #   POST /v1/employees
      post do
        employee = Employee.new(params)
        if employee.save
          employee
        else
          employee.errors
        end
      end

      # Edit a employee
      #
      # Example Request:
      #   PUT /v1/employees/:id
      params do
        requires :id
      end
      put ':id' do
        employee = Employee.find(params[:id])
        if employee.update(params)
          employee
        else
          employee.errors
        end
      end

      # Delete a employee
      #
      # Example Request:
      #   DELETE /v1/employees/:id
      params do
        requires :id
      end
      delete ':id' do
        Employee.destroy(params[:id])
      end

      # Create a project in a given client
      #
      # Example Request:
      #  POST /v1/projects/:project_id
      desc 'Create an employee of a given project'
      params do
        requires :project_id, type: Integer
      end
      post "/projects/:project_id" do
        project = Project.where(id: params[:project_id]).first
        if project.present?
          project.employees.create(params[:employee])
        else
          project.errors
        end
      end

      # Get the projects pf a given project
      #
      # Example Request:
      #   GET /v1/project/project/:project_id
      desc 'Get the employees of a given project'
      params do
        requires :project_id, type: Integer
      end
      get "/projects/:project_id" do
        project = Project.where(id: params[:project_id]).first
        if project.present?
          project.employees
        else
          {"error": "Project not found."}
        end
      end

      # Delete a project from a given project
      #
      # Example Request:
      #   POST /v1/projects/:project_id/project/:project_id
      desc 'Delete an employee from project'
      params do
        requires :employee_id, type: Integer
        requires :project_id, type: Integer
      end
      delete "/:employee_id/projects/:project_id/" do
        Employee.where(id: params[:employee_id], project_id: params[:project_id]).destroy_all
      end
    end
  end
end
