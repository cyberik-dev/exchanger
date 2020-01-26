class CurrencyPair < ApplicationRecord
  validates :amount, :target, :duration, presence: true
  validates :amount, :duration, numericality: { greater_than: 0 }
end
