require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black, White"],
      players: {
        "Alan Anderson"	=> {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez"	=> {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee"	=> {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },

  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise, Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if name == player_name
        return player_data[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if name == player_name
        return player_data[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    team_data[:colors].each do |color|
      if team == team_data[:team_name]
        return color.split(/, /)
      end
    end
  end
end

def team_names
  names_array = []
  game_hash.each do |location, team_data|
    team_data.each do |key, value|
      if key == :team_name
        names_array << value
      end
    end
  end
  return names_array
end

def player_numbers(team)
  numbers_array = []
  game_hash.each do |location, team_data|
    if team == team_data[:team_name]
      team_data[:players].each do |player_name, player_data|
        player_data.each do |key, value|
          if key == :number
            numbers_array << value
          end
        end
      end
    end
  end
  return numbers_array
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if name == player_name
        return player_data
      end
    end
  end
end

def big_shoe_rebounds
  shoe_sizes = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      player_data.each do |key, value|
        if key == :shoe
          shoe_sizes << value
        end
        if key == :shoe && value == shoe_sizes.sort[-1]
          return player_data[:rebounds]
        end
      end
    end
  end
end

# Bonus Questions:

def most_points_scored
  points_array = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      player_data.each do |key, value|
        if key == :points
          points_array << value
        end
      end
    end
  end
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if points_array.sort[-1] == player_data[:points]
        return player_name
      end
    end
  end
end

def winning_team
  home_points = 0
  away_points = 0
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      player_data.each do |key, value|
        if key == :points && location == :home
          home_points += value
        elsif
          key == :points && location == :away
          away_points += value
        end
      end
    end
  end
  if home_points > away_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  names_array = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      names_array << player_name
    end
  end
  names_array = names_array.sort_by {|x| x.length}
  return names_array.last
end

# Super Bonus:
# Write a method that returns true if the player with the longest name had the most steals.
def long_name_steals_a_ton?
  steals_array = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      player_data.each do |key, value|
        if key == :steals
          steals_array << value
        end
      end
    end
  end
  if player_stats(player_with_longest_name)[:steals] == steals_array.sort[-1]
  true
  end
end