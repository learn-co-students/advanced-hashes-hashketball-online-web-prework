# Write your code here!
require 'pry'
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number=> 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, 
        "Reggie Evans" => {
          :number=> 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number=> 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number=> 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number=> 31,
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
          :number=> 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number=> 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number=> 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number=> 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number=> 33,
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
  game_hash.each do |home_away, data|
    data.each do |att, value|
      if att == :players
        value.each do |name, stats|
          if name == player_name
            stats.each do |stat, val|
              if stat == :points
                return val
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
    game_hash.each do |home_away, data|
    data.each do |att, value|
      if att == :players
        value.each do |name, stats|
          if name == player_name
            stats.each do |stat, val|
              if stat == :shoe
                return val
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  x = 0
  game_hash.each do |home_away, data|
    data.each do |att, value|
      if att == :team_name
        if value == team_name
          x = 1
        end
      elsif att == :colors && x == 1
        return value
      end
    end
  end
end

def team_names
  array = []
  game_hash.each do |home_away, data|
    data.each do |att, value|
      if att == :team_name
        array << value
      end
    end
  end
  array
end

def player_numbers(team_name)
  array = []
  x = 0
  game_hash.each do |home_away, data|
    data.each do |att, value|
      if att == :team_name
        if value == team_name
          x = 1
        else 
          x = 0
        end
      elsif att == :players && x == 1
        value.each do |a, b|
          b.each do |c, d|
            if c == :number
              array << d
            end
          end
        end
      end
    end
  end
  array
end

def player_stats(player_name)
  game_hash.each do |home_away, data|
    data.each do |att, value|
      if att == :players
        value.each do |name, stats|
          if name == player_name
            return stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_size = 0 
  player_rebounds = 0
  x = 0
  game_hash.each do |home_away, data|
    data.each do |att, value|
      if att == :players
        value.each do |name, stats|
            player_name = name
            stats.each do |stat, val|
              if stat == :shoe
                if val > 0 
                  largest_shoe_size = val 
                  x = 1
                end
              elsif stat == :rebounds && x == 1 
                player_rebounds = val
              end
            end
        end
      end
    end
  end
  return player_rebounds
end
  



