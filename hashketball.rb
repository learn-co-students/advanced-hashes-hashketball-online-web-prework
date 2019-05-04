# Write your code here!
require "pry"

def game_hash 
   game_hash = {
     :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0, 
          :shoe =>  16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks =>1
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



def blah(player)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  puts player
  if home_players.key?(player)
    score = home_players[player][:points]
  else
    score = away_players[player][:points]
  end
  return score
end    
  
def num_points_scored (player)
  score = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, details|
          if name == player
           score = details[:points]
          end 
        end 
      end 
    end 
  end 
  score
end




def shoe_size(player)
 player_shoe_size = 0
 game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, details|
          if name == player
            player_shoe_size = details[:shoe]
          end
        end
      end
    end
 end
 player_shoe_size
 end
  

def team_colors(team)
colors = []
 game_hash.each do |location, team_data|
  if team_data.has_value?(team)
      colors << team_data[:colors]
   end
 end
 colors.flatten
end

 
def team_names
  team_array = []
  game_hash.each do |location, team_data|
    team_array << team_data[:team_name]
  end
  team_array
end

def player_numbers(team)
  number_array = []
  game_hash.each do |location, team_data|
    if team_data.has_value?(team)
    team_data.each do |attribute, data|
      if attribute == :players
       data.each do |name, details|
         number_array <<  details[:number]
       end 
      end
    end
  end
end
number_array
end

def player_stats(player)
  players_hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, details|
          #puts details
          if name == player
           players_hash = details
          end
        end
      end
    end
  end
 players_hash
end

def big_shoe_rebounds
  shoe_array = []
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, details|
          shoe_array <<  details[:shoe]
          if shoe_array.max
            rebounds = details[:rebounds]
          end
           
        end
      end
    end
  end
 rebounds
end 

def most_points_scored
 highest_points = 0
 player_highest_points = ""
 game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, details|
          if highest_points < details[:points]
            player_highest_points = name
            highest_points = details[:points]
          end
        end
      end
    end
  end
  player_highest_points
end

def winning_team
  total_points_home = 0
  total_points_away = 0 
  game_hash.each do |location, team_data|
    if location == :home
     team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, details|
          if details[:points] > 0 
            total_points_home += details[:points]
          end
        end
      end
     end
    else
      if location == :away
        team_data.each do |attribute, data|
          if attribute == :players
            data.each do |name, details|
              if details[:points] > 0 
               total_points_away += details[:points]
              end
            end
          end
        end
      end
   end
 end
 if total_points_home > total_points_away
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end
 
 
 def player_with_longest_name 
   player_longest_name = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, details|
          if  name.chars.count > player_longest_name.chars.count 
            player_longest_name = name 
          end
        end
      end
    end
  end
  player_longest_name
 end
 
 def highest_number_steals
 most_steals = 0
 player_with_most_steals = ""
 game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, details|
          if most_steals < details[:steals]
            player_with_most_steals = name
            most_steals = details[:steals]
          end
        end
      end
    end
  end
 player_with_most_steals
 end
 
 def long_name_steals_a_ton?
   if highest_number_steals == player_with_longest_name
     return true 
   end
end