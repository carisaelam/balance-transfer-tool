# frozen_string_literal: true

class Transfer
  attr_accessor :bucket_balance, :credit_balances

  def initialize(bucket_balance = 0, credit_balances = [])
    @bucket_balance = bucket_balance
    @credit_balances = credit_balances
    @cards = ['Capital One Venture One', 'Capital One Savor', 'Chase Sapphire', 'Southwest Rapid Rewards',
              'Chase Ink Business Preferred']
  end

  def collect_input
    gets.chomp.to_f
  end

  def add(array)
    array.sum.to_f
  end

  def find_difference(a, b)
    a - b
  end

  def calculate_transfer
    credit_balances = add(@credit_balances)
    credit_balances - @bucket_balance
  end

  def collect_bucket_balance
    print 'Ally bucket balance: $'
    current_bucket_balance = collect_input.to_f
    @bucket_balance = current_bucket_balance
  end

  def collect_credit_balances
    @cards.each do |card|
      print "#{card} balance: $"
      card_balance = collect_input.to_f
      @credit_balances.push(card_balance)
    end
  end

  def print_results
    total_credit_balance = add(credit_balances)
    formatted_bucket_balance = format('%.2f', bucket_balance)
    formatted_transfer_amount = format('%.2f', calculate_transfer)

    puts "\n\nYour total credit card balance is $#{'%.2f' % total_credit_balance}.\n\n"
    puts "You currently have $#{formatted_bucket_balance} in your Ally bucket.\n\n"
    puts "You should transfer $#{formatted_transfer_amount} into your Ally bucket\n\n"
  end

  def start
    collect_credit_balances
    collect_bucket_balance
    calculate_transfer
    print_results
  end
end

test = Transfer.new
test.start
