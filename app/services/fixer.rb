module Fixer
  private
  
  def get_current_rate
    @bank = Money::Bank::FixerIo.new
    @bank.get_rate(:EUR, @currency_pair.target)
  end

  def get_historical_rate(week)
    @bank.get_rate(:EUR, @currency_pair.target, exchanged_at: week)
  end
end
