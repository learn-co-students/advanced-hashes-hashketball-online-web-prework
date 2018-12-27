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

def num_points_scored(player_name)
  points_scored = 0
  game_hash.each do |team, data|
    data.each do |team_data, player|
      if team_data == :players
        player.each do |bball, stats|
          if player_name == bball
            stats.each do |cat, num|
              if cat == :points
                points_scored = num
              end
            end
          end
        end
      end
    end
  end
  points_scored
end

def shoe_size(player_name)
  shoe_size = 0
  game_hash.each do |team, data|
    data.each do |team_data, player|
      if team_data == :players
        player.each do |bball, stats|
          if player_name == bball
            stats.each do |cat, num|
              if cat == :shoe
                shoe_size = num
              end
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team_name)
  color = []
  game_hash.each do |team, data|
    if data.values[0] == team_name
      data.each do |team_details, team_data|
        if team_details == :colors
          color << team_data
        end
      end
    end
  end
  color.flatten(1)
end


def team_names
  name = []
  game_hash.each do |team, data|
    name << data.values[0]
  end
  name
end

def player_numbers(team_name)
  jersey_number = []
  game_hash.each do |team, data|
    if data.values[0] == team_name
      data.each do |team_details, team_data|
        if team_details == :players
          team_data.each do |player, stats|
            jersey_number << stats.values[0]
          end
        end
      end
    end
  end
  jersey_number
end

def player_stats(player_name)
  player_stat = {}
  game_hash.each do |team, data|
    data.each do |team_data, player|
      if team_data == :players
        player.each do |bball, stats|
          if player_name == bball
            player_stat = stats
          end
        end
      end
    end
  end
  player_stat
end

player_stats("Alan Anderson")

def big_shoe_rebounds
  player_shoe_size = 0
  rebounds = 0
  game_hash.each do |team, data|
    data.each do |team_data, team_info|
      if team_data == :players
        team_info.each do |player, stats|
          if stats.values[1] > player_shoe_size
            player_shoe_size = stats.values[1]
            rebounds = stats.values[3]
          end
        end
      end
    end
  end
  rebounds
end
