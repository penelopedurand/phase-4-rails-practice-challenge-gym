class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        clients = Client.all
        render json: clients, status: :ok
    end

    def show
        client = find_client
        render json: client, status: :ok 
    end 

    def create
       client = Client.create!(client_params)
        render json: client, status: :created
    end

    private
    def client_params
        params.permit(:name, :age)
    end

    def find_client
        client.find(params[:id])
    end

    def render_not_found
        render json: {error: "Not Found"}, status: :not_found
    end 

end
