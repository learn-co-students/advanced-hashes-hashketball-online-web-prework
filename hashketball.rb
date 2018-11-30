# Write your code here!
require 'pry'

def game_hash
  game = {
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

def num_points_scored(name)
  points = []
  game_hash.each do |team_origin, data_categories|
    data_categories[:players].each do |player, player_data|
      if player == name
        # switched to using a variable to return data outside the each method
        # why does an explicit return (return player_data[:points]) work here
        # but an implicit return does not?
        points << player_data[:points]
        end
    end
  end
  points.shift
end

def shoe_size(name)
  shoe_size = []
  game_hash.each do |team_origin, data_categories|
    data_categories[:players].each do |player, player_data|
      if player == name
        shoe_size << player_data[:shoe]
      end
    end
  end
  shoe_size.shift
end

def team_colors(team_name)
  team_colors = []
  game_hash.each do |team_origin, data_categories|
      if data_categories[:team_name] == team_name
          team_colors << game_hash[team_origin][:colors]
      end
  end
  team_colors.flatten
end

def team_names
  names = []
  game_hash.each do |team_origin, data_categories|
      names << data_categories[:team_name]
  end
    names
end

def player_numbers(team_name)
  player_num = []

  game_hash.each do |team_origin, data_categories|
    data_categories[:players].each do |player, stats|
      if data_categories[:team_name] == team_name
        player_num << data_categories[:players][player][:number]
      end
    end
  end

player_num.sort
end

#Build a method, player_stats, that takes in an argument of a player's name and
#returns a hash of that player's stats.


def player_stats(player_name)

  game_hash.each do |team_origin, data_categories|
    data_categories[:players].each do |player, stats|
        if player == player_name
          return data_categories[:players][player]

      end
    end
  end
end

#use .max once all shoe sizes are added to array

def big_shoe_rebounds
  biggest_shoe = 0
  big_shoe_name = ""


  game_hash.each do |team_origin, data_categories|
    data_categories[:players].each do |player, stats|
      if stats[:shoe] > biggest_shoe
        biggest_shoe = stats[:shoe]
        big_shoe_name = player
      end
    end
end


game_hash.each do |team_origin, data_categories|
  data_categories[:players].each do |player, stats|
    if player == big_shoe_name
    return data_categories[:players][player][:rebounds]
    end
  end
end

end
