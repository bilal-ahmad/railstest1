module V1
  class Clients < Grape::API
    version 'v1', using: :path
    format :json
    content_type :json, 'application/json'

    resource :clients do
      # Get a list of clients
      #
      # Example Request:
      #   GET /v1/clients
      get do
        Client.all
      end

      # Get a single client
      #
      # Parameters:
      #   id (required) - The ID of a client
      # Example Request:
      #   GET /v1/clients/:id
      params do
        requires :id
      end
      get ':id' do
        Client.find(params[:id])
      end

      # Create a new client
      #
      # Example Request:
      #   POST /v1/clients
      post do
        client = Client.new(params)
        if client.save
          client
        else
          client.errors
        end
      end

      # Edit a client
      #
      # Example Request:
      #   PUT /v1/clients/:id
      params do
        requires :id
      end
      put ':id' do
        client = Client.find(params[:id])
        if client.update(params)
          client
        else
          client.errors
        end
      end

      # Delete a client
      #
      # Example Request:
      #   DELETE /v1/clients/:id
      params do
        requires :id
      end
      delete ':id' do
        Client.destroy(params[:id])
      end
    end
  end
end

