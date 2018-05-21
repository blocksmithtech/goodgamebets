#
class CreateOstKitWalletJob < ApplicationJob
  queue_as :default

  def perform(*args)
    user = User.find(args[0])
    puts "Generating Wallet for user #{user.name}"
    ost_users = OSTKitService.new.users
    response = ost_users.create(name: user.email.parameterize(separator: ' '))
    user.wallet = response.data['economy_users'][0]['uuid']
    user.save
    puts 'New Wallet created successfully'
    AirdropJob.perform_later
    puts 'Scheduled Airdrop'
  end
end
