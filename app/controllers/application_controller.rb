class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	#デバイス機能実行前にconfigure_permitted_parametersの実行をする。
	protect_from_forgery with: :exception
  before_action :set_current_user
  protected

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def after_sign_up_path_for(resource)
     user_path(resource)
  end

  def after_sign_in_path_for(resource)
     user_path(resource)
  end

  def after_sign_out_path_for(resource)
     root_path
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end
end
