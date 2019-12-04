require 'pry'

def game_hash
  hashketball = { 
    :home => { :team_name => "Brooklyn Nets", 
               :colors => ["Black", "White"], 
               :players => [
                 { :player_name => "Alan Anderson",
                   :number => 0,
                   :shoe => 16,
                   :points => 22,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 1,
                 },
                 { :player_name => "Reggie Evans",
                   :number => 30,
                   :shoe => 14,
                   :points => 12,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 12,
                   :blocks => 12,
                   :slam_dunks => 7,
                 },
                 { :player_name => "Brook Lopez",
                   :number => 11,
                   :shoe => 17,
                   :points => 17,
                   :rebounds => 19,
                   :assists => 10,
                   :steals => 3,
                   :blocks => 1,
                   :slam_dunks => 15,
                 },
                 { :player_name => "Mason Plumlee",
                   :number => 1,
                   :shoe => 19,
                   :points => 26,
                   :rebounds => 11,
                   :assists => 6,
                   :steals => 3,
                   :blocks => 8,
                   :slam_dunks => 5,
                 },
                 { :player_name => "Jason Terry",
                   :number => 31,
                   :shoe => 15,
                   :points => 19,
                   :rebounds => 2,
                   :assists => 2,
                   :steals => 4,
                   :blocks => 11,
                   :slam_dunks => 1,
                 }
                ] 
    },
    :away => { :team_name => "Charlotte Hornets", 
               :colors => ["Turquoise", "Purple"], 
               :players => [
                 { :player_name => "Jeff Adrien",
                   :number => 4,
                   :shoe => 18,
                   :points => 10,
                   :rebounds => 1,
                   :assists => 1,
                   :steals => 2,
                   :blocks => 7,
                   :slam_dunks => 2,
                 },
                 { :player_name => "Bismack Biyombo",
                   :number => 0,
                   :shoe => 16,
                   :points => 12,
                   :rebounds => 4,
                   :assists => 7,
                   :steals => 22,
                   :blocks => 15,
                   :slam_dunks => 10,
                 },
                 { :player_name => "DeSagna Diop",
                   :number => 2,
                   :shoe => 14,
                   :points => 24,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 4,
                   :blocks => 5,
                   :slam_dunks => 5,
                 },
                 { :player_name => "Ben Gordon",
                   :number => 8,
                   :shoe => 15,
                   :points => 33,
                   :rebounds => 3,
                   :assists => 2,
                   :steals => 1,
                   :blocks => 1,
                   :slam_dunks => 0,
                 },
                 { :player_name => "Kemba Walker",
                   :number => 33,
                   :shoe => 15,
                   :points => 6,
                   :rebounds => 12,
                   :assists => 12,
                   :steals => 7,
                   :blocks => 5,
                   :slam_dunks => 12,
                 }
                ] 
    }
  }
end

def num_points_scored(player)
  game_hash.each do |key, value|
    value[:players].each do |i|
      if player == i[:player_name]
        return i[:points] 
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |key, value|
    value[:players].each do |i|
      if player == i[:player_name]
        return i[:shoe]
      end
    end
  end
end

def team_colors(team)
  
  # game_hash.values.each do |team_info|
  #     if team == team_info[:team_name] 
  #       return team_info[:colors]
  #     end
  # end
  
  game_hash.each do |key, value|
    if team == value[:team_name]
      return value[:colors]
    end
  end
end

def team_names
  new_array = []
  game_hash.each do |key, value|
    new_array << value[:team_name]
  end
  new_array
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |key, value|
    value[:players].each do |i|
      if team_name == value[:team_name]
        #binding.pry 
        numbers << i[:number]
      end
    end
  end
  numbers.sort 
end

def player_stats(player)
  game_hash.each do |key, value|
    value[:players].each do |i|
      if player == i[:player_name]
        i.shift 
        return i 
      end
    end
  end
end  
  
def big_shoe_rebounds
  shoes = [] 
  
  game_hash.each do |key, value|
    
    value[:players].each do |i|
      shoes << i[:shoe]
    end
    
    value[:players].each do |i|
      if shoes.max == i[:shoe]
        return i[:rebounds]
      end
    end
    
  end
end
  
#=> alternative way of solving the method 
# def big_shoe_rebounds
#     max = nil
#     rebounds = nil
#     game_hash.each do |team, team_values|
#         team_values[:players].each do |player|
#             if max == nil || player[:shoe] > max
#                 max = player[:shoe]
#                 rebounds = player[:rebounds]
#             end
#         end
#     end
#     rebounds
# end
              
def most_points_scored
    max = nil
    name = nil 
    game_hash.each do |team, team_values|
      team_values[:players].each do |player|
        if max == nil || player[:points] > max
          max = player[:points]
          name = player[:player_name]
        end
      end
    end
    name
end

def winning_team
  bn_points = 0 
  ch_points = 0
  
  game_hash[:home][:players].each do |i|
    bn_points += i[:points]
  end
  
  game_hash[:away][:players].each do |i|
    ch_points += i[:points]
  end
  
  if bn_points > ch_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = nil 
  game_hash.each do |key, value|
      value[:players].each do |player|
        if longest_name == nil || player[:player_name].size > longest_name.size 
          longest_name = player[:player_name]
        end
      end
    end
    longest_name
end

def long_name_steals_a_ton?

  largest_steals = nil  
  
  game_hash.each do |key, value|
    value[:players].each do |i|
      if largest_steals == nil || i[:steals] > largest_steals
        largest_steals = i[:steals]
      end
    end
  end
  
  game_hash.each do |key, value|
    value[:players].each do |i|
      if i[:player_name] == player_with_longest_name && i[:steals] == largest_steals
        return true 
      end
    end
  end
  
end








