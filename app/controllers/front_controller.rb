class FrontController < ApplicationController
  layout 'front'

  before_action :sign_out_admin

  def sign_out_admin
    admin_signed_in? && sign_out(:admin)
  end
end