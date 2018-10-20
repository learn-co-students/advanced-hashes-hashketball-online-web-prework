require 'pry'

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

#def good_practices
  #game_hash.each do |location, team_data|
    #binding.pry
    #team_data.each do |attribute, data|
      #binding.pry
      #data.each do |data_item|
        #binding.pry
      #end
    #end
  #end
#end

#good_practices

def num_points_scored(player_name)
  points = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.include?(player_name)
        points = data[player_name][:points]
      end
    end
  end
  points
end

def shoe_size(player_name)
  size = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.include?(player_name)
        size = data[player_name][:shoe]
      end
    end
  end
  size
end

def team_colors(team_name)
  colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
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
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data.each do |attribute, data|
        if data.class == Hash
          return data.collect do |data_item|
            data_item[1][:number]
          end
        end
      end
    end
  end
end

def player_stats(player_name)
  hash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.include?(player_name)
        hash = data[player_name]
      end
    end
  end
  hash
end

def big_shoe_rebounds
  rebounds_num = nil
  shoe_num = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data.class == Hash
        data.each do |data_item|
          #binding.pry
          if shoe_num == nil || data_item[1][:shoe] > shoe_num
            shoe_num = data_item[1][:shoe]
            rebounds_num = data_item[1][:rebounds]
          end
        end
      end
    end
  end
  rebounds_num
end
