
require 'date'

def dates_betwen(initial_date, final_date, day)
  dates = []
  current_date = initial_date

  while (current_date <=> initial_date) < 1
    days_array << (current_date.next_month).strftime("%e/%B/%Y")
    current_date = current_date.next_month
  end

  days_array
end



