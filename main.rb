
require 'date'

def get_dates_betwen(initial_date, final_date, day)
  number_of_months = (final_date.year * 12 + final_date.month) - (initial_date.year * 12 + initial_date.month)
  days_array = []
  actual_date = initial_date

  while days_array.count < number_of_months
    days_array << (actual_date.next_month).strftime("%e/%B/%Y")
    actual_date = actual_date.next_month
  end

  days_array
end



