#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bets
  has_many :games, through: :bets

  after_create :generate_wallet

  private

    def generate_wallet
      CreateOstKitWalletJob.perform_later self.id
    end
end
