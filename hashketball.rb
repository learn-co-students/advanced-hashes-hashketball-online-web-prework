# Write your code here!

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

#binding.pry

def num_points_scored (player)
  points = ""
  game_hash.each do |location, team_data|
    #binding.pry
    team_data.each do |attribute, data|
      #binding.pry
      if data.class == Hash && game_hash[location][attribute].has_key?(player)
         points = game_hash[location][attribute][player][:points]
      end
    end
  end
  points
end

def shoe_size (player)
  shoe = ""
  game_hash.each do |location, team_data|
    #binding.pry
    team_data.each do |attribute, data|
      #binding.pry
      if data.class == Hash && game_hash[location][attribute].has_key?(player)
          shoe = game_hash[location][attribute][player][:shoe]
      end
    end
  end
  shoe
end

def team_colors (teamname)
    colors_team = []
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if teamname == game_hash[location][attribute]
          #binding.pry
          colors_team = game_hash[location][:colors]
          #binding.pry
        end
      end
    end
    colors_team
  end
          

def team_names
  names = []
  game_hash.each do |location, team_data|
      names << (game_hash[location][:team_name])
  end
  #binding.pry --> tested is correct
  names
end

def player_numbers (team_name)
  numbers = []
  game_hash.each do |location, team_data|
     team_data.each do |team_attribute, attribute_value|
       #binding.pry
       if team_attribute == :team_name && team_name == attribute_value
         #binding.pry 
         team_data[:players].each do |name, player_data|
           numbers << player_data[:number]
         #binding.pry    
         end  
       end
      # if attribute_value.class == Hash && team_name == (game_hash[location][team_attribute]) 
      #     #binding.pry
      #     data1.each do |name, data2|
      #       #binding.pry
      #       numbers << game_hash[location][attribute][name][:number]
      #     end
      # end
     end
  end
  numbers
  #binding.pry
end

def player_stats(player)
  stats = ""
  game_hash.each do |location, team_data|
    team_data.collect do |attribute, data|
      if data.class == Hash && game_hash[location][attribute].has_key?(player)
         stats = game_hash[location][attribute][player]
      end
    end
  end
  stats
end

def big_shoe_rebounds
  shoes = []
  rebounds = ""
  game_hash.each do |location, team_data|
     team_data.each do |attribute, data1|
        if data1.class == Hash
            data1.each do |name, data2|
              shoes << game_hash[location][attribute][name][:shoe]
              if game_hash[location][attribute][name][:shoe] == shoes.max
                 rebounds = game_hash[location][attribute][name][:rebounds]
              end
            end
        end
     end
  end
  rebounds
end


