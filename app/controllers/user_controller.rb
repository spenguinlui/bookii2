class UserController < FrontController
  before_action :authenticate_user!
  
  def index
    @booking_records = current_user.booking_records
  end
end