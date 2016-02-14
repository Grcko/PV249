class RegistrationsController < Devise::RegistrationsController

  # Never trust parameters from the scary internet, only allow the white list through.
  def sign_up_params
    params.require(:user).permit(:name, :surname, :company_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :surname, :company_name, :email, :password, :password_confirmation, :current_password)
  end
end