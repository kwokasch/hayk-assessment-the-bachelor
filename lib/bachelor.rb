require "pry"

def get_first_name_of_season_winner(data, season)
  contestant = data[season].filter do |contestant| 
    contestant["status"] == "Winner"  
  end
  contestant.first["name"].split(" ").first
end

def get_contestant_name(data, occupation)
  data.each do |season, contestant| 
    contestant.each do |contestant_info| 
      if contestant_info["occupation"] == occupation
        return contestant_info["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  town_count = 0
  data.each do |season, contestant|
    contestant.each do |contestant_info|
      if contestant_info["hometown"] == hometown
        town_count +=1
      end
    end    
  end
  town_count
end

def get_occupation(data, hometown)
  data.each do |season, contestant| 
    contestant.each do |contestant_info| 
      if contestant_info["hometown"] == hometown
        return contestant_info["occupation"]
      end
    end
  end
end

# def get_occupation(data, hometown)
#   data.each do |season, contestant| 
#     contestant.select do |contestant_info| 
#       contestant_info["hometown"] == hometown
#     end.map do |new_contestant|
#     new_contestant["occupation"]
#   end
# end

def get_average_age_for_season(data, season)
  (data[season].map do |contestant|
    contestant["age"].to_i
  end.reduce(:+).to_f / data[season].length).round
end