class CurrencyPair < ApplicationRecord
  validates :amount, :target, :duration, presence: true
  validates :amount, :duration, numericality: { greater_than: 0 }
  
  enum target: %i[aud bgn brl cad chf cny czk dkk eur gbp hkd hrk huf idr ils inr
                  jpy krw mxn myr nok nzd php pln ron rub sek sgd thb try usd zar]
  
  def fetch_weeks
    weeks = []
    date = Date.current
    
    duration.times do
      date = date.prev_week
      weeks << date
    end
    
    weeks
  end
end
