class Admin::BackController < ApplicationController
  layout 'back'
  before_action :sign_out_user, :authenticate_admin!

  def sign_out_user
    user_signed_in? && sign_out(:user)
  end
end