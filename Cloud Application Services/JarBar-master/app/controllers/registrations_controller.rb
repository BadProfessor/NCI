class RegistrationsController < Devise::RegistrationsController
       
# defining the functionality and ensure the recaptcha is satisifed before an accout can be created
def create()
if verify_recaptcha
  super
else
      build_resource(sign_up_params)
      clean_up_passwords(resource)
      flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
      flash.delete :recaptcha_error
      render :new

    end
 end
  
# Permissions that allow the details entered into the new form user registeration view be posted
  def sign_up_params()
    params.require(:user).permit(:First_Name, :Last_Name, :UserName, :email, :password, :password_confirmation, :Age_Agreement)
  end

# Permissions to allow updates be posted to users account
  def account_update_params()
    params.require(:user).permit(:First_Name, :Last_Name, :UserName, :email, :password, :password_confirmation, :Age_Agreement, :current_password)
  end  
end




