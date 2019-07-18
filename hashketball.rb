

require 'pry'

# Write your code here!
def game_hash
  hash = {
    home:
      {
        team_name: 'Brooklyn Nets',
        colors: %w[Black White],
        players: [
          {
            name: 'Alan Anderson',
            number: 0,
            shoe: 16,
            points: 22,
            rebounds: 12,
            assists: 12,
            steals: 3,
            blocks: 1,
            slam_dunks: 1
          },
          {
            name: 'Reggie Evans',
            number: 30,
            shoe: 14,
            points: 12,
            rebounds: 12,
            assists: 12,
            steals: 12,
            blocks: 12,
            slam_dunks: 7
          },
          {
            name: 'Brook Lopez',
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
          },
          {
            name: 'Mason Plumlee',
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 11,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5
          },
          {
            name: 'Jason Terry',
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
    away:
        {
          team_name: 'Charlotte Hornets',
          colors: %w[Turquoise Purple],
          players: [
            {
              name: 'Jeff Adrien',
              number: 4,
              shoe: 18,
              points: 10,
              rebounds: 1,
              assists: 1,
              steals: 2,
              blocks: 7,
              slam_dunks: 2
            },
            {
              name: 'Bismack Biyombo',
              number: 0,
              shoe: 16,
              points: 12,
              rebounds: 4,
              assists: 7,
              steals: 22,
              blocks: 15,
              slam_dunks: 10
            },
            {
              name: 'DeSagna Diop',
              number: 2,
              shoe: 14,
              points: 24,
              rebounds: 12,
              assists: 12,
              steals: 4,
              blocks: 5,
              slam_dunks: 5
            },
            {
              name: 'Ben Gordon',
              number: 8,
              shoe: 15,
              points: 33,
              rebounds: 3,
              assists: 2,
              steals: 1,
              blocks: 1,
              slam_dunks: 0
            },
            {
              name: 'Kemba Walker',
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

def num_points_scored(name)
  home_players = game_hash[:home][:players]
  home_players.each do |player|
    return player[:points] if name == player[:name]
  end
  away_players = game_hash[:away][:players]
  away_players.each do |player|
    return player[:points] if name == player[:name]
  end
end

def shoe_size(name)
  home_players = game_hash[:home][:players]
  home_players.each do |player|
    return player[:shoe] if name == player[:name]
  end
  away_players = game_hash[:away][:players]
  away_players.each do |player|
    return player[:shoe] if name == player[:name]
  end
end

def team_colors(name)
  return game_hash[:home][:colors] if game_hash[:home][:team_name] == name
  return game_hash[:away][:colors] if game_hash[:away][:team_name] == name
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  numbers = []
  players = game_hash[:home][:players] if game_hash[:home][:team_name] == team_name
  players = game_hash[:away][:players] if game_hash[:away][:team_name] == team_name
  players.each do |player|
    numbers << player[:number]
  end
  numbers
end

def player_stats(name)
  game_hash.each do |_location, team_data|
    team_data.each do |key, value|
      next unless key == :players

      value.each do |player|
        if player[:name] == name
          return {
            assists: player[:assists],
            blocks: player[:blocks],
            number: player[:number],
            points: player[:points],
            rebounds: player[:rebounds],
            shoe: player[:shoe],
            slam_dunks: player[:slam_dunks],
            steals: player[:steals]
          }
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_player = {}
  largest_shoe = 0
  game_hash.each do |_location, data|
    data.each do |key, value|
      next unless key == :players

      value.each do |player|
        if player[:shoe] > largest_shoe
          largest_shoe_player = player
          largest_shoe = player[:shoe]
        end
      end
    end
  end
  largest_shoe_player[:rebounds]
end

def most_points_scored
  player_most_points = {}
  most_points = 0
  game_hash.each do |_location, data|
    data.each do |key, value|
      next unless key == :players

      value.each do |player|
        if player[:points] > most_points
          player_most_points = player
          most_points = player[:points]
        end
      end
    end
  end
  player_most_points[:name]
end

def winning_team
  home_points = []
  away_points = []
  game_hash.each do |location, data|
    if location == :home
      data.each do |key, value|
        next unless key == :players

        value.each do |player|
          home_points << player[:points]
        end
      end
    elsif location == :away
      data.each do |key, value|
        next unless key == :players

        value.each do |player|
          away_points << player[:points]
        end
      end
    end
  end
  return game_hash[:home][:team_name] if home_points.inject(0) { |sum, x| sum + x } > away_points.inject(0) { |sum, x| sum + x }
  return game_hash[:away][:team_name] if away_points.inject(0) { |sum, x| sum + x } > home_points.inject(0) { |sum, x| sum + x }
end

def player_with_longest_name
  longest_name = ''
  longest_value = 0
  game_hash.each do |_location, data|
    data.each do |key, value|
      next unless key == :players

      value.each do |player|
        if player[:name].length > longest_value
          longest_name = player[:name]
          longest_value = player[:name].length
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  player_longest_name = {}
  game_hash.each do |_location, data|
    data.each do |key, value|
      next unless key == :players

      value.each do |player|
        if player[:name] == player_with_longest_name
          player_longest_name = player
        end
        most_steals = player[:steals] if player[:steals] > most_steals
      end
    end
  end
  player_longest_name[:steals] == most_steals
end