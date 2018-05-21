class AirdropJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'Airdrop for newly created users'
    users = OSTKitService.new.users
    users.airdrop_tokens(amount: 5, list_type: 'never_airdropped')
    puts 'Airdrop Requested'
  end
end
