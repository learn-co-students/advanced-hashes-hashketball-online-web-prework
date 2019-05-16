# Write your code here!
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

def find_the_player(name)
  game_hash.each do |location, team|
    team[:players].each do |player, details|
      return details if player == name
    end
  end
end

def find_the_team(team_name)
  game_hash.each do |location, team|
    return team if team[:team_name] == team_name
  end
end

def num_points_scored(player)
  player = find_the_player(player)
  player[:points]
end

def shoe_size(player)
  player = find_the_player(player)
  player[:shoe]
end

def team_colors(team)
  team = find_the_team(team)
  team[:colors]
end

def team_names
  game_hash.map do |location, team_attributes|
    team_attributes[:team_name]
  end
end

def player_numbers(team_name)
  team = find_the_team(team_name)
  team[:players].map do |player, attributes|
    attributes[:number]
  end
end

def player_stats(given_player)
  find_the_player(given_player)
end

def big_shoe_rebounds
  shoe_sizes = {}

  game_hash.each do |location, team_details|
    team_details[:players].each do |player, player_details|
      shoe_sizes[player] = player_details[:shoe]
    end
  end

  biggest_shoe_size_stats = find_the_player(shoe_sizes.key(shoe_sizes.values.max))
  biggest_shoe_size_stats[:rebounds]
end

def most_points_scored
    points_scored = {}

    game_hash.each do |location, team_details|
      team_details[:players].each do |player, player_details|
        points_scored[player] = player_details[:points]
      end
    end

    points_scored.key(points_scored.values.max)
end

def winning_team
  final_score = {}
  game_hash.each do |location, team_details|
    team_score = []

    team_details[:players].each do |player, player_details|
      team_score << player_details[:points]
    end
    final_score[team_details[:team_name]] = team_score.sum
  end
  final_score.key(final_score.values.max)
end

def player_with_longest_name
  players = []

  game_hash.each do |location, team_details|
    team_details[:players].each do |player, player_details|
      players << player
    end
  end

  players = players.sort do |a, b|
    a.size <=> b.size
  end

  players[-1]
end

def long_name_steals_a_ton?
  steals = {}

  game_hash.each do |location, team_details|
    team_details[:players].each do |player, player_details|
      steals[player] = player_details[:steals]
    end
  end

  if steals.key(steals.values.max) == player_with_longest_name
    return true
  else
    return false
  end

end
