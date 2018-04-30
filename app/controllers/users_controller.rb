class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
    kit_users = OSTKitService.new.users.list.data['economy_users']
    kit_user = kit_users.select do |item|
      item['uuid'] == @user.wallet
    end
    @amount = kit_user[0]['token_balance']
  end

end
