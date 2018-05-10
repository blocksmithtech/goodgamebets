class ExecuteTransactionJob < ApplicationJob
  queue_as :default

  def perform(to, from, amount)
    transactions = OSTKitService.new.transactions

    transaction_name = get_transaction_name(transactions, amount)

    result = transactions.execute(from_uuid: from,
                                  to_uuid: to,
                                  transaction_kind: transaction_name)

    if result.http_code != 200 || !result.error_message.blank?
      puts result.error_message
      raise "Something went wrong with #{to} - #{from} - #{amount}"
    else
      puts "Transaction to #{to} of #{amount} done"
    end
  end

  def get_transaction_name(transactions, amount)
    # Since the API does not support filtering, we will have to do it by name
    transaction_name = "Reward #{amount}"
    all_transactions = transactions.list.data['transaction_types']
    exists = all_transactions.select do |item|
      item['name'] == transaction_name
    end

    create_transaction(transactions, transaction_name, amount) if exists.blank?
    transaction_name
  end

  def create_transaction(transactions, transaction_name, amount)
    transactions.create(name: transaction_name,
                        kind: 'company_to_user',
                        currency_type: 'BT',
                        currency_value: amount.to_s,
                        commission_percent: '0.00')
  end
end
