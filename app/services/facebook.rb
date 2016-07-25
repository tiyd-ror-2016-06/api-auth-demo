class Facebook
  def initialize user
    @token = user.facebook_token
  end

  def get_birthday
    response = HTTParty.get "https://graph.facebook.com/v2.7/me",
      query: { access_token: @token, fields: "birthday" }
    response["birthday"]
  end
end
