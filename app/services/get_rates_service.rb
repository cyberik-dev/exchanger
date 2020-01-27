class GetRatesService
  def initialize(currency_pair)
    @currency_pair = currency_pair
  end

  def call
    fetch_rates_data
  end

  private

  def fetch_rates_data
    @data = {}
    @data[:for_table] = []
    @data[:for_chart] = {}
    @data[:rate_today] = get_current_rate
      
    fetch_weeks.each do |week|
      row_data = {}
      row_data[:year] = week.year
      
      week_number = week.cweek
      row_data[:week_number] = week_number
      row_data[:date] = week
      
      historical_rate = get_historical_rate(week)
      row_data[:historical_rate] = historical_rate
      @data[:for_chart][week_number] = historical_rate

      in_total = @currency_pair.amount * historical_rate
      row_data[:in_total] = in_total

      row_data[:profit_loss] = @currency_pair.amount * @data[:rate_today] - in_total
      @data[:for_table] << row_data
    end
    
    @data
  end

  def fetch_weeks
    weeks = []
    date = Date.current

    @currency_pair.duration.times do
      date = date.prev_week
      weeks << date
    end
    weeks
  end
  
  def get_current_rate
    @bank = Money::Bank::FixerIo.new
    @bank.get_rate(:EUR, @currency_pair.target)
  end
  
  def get_historical_rate(week)
    @bank.get_rate(:EUR, @currency_pair.target, exchanged_at: week)
  end
end
