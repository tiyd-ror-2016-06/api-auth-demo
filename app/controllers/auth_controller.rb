class AuthController < Devise::OmniauthCallbacksController
  def facebook
    auth  = request.env["omniauth.auth"]
    state = request.env["omniauth.params"]["state"]

    token, url = state.split(":", 2)
    if user = User.with_token(token)
      user.update! facebook_token: auth.credentials.token, facebook_data: auth.to_h
    end
    redirect_to url
  end
end
