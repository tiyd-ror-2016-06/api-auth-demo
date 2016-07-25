class AuthController < Devise::OmniauthCallbacksController
  def facebook
    auth = Authenticator.new(request.env["omniauth.auth"])
    redirect_to auth.frontend_url_with_token
  end
end
