require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each do |holiday, supplies|
    supplies << supply
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party HatsP
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do |season, holiday|
    # output += season.to_s.capitalize! + ":\n"
    # turn season (symbol) to a string and capitalize it
    puts season.to_s.capitalize! + ":"

    # holiday here are keys which are symbols
    # first turn each to a string, then into an array (to account for _)
    # then capitalize each word
    # and finally convert it to a string again
    holiday.each do |holiday, supplies|
      formatted_holiday = holiday.to_s
      .split("_")
      .each { |word| word.capitalize! }
      .join(" ")
      # output += "  #{formatted_holiday}: #{supplies.join(", ")}\n"
      puts "  #{formatted_holiday}: #{supplies.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holidays_with_bbq = []

  # season is :winter, :summer, :fall, :spring. holiday is another hash
  holiday_hash.each do |season, holiday|
    # holiday is a hash, holiday_name is the key, supply is the value
    holiday.each do |holiday_name, supply|
      # supply is an array so we can use .include? to target only those including
      # the BBQ string
      if supply.include?("BBQ")
        holidays_with_bbq << holiday_name
      end
    end
  end

  holidays_with_bbq
end
