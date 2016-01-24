module Api
  module V1
    class ApiController < ActionController::Base
      before_filter :restrict_access
      respond_to :json

      private

      def restrict_access
        auth_token = request.headers['HTTP_AUTH_TOKEN']
        unless auth_token.present? && @user = User.find_by_authentication_token(auth_token)
          head :unauthorized
        end
      end
    end
  end
end
