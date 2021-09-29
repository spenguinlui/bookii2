class Admin::UsersManagementController < Admin::BackController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @transaction_records = @user.transaction_records
  end

  def update
    @user = User.find(params[:id])
    @user.reset_amount(user_params[:amount])
    redirect_to admin_users_management_path(@user)
  end

  def deposit
    @user = User.find(params[:id])
    amount = to_int_if_not(params[:amount])
    @user.deposit(amount)
    redirect_to admin_users_management_path(@user)
  end

  private

  def user_params
    params.permit(:name, :email, :amount)
  end

  def to_int_if_not number
    number.is_a?(Integer) ? number : number.to_i
  end
end