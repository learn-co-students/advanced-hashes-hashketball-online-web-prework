# Write your code here!
def game_hash
  game = {
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
  
  return game
end 

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    if team_data[:players].has_key?(player_name)
      return team_data[:players][player_name][:points]
    end 
  end 
end 

def shoe_size(player_name)
  game_hash.each do |location, team_data|
    if team_data[:players].has_key?(player_name)
      return team_data[:players][player_name][:shoe]
    end 
  end 
end 

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data.has_value?(team_name)
      return team_data[:colors]
    end 
  end 
end 

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams.push(team_data[:team_name])
  end 
  return teams
end 

def player_numbers(team_name)
  jerseys = []
  game_hash.each do |location, team_data|
    if team_data.has_value?(team_name)
      team_data[:players].each do |player, player_data|
        jerseys.push(player_data[:number])
      end 
    end 
  end 
  return jerseys
end 

def player_stats(player_name)
  game_hash.each do |location, team_data|
    if team_data[:players].has_key?(player_name)
      return team_data[:players][player_name]
    end 
  end 
end 

def big_shoe_rebounds
  largest_shoe_size = nil
  largest_shoe_rebounds = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if largest_shoe_rebounds == nil
        largest_shoe_size =  shoe_size(player_name)
        largest_shoe_rebounds = player_data[:rebounds]
      elsif largest_shoe_size < shoe_size(player_name)
        largest_shoe_size =  shoe_size(player_name)
        largest_shoe_rebounds = player_data[:rebounds]
      end 
    end 
  end 
  return largest_shoe_rebounds
end 

def most_points_scored
  highest_score = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_data|
      if highest_score == nil
        highest_score =  player_data[:points]
      elsif highest_score < player_data[:points]
        highest_score =  player_data[:points]
      end 
    end 
  end 
  return highest_score
end 

def winning_team
  team_array = []
  score = nil
  
  game_hash.each do |location, team_data|
      team_scores = {}
    team_data[:players].each do |player_name, player_data|
      if score == nil
        score =  player_data[:points]
      else
        score +=  player_data[:points]
      end 
    end 
      team_scores[:team_name] = team_data[:team_name]
      team_scores[:score] = score
      team_array.push(team_scores)
      score = 0
  end 
  
  team_array[0][:score] > team_array[1][:score] ? team_array[0][:team_name] : team_array[1][:team_name]
  
end 

def player_with_longest_name
  highest_name_length = nil
  name = nil
  
  game_hash.each do |location, team_data|
      player_name_and_length = {}
    team_data[:players].each do |player_name, player_data|
      if highest_name_length == nil
        highest_name_length = player_name.to_s.length
        name = player_name.to_s
      elsif highest_name_length < player_name.to_s.length
         highest_name_length = player_name.to_s.length
         name = player_name.to_s
      end 
    end 
  end 
  
  return name
end 


def long_name_steals_a_ton?
  steals = nil
  name = nil
  
  game_hash.each do |location, team_data|

    team_data[:players].each do |player_name, player_data|
      if steals == nil
        steals =  player_data[:steals]
        name = player_name.to_s
      elsif steals < player_data[:steals]
        steals =  player_data[:steals]
        name = player_name.to_s
      end 
    end 
  end 
  
  if player_with_longest_name == name
    return true
  else 
    return false
  end 
end 

