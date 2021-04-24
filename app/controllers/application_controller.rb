class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # ログインしていないユーザーをログインページの画面に促すことができます。
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :email, :encrypted_password, :name, :profile, :occupation, :position])
  end

end


# | -------- | ------ | ----------- |
# | email    | string | null: false |
# | password | string | null: false |
# | name     | string | null: false |
# | profile  | text   | null: false |
# | occupation| text  | null: false |
# | position | text   | null: false | 