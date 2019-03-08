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
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      }
    }
  }
}
end

def num_points_scored(player_name)
  array = []
  game_hash.each do |location, data|
    data.each do |attribute, values|
      if attribute == :players
        values.each do |name, data|
          data.each do |key, stat|
            if name == player_name && key == :points
              array << stat
            end
          end
        end
      end
    end
  end
return array[0]
end

def shoe_size(player_name)
  array = []
  game_hash.each do |location, data|
    data.each do |attribute, values|
      if attribute == :players
        values.each do |name, data|
          data.each do |key, stat|
            if name == player_name && key == :shoe
              array << stat.to_i
            end
          end
        end
      end
    end
  end
return array[0]
end

def team_colors(team_name)
  if team_name == "Brooklyn Nets"
    game_hash[:home][:colors]
  elsif
    team_name == "Charlotte Hornets"
    game_hash[:away][:colors]
  end
end

def team_names
  array = []
  game_hash.each do |location, data|
    data.each do |attribute, values|
      if attribute == :team_name
        array << values
      end
    end
  end
  return array
end

def player_numbers(team)
  array = []
  game_hash.each do |location, data|
    if data[:team_name] == team
      data[:players].each do |name, stat|
        array << stat[:number]
      end
    else
      nil
    end
  end
  return array
end

def player_stats(player)
  stat_list = {}
  game_hash.each do |location, data|
    data[:players].each do |name, stat|
      if name == player
        stat.each do |key, value|
          stat_list[key] = value
        end
      else
        nil
    end
  end
end
  stat_list
end

def big_shoe_rebounds
  shoe_sizes = []
  rebounds = 0
  game_hash.each do |location, data|
    data[:players].each do |name, stat|
      shoe_sizes << stat[:shoe]
    end
  end
  shoe_sizes.sort! {|x, y| y <=> x}
  game_hash.each do |location, data|
    data[:players].each do |name, stat|
      if shoe_sizes[0] == stat[:shoe]
        rebounds += stat[:rebounds]
      else
        nil
      end
    end
  end
  rebounds
end
