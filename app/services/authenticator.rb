class Authenticator
  attr_reader :user, :token

  def initialize auth
    @user  = create_user auth
    @token = create_token user
  end

  def frontend_url_with_token
    frontend = ENV.fetch "FRONTEND_URL", "http://frontend.example.com"
    "#{frontend}/#token=#{token.nonce}"
  end

  private

  def create_user auth
    u = User.where(email: auth.info.email).first_or_initialize
    u.email    ||= auth.info.email
    u.password ||= SecureRandom.hex(8)

    Rails.logger.info "~~~> HEY! You should email this, but your password is #{u.password} <~~~"

    # Update these each time, as the credentials do expire
    u.facebook_token = auth.credentials.token
    u.facebook_data  = auth.to_h
    u.save!
    u
  end

  def create_token user
    if token = user.token_for("Frontend")
      token
    else
      user.generate_token_for("Frontend")
    end
  end
end
