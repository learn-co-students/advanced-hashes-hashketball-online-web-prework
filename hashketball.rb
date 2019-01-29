require "pry"

# Write your code here!
def game_hash
  game_hash = {
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
        }
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if name == player_name 
        return stats[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if name == player_name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_info|
    if team_info[:team_name] == team_name
      return team_info[:colors]
    end
  end
end

def team_names
  team_array = []
  game_hash.each do |location, team_info|
    team_array << team_info[:team_name]
  end
  team_array
end

def player_numbers(team_name)
  jersey_array = []
  game_hash.each do |location, team_info|
    if team_info[:team_name] == team_name
      team_info[:players].each do |name, stats|
        jersey_array << stats[:number]
      end
    end
  end
  jersey_array
end
  
def player_stats(player_name)
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if name == player_name 
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe = []
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if largest_shoe.length == 0 || stats[:shoe] > largest_shoe[0]
        largest_shoe[0] = stats[:shoe]
      end
    end
  end
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if stats[:shoe] == largest_shoe[0]
        return stats[:rebounds]
      end
    end
  end
end

def most_points_scored
  most_points = []
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if most_points.length == 0 || stats[:points] > most_points[0]
        most_points[0] = stats[:points]
      end
    end
  end
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if stats[:points] == most_points[0]
        return name 
      end
    end
  end
end

def winning_team
  home_points = 0 
  away_points = 0 
  game_hash[:home][:players].each do |name, stats|
    home_points += stats[:points]
  end
  game_hash[:away][:players].each do |name, stats|
    away_points += stats[:points]
  end
  if home_points > away_points
    return game_hash[:home][:team_name]
  elsif away_points > home_points 
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  long_name = []
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if long_name.length == 0 || name.size > long_name[0].size 
        long_name[0] = name
      end
    end
  end
  long_name[0]
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  longest_name_steals = 0 
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if longest_name == name 
        longest_name_steals += stats[:steals]
      end
    end
  end
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, stats|
      if longest_name_steals < stats[:steals]
        return FALSE 
      end
    end
  end
  return TRUE
end


  
  
  
  