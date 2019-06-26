require "pry"

def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        "Alan Anderson" => {
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
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
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
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
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
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
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
        "Kemba Walker" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
        ]
    }
  }
end

def num_points_scored(player)
  if game_hash[:home][:players][0].has_key?(player)
    game_hash[:home][:players][0][player][:points]
  else
    game_hash[:away][:players][0][player][:points]
  end
end

def shoe_size(player)
  if game_hash[:home][:players][0].has_key?(player)
    game_hash[:home][:players][0][player][:shoe]
  else
    game_hash[:away][:players][0][player][:shoe]
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
teams
end

def player_numbers(team)
  numbers= []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team 
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |data_container|
            data_container.each do |name, stats|
              numbers << stats[:number]
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_container|
          player_container.each do |name, stats|
            if name == player
              return stats
            end
            end
          end
        end
      end
    end
  nil
end

def big_shoe_rebounds
  biggest_shoes = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_container|
          player_container.each do |name, stats|
            if stats[:shoe] > biggest_shoes
              biggest_shoes = stats[:shoe]
              rebounds = stats[:rebounds]
              end
            end
          end
        end
      end
    end
rebounds
end

def most_points_scored
  most_points = 0
  player_with_most = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_container|
          player_container.each do |name, stats|
            if stats[:points] > most_points
              most_points = stats[:points]
              player_with_most = name
              end
            end
          end
        end
      end
    end
  player_with_most
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_container|
          player_container.each do |name, stats|
            if location == :home
              home_points += stats[:points]
            else 
              away_points += stats[:points]
            end
            end
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
  longest_name = ""
   game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_container|
          player_container.each do |name, stats|
            if name.length > longest_name.length
              longest_name = name
            end
            end
          end
        end
      end
    end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  most_steals_player = " "
   game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_container|
          player_container.each do |name, stats|
            if stats[:steals] > most_steals
              most_steals = stats[:steals]
              most_steals_player = name
            end
          end
          end
        end
      end
    end
  return most_steals_player == player_with_longest_name
end