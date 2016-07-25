class ApiController < ApplicationController
  before_action { request.format = :json }

  def me
    @user     = current_user
    @birthday = Facebook.new(@user).get_birthday
  end
end
