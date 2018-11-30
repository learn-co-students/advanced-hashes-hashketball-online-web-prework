
require 'pry'

def game_hash
#start of method

game = { 
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
       "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
      
    }

  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      },
    }

  }
}

#end of method
end

def num_points_scored(players_name)
  
  if game_hash[:away][:players].has_key?(players_name)
    return game_hash[:away][:players][players_name][:points]
  elsif  game_hash[:home][:players].has_key?(players_name)
    return game_hash[:home][:players][players_name][:points]
  end
  
  
end

def shoe_size(players_name)
  if game_hash[:away][:players].has_key?(players_name)
    return game_hash[:away][:players][players_name][:shoe]
  elsif  game_hash[:home][:players].has_key?(players_name)
    return game_hash[:home][:players][players_name][:shoe]
  end
end

def team_colors(team_name)
  if team_name == game_hash[:home][:team_name]
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  arr = []
  arr << game_hash[:home][:team_name]
  arr << game_hash[:away][:team_name]
  arr
end

def player_numbers(team_name)
  arr = []
    if team_name == game_hash[:home][:team_name]
    game_hash[:home][:players].each do |player_name, stats|
      stats.each do |stat_name, value|
        if stat_name == :number
        arr << value
        end
      end
    end
  else
    game_hash[:away][:players].each do |player_name, stats|
       stats.each do |stat_name, value|
         if stat_name == :number
           arr << value
         end
       end
    end
  end
  arr
end


def player_stats(player_name)
  if game_hash[:away][:players].has_key?(player_name)
    return game_hash[:away][:players][player_name]
  elsif  game_hash[:home][:players].has_key?(player_name)
    return game_hash[:home][:players][player_name]
  end
end

def big_shoe_rebounds
  player_largest_shoe_size = 1
  largest_name = ""
  game_hash[:home][:players].each do |player_name, stats|
    if stats[:shoe] > player_largest_shoe_size
      player_largest_shoe_size = stats[:shoe]
      largest_name = player_name
    end
  end
  game_hash[:away][:players].each do |player_name, stats|
    if stats[:shoe] > player_largest_shoe_size
      player_largest_shoe_size = stats[:shoe]
      largest_name = player_name
    end
  end
  
  if game_hash[:away][:players].has_key?(largest_name)
    return game_hash[:away][:players][largest_name][:rebounds]
  else
    return game_hash[:home][:players][largest_name][:rebounds]
  end
  
  
end


  

def most_points_scored
  player_most_points = 0
  player_most_points_name = ""
  
  game_hash[:home][:players].each do |player_name, stats|
    if stats[:points] > player_most_points
      player_most_points = stats[:points]
      player_most_points_name = player_name
    end
  end
  game_hash[:away][:players].each do |player_name, stats|
    if stats[:points] > player_most_points
      player_most_points = stats[:points]
      player_most_points_name = player_name
    end
  end
  
 player_most_points_name
  
end  


def winning_team
  
  home_points = 0
  home_name = ""
  away_points = 0
  away_name = ""
  
   game_hash[:home][:players].each do |player_name, stats|
    home_points += stats[:points]
    home_name = game_hash[:home][:team_name]
   end
   
   game_hash[:away][:players].each do |player_name, stats|
    away_points += stats[:points]
    away_name = game_hash[:away][:team_name]
   end
  
  if home_points > away_points
    return home_name
  else
    return away_name
  end
  
end

def player_with_longest_name
  player_longest_length= 0
  player_longest_name = ""
  
  game_hash[:home][:players].each do |player_name, stats|
    if player_name.length > player_longest_length
      player_longest_length = player_name.length
      player_longest_name = player_name
    end
  end
  game_hash[:away][:players].each do |player_name, stats|
    if player_name.length > player_longest_length
      player_longest_length = player_name.length
      player_longest_name = player_name
    end
  end
  
 player_most_points_name
  
end  

  
  
def long_name_steals_a_ton
  
  player_most_steals = 0
  player_most_steals_name = ""
  
  game_hash[:home][:players].each do |player_name, stats|
    if stats[:steals] > player_most_steals
      player_most_steals = stats[:steals]
      player_most_steals_name = player_name
    end
  end
  game_hash[:away][:players].each do |player_name, stats|
    if stats[:steals] > player_most_steals
      player_most_steals = stats[:steals]
      player_most_steals_name = player_name
    end
  end
  
  if player_most_steals_name == player_with_longest_name
    return true
  else
    return FALSE
  end
  
end