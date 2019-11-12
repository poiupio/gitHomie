
require 'date'

def get_dates_betwen(initial_date,final_date,day)
  number_of_months = (final_date.year * 12 + final_date.month) - (initial_date.year * 12 + initial_date.month)
  days_array = []
  increase_months=1
  while days_array.count < number_of_months
    days_array << (initial_date >> increase_months)
    increase_months += 1
  end
  return days_array
end


