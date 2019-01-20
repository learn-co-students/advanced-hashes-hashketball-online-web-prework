require 'pry'


def game_hash
{
    home:
      {team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
        }
      },

    away:
      {team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
        }
      }
  }
end

def num_points_scored(player)
  points_scored = 0
  game_hash.each_value do |team_val|
    team_val.each do |attribute, atr_val|
      if attribute == :players
        if atr_val.keys.include? (player)
          atr_val.each do |key, value|
            if player.upcase == key.upcase
            points_scored = value[:points]
            end
          end
        end
      end
    end
  end
  points_scored
end


def shoe_size(player)
  shoe_size = 0
  game_hash.each_value do |team_stats|
    team_stats.each do |attribute, atr_val|
      if attribute == :players
        if atr_val.keys.include? (player)
          atr_val.each do |key, value|
            if player.upcase == key.upcase
            shoe_size = value[:shoe]
            end
          end
        end
      end
    end
  end
  shoe_size
end


def team_colors(team_input)
  team_colors = []
  game_hash.each do |team, team_val|
    if game_hash[team][:team_name] == team_input
      team_colors = team_val[:colors]
    end
  end
  team_colors
end

def team_names
  team_names = []
  game_hash.each_key do |team|
    team_names << game_hash[team][:team_name]
  end
  team_names
end

def player_numbers(team_input)
binding.pry
end
