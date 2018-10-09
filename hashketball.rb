# Write your code here!

require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: {
        'Alan Anderson' => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        'Reggie Evans' => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        'Brook Lopez' => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        'Mason Plumlee' => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        'Jason Terry' => {
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
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players: {
        'Jeff Adrien' => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        'Bismak Biyombo' => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        'DeSagna Diop' => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        'Ben Gordon' => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        'Brendan Haywood' => {
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

def all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def num_points_scored(name)
  all_players[name][:points]
end

def shoe_size(name)
  all_players[name][:shoe]
end
    
def team_colors(name)
  game_hash.map do |side, team_hash|
    if team_hash[:team_name] == name
      return team_hash[:colors]
    end
  end
end

def team_names
  game_hash.map do |side, team_hash|
    team_hash[:team_name]
  end
end

def player_numbers(team)
  numbers = []
  game_hash.each do |side, team_hash|
    if team_hash[:team_name] == team 
      team_hash[:players].map do |player, pl_hash|
        numbers.push(pl_hash[:number])
      end
    end
  end
  numbers
end

def player_stats(name)
  all_players[name]
end

def big_shoe_rebounds
  shoes = {}
  all_players.each do |player, stats|
    shoes[player] = stats.fetch(:shoe)
  end
  big_shoe = shoes.sort_by { |player, shoe_size| shoe_size }[-1][0]
  # binding.pry
  all_players.fetch(big_shoe).fetch(:rebounds)
end

def most_points_scored
  points = {}
  all_players.each do |player, stats|
    points[player] = stats.fetch(:points)
  end
  points.sort_by { |player, points| points }[-1][0]
end

def winning_team
  scores = []
  game_hash.each do |side, team_hash|
    score_hash = { name: team_hash.fetch(:team_name), score: 0 }
    team_hash.fetch(:players).each do |player, stats|
       score_hash[:score] += stats.fetch(:points)
    end
    scores.push score_hash
  end
  winner = scores.max_by { |score_hash| score_hash.fetch(:score) }.fetch(:name)
end

def player_with_longest_name
  all_players.max_by { |player, stat_hash| player.length }[0]
end

def player_with_most_steals
  all_players.max_by { |player, stat_hash| stat_hash.fetch(:steals) }[0]
end

def long_name_steals_a_ton?
  player_with_most_steals == player_with_longest_name 
end
  