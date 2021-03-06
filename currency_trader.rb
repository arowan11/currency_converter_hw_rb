require_relative "./currency"
require_relative "./currency_converter"

# find the key(s) that have the max value(s) from a hash, returns an array of keys
def max_value_keys(hash)
  max_key_value = hash.max_by{ |k, v| v }
  hash_all_maxes = hash.select{ |k, v| v == max_key_value[1] }
  hash_all_maxes.keys
end

class CurrencyTrader

  # currency trader object should be initialized with two currency converter objects from 2 diff points in time
  def initialize(converter1, converter2, start_currency)
    @converter1 = converter1
    @converter2 = converter2
    @start_currency = start_currency

  end

  # method to access the converter1 instance variable
  def converter1
    @converter1
  end

  # method to access the converter2 instance variable
  def converter2
    @converter2
  end

  # method to access the start_currency instance variable
  def start_currency
    @start_currency
  end

  # this method should tell you which currency (or currencies) you would get the best returns on given two converter inputs
  def best_bet_currency
    start_value = Currency.new(1, self.start_currency)
    possible_currencies = self.converter1.rates_lookup.keys
    result_amounts = {}

    possible_currencies.each do |curr_code|
      converted_amount = converter1.convert(start_value, curr_code)
      converted_back_amount = converter2.convert(converted_amount, start_value.code)
      result_amounts[curr_code] = converted_back_amount.amount
    end

    best_bet = max_value_keys(result_amounts)
    return best_bet

  end
end
