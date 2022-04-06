MoneyRails.configure { |config| config.default_currency = :usd }
Money.locale_backend = :currency
# Money.rounding_mode = ROUND_HALF_UP
