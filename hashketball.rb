require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => {
        "Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1}, 
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7}, 
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15}, 
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5}, 
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
        }
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, info|
      if info.include?(player_name)
        return info[player_name][:points]
      end
    end
  end
end

# def num_points_scored(player_name)
#   players_data_away = game_hash[:away][:players]
#   players_data_home = game_hash[:home][:players]
#   if players_data_away.include?(player_name)
#     return players_data_away[player_name][:points]
#   end
#   if players_data_home.include?(player_name)
#     return players_data_home[player_name][:points]
#   end
# end

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, info|
      if info.include?(player_name)
        return info[player_name][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, info|
      if info == team_name
        return team_data[:colors]
      end
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  number_arr = [ ]

  if game_hash[:home][:team_name].include?(team_name)
    game_hash.each do |location, team_data|
      team_data.each do |attribute, info|
        if location == :home && attribute == :players
          info.each do |player, stats|
            number_arr << info[player][:number]
          end
        end 
      end
    end
  end
   
  if game_hash[:away][:team_name].include?(team_name)
    game_hash.each do |location, team_data|
      team_data.each do |attribute, info|
        if location == :away && attribute == :players
          info.each do |player, stats|
            number_arr << info[player][:number]
          end
        end 
      end
    end
  end
  number_arr
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, info|
      if info.include?(player_name)
        return info[player_name]
      end
    end
  end
end
  
def big_shoe_rebounds
  biggest_shoe_size = 0
  biggest_shoe_player = ""
  
  game_hash[:home][:players].each do |player_name, category|
    if category[:shoe] > biggest_shoe_size
      biggest_shoe_player = player_name
      biggest_shoe_size = category[:shoe]
    end
  end
  
  game_hash[:away][:players].each do |player_name, category|
    if category[:shoe] > biggest_shoe_size
      biggest_shoe_player = player_name
      biggest_shoe_size = category[:shoe]
    end
  end
  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, info|
      if info.include?(biggest_shoe_player)
        return info[biggest_shoe_player][:rebounds]
      end
    end
  end
end











