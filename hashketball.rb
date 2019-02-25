# Write your code here!
require 'pry'

def game_hash
  hashket = {#top level
    :home =>{#second level
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players =>{# third level
                        "Alan Anderson" =>{# fourth level
                                            :number => 0 , :shoe => 16 , :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1 },
                        "Reggie Evans" =>{# fourth level
                                            :number => 30 , :shoe => 14 , :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
                        "Brook Lopez" =>{# fourth level
                                            :number => 11 , :shoe => 17 , :points => 17, :rebounds => 19, :assists =>10, :steals => 3, :blocks => 1, :slam_dunks => 15},
                        "Mason Plumlee" =>{# fourth level
                                            :number => 1 , :shoe => 19 , :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
                        "Jason Terry" =>{# fourth level
                                            :number => 31 , :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
                        }
            },
    :away =>{#second level
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players =>{# third level
                        "Jeff Adrien" =>{# fourth level
                                            :number => 4 , :shoe => 18 , :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
                        "Bismak Biyombo" =>{# fourth level
                                            :number => 0 , :shoe => 16 , :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
                        "DeSagna Diop" =>{# fourth level
                                            :number => 2 , :shoe => 14 , :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
                        "Ben Gordon" =>{# fourth level
                                            :number => 8 , :shoe => 15 , :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
                        "Brendan Haywood" =>{# fourth level
                                            :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
                                    }
            }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
          if player_name == name
              return player_data[:points]
          end
    end
  end
end


def shoe_size(name)
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player_name, player_data|
          if player_name == name
              return player_data[:shoe]
          end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_hash|
    if team_hash[:team_name] == team
      return team_hash[:colors]
    end
  end
end

def team_names
  game_hash.map do |location, team_hash|
    team_hash[:team_name]
  end
end

def player_numbers(team)
  player_numbers = []
  game_hash.each do |location, team_hash|
    if team_hash[:team_name] == team
        team_hash[:players].each do |player_name, player_hash|
          player_numbers << player_hash[:number]
        end
    end
  end
  player_numbers
end

def player_stats(name)
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player_name, player_hash|
          if player_name == name
              return player_hash
          end
    end
  end
end

def big_shoe_rebounds
  player_shoe = 0
  player_rebounds = 0
  game_hash.each do |location, team_hash|
    team_hash[:players].each do |player_name, player_data|
        if player_data[:shoe] > player_shoe
          player_shoe = player_data[:shoe]
          player_rebounds = player_data[:rebounds] 
        end
    end
  end
  player_rebounds
end