class Dashboard
  def self.weekdays
    dates_week(Date.today).map {|day| day.strftime("%A")}
  end

  def self.dates_week(d)
    d.beginning_of_week..(d.beginning_of_week+6)
  end
end