class ApplicationController < ActionController::Base
#CSRFへの対応策のコード
  protect_from_forgery with: :exception
#configure_permitted_parametersというメソッドは、devise_controllerを使うときしか処理しない
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
