def game_hash
  game_hash = {
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
    team_data[:players].each do |player_name, player_stats|
      if player_name == name 
        return player_stats[:points]
      end
    end 
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_name == name 
        return player_stats[:shoe]
      end
    end 
  end
end

def team_colors(name)
  game_hash.each do |location, team_data|
    if name == team_data[:team_name]
      return team_data[:colors]
    end 
  end
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_names << team_data[:team_name]
  end
  team_names
end

def player_numbers(name)
  jersey_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name 
      team_data[:players].each do |player_name, player_stats|
        jersey_numbers << player_stats[:number]
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == player_name
        return player_stats
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0 
  rebounds = 0 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_stats[:shoe] > shoe_size
        shoe_size = player_stats[:shoe]
        rebounds = player_stats[:rebounds]
      end
    end
  end
  rebounds
end 

# Bonus Questions:

def most_points_scored
  points = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_stats[:points] > points
        points = player_stats[:points]
        player = player_name
      end
    end
  end
  player
end

def winning_team
  home_points = 0 
  away_points = 0 
  game_hash.each do |location, team_data|
    if location = :home 
      team_data[:players].each do |player_name, player_stats|
        home_points = home_points + player_stats[:points]
      end
    elsif location = :away
      team_data[:players].each do |player_name, player_stats|
        away_points = away_points + player_stats[:points]
      end
    end
  end 
  if home_points > away_points
     return game_hash[:home][:team_name]
  elsif away_points > home_points
     return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  return_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_name.length > return_name.length
        return_name = player_name
      end
    end
  end
  return_name
end

# Super Bonus:

def long_name_steals_a_ton?
  player = ""
  steals_tracker = 0 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if player_stats[:steals] > steals_tracker
        player = player_name
        steals_tracker = player_stats[:steals]
      end
    end
  end 
  if player == player_with_longest_name
    return true
  end 
end 

    
      
    
      

        
      




