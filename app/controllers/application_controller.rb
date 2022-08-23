class ApplicationController < ActionController::API
    # include ActionController::Cookies
    require "jwt"

    # before_action :authorize
    # before_action :authenticate_request

    def secret_key
        "Kojisworld"
    end

    def encode(payload) 
        JWT.encode(payload, secret_key, 'HS256')
    end
      #   takes in a token which is an string

    def decode(token)
        JWT.decode(token, secret_key, true, { algorithm: 'HS256' })[0]
      rescue StandardError
        puts 'FAILED'
    end


    #login - POST
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
          payload = { "exp": Time.now.to_i + 2.week, 'user_id': user.id }
          token = encode(payload)
          render json: {user: user , token: token}
        else
          render json: {
            message: 'Incorrect Username/Password'
          }
        end
      end

      #useEffect will give us token param - this is login w/o password

      #sign up
    def index
        token = params[:token]
        # token = request.headers['Authentication'].split(' ')[1] 
        payload = decode(token)
        user = User.find(payload['user_id'])
        if user
            render json: user
        else
            render json: {message: "INVALID TOKEN"}
        end
      end

      #logout
    #   def destroy 
    #     token = params[:token]
    #     # token = request.headers['Authentication'].split(' ')[1] 
    #     payload = decode(token)
    #     user = User.find(payload['user_id'])
    #     user.destroy
    #     if user
    #         render json: { message: "Logged out" }
    #     else
    #         render json: {message: "Cannot logout"}
    #     end
    #   end

   


    # def current_user
    #     user ||= User.find_by(id: user_id)
    # end

    # def logged_in?
    #     !!current_user
    # end

    # private

    # def current_user
    #     @current_user ||= User.find_by(id: session[:user_id])

    # end


    # def authenticate_request
    #     header = request.headers["Authorization"]
    #     header = header.split(" "). last if header
    #     decoded = jwt_decode(header)
    #     @current_user = User.find(decoded[:user_id])
    # end

    # def authorize 
    #     unless current_user
    #         render json: { message: "Not authorized" }, status: 404
            
    #     end
    # end

end
