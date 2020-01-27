class GetRatesService
  include Fixer

  def initialize(currency_pair)
    @currency_pair = currency_pair
  end

  def call
    fetch_rates_data
    set_highest_rate
    set_lowest_rate
    @data
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

  def set_highest_rate
    highest_rate_index = @data[:for_table].each_with_index.max_by { |k, _i| k[:historical_rate] }.last
    @data[:for_table][highest_rate_index][:highest] = true
  end

  def set_lowest_rate
    lowest_rate_item, lowest_rate_index = @data[:for_table].each_with_index.min_by { |k, _i| k[:historical_rate] }
    @data[:for_table][lowest_rate_index][:lowest] = true
    @data[:lowest_value] = lowest_rate_item[:historical_rate]
  end
end
