require "pry"

def game_hash
  the_game_hash = {
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


def num_points_scored(player)
  game_hash.each do |home_or_away, details|
    details[:players].each do |name, values|
      return values[:points] if name == player
    end
  end
end

def shoe_size(player)
  game_hash.each do |home_or_away, details|
    details[:players].each do |name, values|
      return values[:shoe] if name == player
    end
  end
end

def team_colors(team_name)
  game_hash.each do |home_or_away, details|
    return details[:colors] if details[:team_name] == team_name
  end
end


def team_names
  game_hash.collect do |home_or_away, details|
    details[:team_name]
  end
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |home_or_away, details|
    if details[:team_name] == team_name
      details[:players].each do |name, stats|
         numbers << stats[:number]
      end
    end
  end
  numbers
end


def player_stats(player_name)
  output = {}
  game_hash.each do |home_or_away, details|
    details[:players].each do |name, stats|
      if name == player_name
        output = stats
      end
    end
  end
  output
end


def big_shoe_rebounds
  players = []
  game_hash.each do |home_or_away, details|
    details[:players].each do |name, stats|
      players << stats
    end
  end
  players.sort_by! do |player|
    player[:shoe]
  end
  players[-1][:rebounds]
end

# def big_shoe_rebounds
#   bigfoot = {shoe: 0}
#   game_hash.each do |home_or_away, details|
#     details[:players].each do |name, stats|
#       if stats[:shoe] > bigfoot[:shoe]
#         bigfoot = stats
#       end
#     end
#   end
#   bigfoot[:rebounds]



#Build a method, `player_numbers`, that takes in an argument of a team name and returns an array of the jersey number's for that team.
# Build a method, `player_stats`, that takes in an argument of a player's name and returns a hash of that player's stats.

# def num_points_scored(player)
#   game_hash.each do |type, stats|
#     stats.each do |key, value|
#       if value == :players
#         value.each do |name, detail|
#           detail.each do |stat, num|
#             if name == player && stat == :points
#                 puts "#{:points}"
#               end
#             end
#           end
#         end
#       end
#     end
#   end


# def shoe_size(name)
#   game_hash.each do |team_type, name|
#     name.each do |shoe|
#       puts name[:shoe]
#     end
#   end
