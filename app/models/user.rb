#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :bets
  has_many :games, through: :bets

  after_create :generate_wallet

  def balance
    kit_users = OSTKitService.new.users.list.data['economy_users']
    kit_user = kit_users.select do |item|
      item['uuid'] == self.wallet
    end
    kit_user[0]['token_balance']
  end

  private

    def generate_wallet
      CreateOstKitWalletJob.perform_later self.id
    end
end
