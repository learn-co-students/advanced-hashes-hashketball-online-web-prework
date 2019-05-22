require 'pry'

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

def num_points_scored(name)
  game_hash.each do |location, team_data| # level 1
    team_data.each do |attribute, data|   # Level 2 
      if attribute == :players
        data.each do |player_name, player_data| # Level 3 
          if player_name == name
            return player_data[:points] 
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, stat|
          if player_name == name
            return stat[:shoe]
          end
        end
      end
    end
  end
end  
  
def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end  

def team_names
  team_name_array = []
  game_hash.each do |location, team_data|
    team_name_array << team_data[:team_name]
  end
  return team_name_array
end

def player_numbers(team_name)
  numbers_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player_name, player_data|
        numbers_array << player_data[:number]
      end
    end
  end
  numbers_array
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_data| 
          if player_name == name
            return player_data
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          if player_data[:shoe] > biggest_shoe
            biggest_shoe = player_data[:shoe]
          end
          return player_data[:rebounds]
        end  
      end
    end
  end
end

def most_points_scored
  most_points = 0
  high_score_player = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_data|
          if player_data[:points] > most_points
            most_points = player_data[:points]
            high_score_player = player_name
          end
        end
      end
    end
  end
  high_score_player
end

def winning_team
  home_team_total = 0
  away_team_total = 0
  game_hash.each do |location, team_data|
    if location == :home
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_name, player_data|
            home_team_total += player_data[:points]
          end
        end
      end
    else
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player_name, player_data|
            away_team_total += player_data[:points]
          end
        end
      end
    end
  end
  if home_team_total > away_team_total
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name_length = 0
  longest_name_player = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_data|
          if player_name.length > longest_name_length
            longest_name_length = player_name.length
            longest_name_player = player_name
          end
        end
      end
    end
  end
  longest_name_player
end

def long_name_steals_a_ton?
  maximum_stealz = 0
  best_stealer = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_data|
          if player_data[:steals] > maximum_stealz
            maximum_stealz = player_data[:steals]
            best_stealer = player_name
          end
        end
      end
    end
  end
  if best_stealer == player_with_longest_name
    true
  else
    false
  end
end

