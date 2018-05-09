class ExecuteTransactionJob < ApplicationJob
  queue_as :default

  def perform(to, from, amount)
    puts "#{to} - #{from} - #{amount}"
  end
end
