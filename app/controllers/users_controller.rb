class UsersController < ApplicationController
    # skip_before_action :authorize, only: [:show, :create]
    # before_action :find_user, only: [:show, :destroy]


    def index
        @users = User.all
        render json: @users, status: :ok 
    end

    def myprofile 
        token = params[:token]
        payload = decode(token)
        user = User.find(payload['user_id'])
        render json: user
    end


    def create
        user = User.create(user_params)
        if user
            payload = {"user_id": user.id}
            token = encode(payload)
          render json: { user: user, token: token }, status: :created
        else
          render json: { error: 'Cannot create account' }, status: :unprocessable_entity
        end

    end

    def update  
        token = params[:token]
        payload = decode(token)
        user = User.find(payload['user_id'])
        user.update(status_params)

        if user
            render json: user
        else
            render json: { message: "Cannot update status" }
        end
        
    end

    #delete the account
    def destroy
        @user.destroy
    end
    

    private 

    def find_user 
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:first_name, :last_name, :username, :password)
    end

    def status_params 
        params.permit(:status)
    end

end
