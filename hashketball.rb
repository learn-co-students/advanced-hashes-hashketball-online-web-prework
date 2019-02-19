require "pry"

def game_hash
  {
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

# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#       team_data.each do |attribute, data|
#         #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#         binding.pry
 
#         #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#         data.each do |data_item|
#             binding.pry
#       end
#     end
#   end
# end

# good_practices

def num_points_scored(player_name)
  player_points = nil
  
  game_hash.each do |location, team_data|
    team_data.each do |ind_data, attributes|
      if attributes.class == Hash 
        if attributes.keys.include?(player_name)
          player_points = attributes[player_name][:points]
        end
      end
    end
  end
  player_points
end

def shoe_size(player_name)
  player_shoe = nil
  
  game_hash.each do |location, team_data|
    team_data.each do |ind_data, attributes|
      if attributes.class == Hash 
        if attributes.keys.include?(player_name)
          player_shoe = attributes[player_name][:shoe]
        end
      end
    end
  end
  player_shoe
end

def team_colors(name_of_team)
  colors = nil
  
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name_of_team
      colors = team_data[:colors]
    end
  end
  colors
end

def team_names

  game_hash.collect do |location, team_data|
      team_data[:team_name]
  end
end

def player_numbers(team_name)
  game_hash.collect do |location, team_data|

    if team_data[:team_name].include?(team_name)
      team_data[:players].collect do |player, stats|
        stats[:number]
      end
    end
  end.flatten.compact.sort!
end

def player_stats(name)
  game_hash.each do |location, team_data|
    if team_data[:players].keys.include?(name)
      return team_data[:players][name]
    end
  end
end

def big_shoe_rebounds
  largest_shoe = 0
  rebounds = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |data, attributes|
      if attributes[:shoe] > largest_shoe
        largest_shoe = attributes[:shoe]
        rebounds = attributes[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  player_most_points = nil
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, attributes|
      if attributes[:points] >= most_points
        most_points = attributes[:points]
        player_most_points = player
      end
    end
  end
  
  player_most_points
  
end
      
def winning_team
  most_points = 0
  winner = nil
  
  game_hash.each do |location, team_data|
    team_points = 0
    team_data[:players].each do |player, attributes|
      team_points += attributes[:points]
    end

    if team_points > most_points 
      most_points = team_points
      winner = team_data[:team_name]
    end
  end
  winner
end

def player_with_longest_name
  longest_name = ""
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attributes|
      if name.size > longest_name.size
        longest_name = name
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  most_steals_player = ""
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attributes|
      if attributes[:steals] >= most_steals
        most_steals = attributes[:steals]
        most_steals_player = name
      end
    end
  end
  return true if player_with_longest_name == most_steals_player
end
  