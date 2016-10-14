require_relative "./currency"

class CurrencyConverter

  # should be initialized with a hash of currency codes and conversion rates
  # i.e. {"USD" => 1.0, "EUR" => 0.74}
  def initialize(rates_lookup)
    @rates_lookup = rates_lookup
  end

  # method to grab the rates_lookup hash
  def rates_lookup
    @rates_lookup
  end

  # given a currency object, should be able to return a new currency object in the requested currency code
  def convert(currency, code)
    currency * (rates_lookup[code] / rates_lookup[currency.code])
  end
end