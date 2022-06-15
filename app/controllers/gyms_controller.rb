class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        gyms = Gym.all
        render json: gyms, status: :ok
    end

    def show
        gym = find_gym
        render json: gym, status: :ok 
    end 

    def create
        gym = Membership.create!(gym_params)
        render json: gym, status: :created
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content, status: :200
    end 

    private
    def gym_params
        params.permit(:name, :address)
    end

    def find_gym
        Gym.find(params[:id])
    end

    def render_not_found
        render json: {error: "Gym not found"}, status: :not_found
    end 

end
