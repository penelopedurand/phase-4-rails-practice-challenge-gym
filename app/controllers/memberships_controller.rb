class MembershipsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        memberships = Membership.all
        render json: memberships, status: :ok
    end

    def show
        membership = find_membership
        render json: membership, status: :ok 
    end 

    def create
        membership = Membership.create!(membership_params)
        render json: membership, status: :created
    end

    private
    def membership_params
        params.permit(:gym_id, :client_id, :charge)
    end

    def find_membership
        Membership.find(params[:id])
    end

    def render_not_found
        render json: {error: "Not Found"}, status: :not_found
    end 

end
