require 'pry'

# Define teams hash with names, colors, and players
def game_hash
  teams = {
    :home => {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"],
      :players => {
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
    :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"],
      :players => {
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

# Return number of points scored for input player
def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data[:players].each { |name, stats| return stats[:points] if name == player }
  end
end

# Return shoe size for input player
def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each { |name, stats| return stats[:shoe] if name == player }
  end
end

# Return color for input team
def team_colors(team)
  game_hash.each { |location, team_data| return team_data[:colors] if team_data[:team_name] == team }
end

# Return array of team names
def team_names
  name_array = []
  game_hash.each { |location, team_data| name_array << team_data[:team_name] }
  name_array
end

# Return array of jersey numbers for input team
def player_numbers(team)
  jersey_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each { |name, stats| jersey_array << stats[:number] }
    end
  end
  jersey_array
end

# Return hash of input player's stats
def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each { |name, stats| return stats if name == player }
  end
end

# Return number of rebounds of player with largest shoe size
def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats| 
      if stats[:shoe] > shoe_size
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end
  rebounds
end

# Return player with most points
def most_points_scored
  most_points = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats| 
      if stats[:points] > most_points
        most_points = stats[:points]
        player = name
      end
    end
  end
  player
end

# Return team with the most points
def winning_team
  total_points = 0
  points_hash = { }

  # Add points from each player to team hash
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats| 
      total_points = stats[:points] + total_points
    end
    
    # Store team points
    points_hash[location] = total_points
    
    # Reset point total
    total_points = 0
  end
  
  # Compare team points
  if points_hash[:away] < points_hash[:home]
    return game_hash[:home][:team_name]
  else 
    return game_hash[:away][:team_name]
  end
end

# Return player with longest name
def player_with_longest_name
  most_chars = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats| 
      if name.size > most_chars
        most_chars = name.size
        player = name
      end
    end
  end
  player
end

# Return true if player with the longest name had the most steals
def long_name_steals_a_ton?
  # Find player with most steals
  most_steals = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats| 
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        player = name
      end
    end
  end
  
  # Compare player with player with longest name
  return true if player == player_with_longest_name
end
