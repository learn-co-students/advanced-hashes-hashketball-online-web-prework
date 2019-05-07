require 'pry'

def game_hash
  hashketball = {
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
          :slam_dunks => 1,
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
          :slam_dunks => 15,
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
  game_hash.each do |team, data|
    data[:players].each do |attribute, value|
        if attribute == player_name
          return value[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |team, data|
    data[:players].each do |attribute, value|
      if attribute == player_name
        return value[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  if team_name == "Brooklyn Nets"
    game_hash[:home][:colors].collect do |color|
      color
    end
  elsif team_name == "Charlotte Hornets"
    game_hash[:away][:colors].collect do |color|
      color
    end
  end
end


def team_names
  game_hash.collect do |team, data|
    data[:team_name]
  end
end

def player_numbers(team_name)
  if team_name == "Brooklyn Nets"
    game_hash[:home][:players].collect do |attribute, value|
      value[:number]
    end
  elsif team_name == "Charlotte Hornets"
    game_hash[:away][:players].collect do |attribute, value|
      value[:number]
    end
  end
end

def player_stats(player_name)
  game_hash.each do |team, data|
    data[:players].each do |attribute, value|
      if attribute == player_name
        return value
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = nil
  rebounds = nil
  game_hash.each do |team, data|
    data[:players].each do |attribute, value|
        value.each do |group, stat|
        if group == :shoe
          if shoe_size == nil || shoe_size < value[:shoe]
            shoe_size = value[:shoe]
            rebounds = value[:rebounds]
          end
        end
      end
    end
  end
  rebounds
end
