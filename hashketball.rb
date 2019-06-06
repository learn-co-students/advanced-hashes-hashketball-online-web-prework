require 'pry'

def game_hash
  teams_hash = { 
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
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
      colors: ["Turquoise", "Purple"],
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
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player, stats|
          if player == player_name
            return stats[:points]
          end 
        end 
      end 
    end 
  end 
end 

def shoe_size(player_name)
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player, stats|
          if player == player_name
            return stats[:shoe]
          end 
        end 
      end 
    end 
  end 
end 

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors] 
    end 
  end 
end 

def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end 
end 

def player_numbers(team_name)
  num_array = []
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player, stats|
            num_array << stats[:number]
          end 
        end 
      end 
    end 
  end 
  num_array
end 

def player_stats(player_name)
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player, stats|
          if player == player_name
            return stats 
          end 
        end 
      end 
    end 
  end 
end 

def big_shoe_rebounds
  #find the player with the largest shoe shoe_size
  big_shoe = ""
  shoe_sizes = []
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players 
        data.each do |player, stats|
          shoe_sizes << stats[:shoe]
          big_shoe = shoe_sizes.max
          if stats[:shoe] == big_shoe
            return stats[:rebounds]
          end 
        end 
      end 
    end 
  end 
end 
#this is wrong ^, it should be done the same way as most_points_scored

def most_points_scored
  high_points = ""
  player_with_points = ""
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players 
        data.each do |player, stats|
          if high_points == ""
            high_points = stats[:points]
            player_with_points = player 
          elsif stats[:points] > high_points
            high_points = stats[:points]
            player_with_points = player 
          end 
        end 
      end 
    end 
  end 
  player_with_points
end 
            
def winning_team
  away_points = ""
  home_points = ""
  away_team = ""
  home_team = ""
  game_hash.each do |place, team|
    if place == :home
      home_team = team[:team_name]
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player, stats|
            if home_points == ""
              home_points = stats[:points]
            else 
              home_points += stats[:points]
            end 
          end 
        end 
      end 
    end 
    if place == :away
      away_team = team[:team_name]
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player, stats|
            if away_points == ""
              away_points = stats[:points]
            else
              away_points += stats[:points]

            end 
          end 
        end 
      end 
    end 
  end 
  if away_points > home_points
    return away_team
  else
    return home_team
  end 
end

def player_with_longest_name
  long_name = ""
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players 
        data.each do |player, stats|
          if long_name == ""
            long_name = player 
          elsif player.length > long_name.length
            long_name = player 
          end 
        end 
      end 
    end 
  end 
  long_name
end 
          
def long_name_steals_a_ton?
  #returns true if result of player_with_longest_name == most_steals 
  most_steals = ""
  player_with_most_steals = ""
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player, stats|
          if most_steals == ""
            most_steals = stats[:steals]
            player_with_most_steals = player 
          elsif stats[:steals] > most_steals
            most_steals = stats[:steals]
            player_with_most_steals = player 
          end 
        end 
      end 
    end 
  end 
  player_with_longest_name == player_with_most_steals
end 