class ApplicationController < ActionController::API

    def authenticate 
        begin
            authorization_header = request.headers["Authorization"]
            token = authorization_header.split(" ")[1]
            secret = Rails.application.secret_key_base
            decode_token = JWT.decode(token, secret)
        rescue 
            render json: { message: "invalid!" }
        end
    end
end
