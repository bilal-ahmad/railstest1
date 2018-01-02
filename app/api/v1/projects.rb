module V1
  class Projects < Grape::API
    version 'v1', using: :path
    format :json
    content_type :json, 'application/json'

    resource :projects do
      # Get a list of projects
      #
      # Example Request:
      #   GET /v1/projects
      get do
        Project.all
      end

      # Get a single project
      #
      # Parameters:
      #   id (required) - The ID of a project
      # Example Request:
      #   GET /v1/projects/:id
      params do
        requires :id
      end
      get ':id' do
        Project.find(params[:id])
      end

      # Create a new project
      #
      # Example Request:
      #   POST /v1/projects
      post do
        project = Project.new(params)
        if project.save
          project
        else
          project.errors
        end
      end

      # Edit a project
      #
      # Example Request:
      #   PUT /v1/projects/:id
      params do
        requires :id
      end
      put ':id' do
        project = Project.find(params[:id])
        if project.update(params)
          project
        else
          project.errors
        end
      end

      # Delete a project
      #
      # Example Request:
      #   DELETE /v1/projects/:id
      params do
        requires :id
      end
      delete ':id' do
        Project.destroy(params[:id])
      end

      # Create a project in a given client
      #
      # Example Request:
      #   POST /v1/clients/
      desc 'Create a project of a given client'
      params do
        requires :client_id, type: Integer
      end
      post "/client/:client_id" do
        client = Client.where(id: params[:client_id]).first
        if client.present?
          client.projects.create(params[:project])
        else
          client.errors
        end
      end

      # Get the projects pf a given client
      #
      # Example Request:
      #   GET /v1/project/client/:client_id
      desc 'Get the projects of a given client'
      params do
        requires :client_id, type: Integer
      end
      get "/client/:client_id" do
        client = Client.where(id: params[:client_id]).first
        if client.present?
          client.projects
        else
          {"error": "Client not found."}
        end
      end

      # Delete a project from a given client
      #
      # Example Request:
      #   POST /v1/projects/:project_id/client/:client_id
      desc 'Delete a project from client'
      params do
        requires :project_id, type: Integer
        requires :client_id, type: Integer
      end
      delete "/:project_id/client/:client_id/" do
        Project.where(id: params[:project_id], client_id: params[:client_id]).destroy_all
      end

    end
  end
end
