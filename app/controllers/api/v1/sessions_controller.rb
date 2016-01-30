module Api
  module V1
    class SessionsController < ApiController
      skip_before_filter :restrict_access, :only => :create

      def destroy_my
        @user.update(authentication_token: nil)
        render json: {}
        return
      end

    def create
      user = User.find_by_email(params[:email])
      return invalid_login_attempt unless user

      if user.valid_password?(params[:password])
        ensure_authentication_token(user)
        render json: {
            auth_token: user.authentication_token,
            email: user.email,
            name: user.name,
            surname: user.surname,
        }
        return
      end
      invalid_login_attempt
    end

      private

      def invalid_login_attempt
        warden.custom_failure!
        render json: {
            message: "Error with your login or password"
        }, status: 401
      end

      def ensure_authentication_token(user)
        puts 'Existing token in DB'
        puts user.authentication_token
        if user.authentication_token.blank?
          user.update(authentication_token: generate_authentication_token)
        end
      end

      def generate_authentication_token
        loop do
          token = Devise.friendly_token
          break token unless User.find_by(authentication_token: token)
        end
      end
    end
  end
end