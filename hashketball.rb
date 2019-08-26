# Write your code here!
require "pry"

def game_hash
  
  hashketball = {
    home: {
      team_name: "Brooklyn Nets" ,
      colors: ["Black", "White"] ,
      players: [
        {"Alan Anderson" => {
          number: 0 ,
          shoe: 16 ,
          points: 22 ,
          rebounds: 12 ,
          assists: 12,
          steals: 3,
          blocks: 1 ,
          slam_dunks: 1 }
        },
        {"Reggie Evans" => {
          number: 30 ,
          shoe: 14 ,
          points: 12 ,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7}
        },
        {"Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10 ,
          steals: 3 ,
          blocks: 1 ,
          slam_dunks: 15}
        },
        {"Mason Plumlee" => {
          number: 1 ,
          shoe: 19 ,
          points: 26 ,
          rebounds: 11,
          assists: 6 ,
          steals: 3 ,
          blocks: 8 ,
          slam_dunks: 5 }
        },
        {"Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2 ,
          assists: 2 ,
          steals: 4 ,
          blocks: 11 ,
          slam_dunks: 1 }
        }] 
    }, 
    away: {
      team_name: "Charlotte Hornets" ,
      colors: ["Turquoise", "Purple"] ,
      players: [
        {"Jeff Adrien" => {
          number: 4 ,
          shoe: 18,
          points: 10 ,
          rebounds: 1 ,
          assists: 1 ,
          steals: 2 ,
          blocks: 7 ,
          slam_dunks: 2 }
        },
        {"Bismack Biyombo" => {
          number: 0 ,
          shoe: 16,
          points: 12,
          rebounds: 4 ,
          assists: 7 ,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 }
        },
        {"DeSagna Diop" => {
          number:2  ,
          shoe: 14 ,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4 ,
          blocks: 5 ,
          slam_dunks: 5}
        },
        {"Ben Gordon" => {
          number: 8 ,
          shoe: 15,
          points: 33,
          rebounds: 3 ,
          assists: 2 ,
          steals: 1 ,
          blocks: 1 ,
          slam_dunks: 0 }
        },
        {"Kemba Walker" => {
          number: 33,
          shoe: 15,
          points: 6 ,
          rebounds: 12,
          assists: 12,
          steals: 7 ,
          blocks: 5 ,
          slam_dunks: 12 }
        }] 
    } 
  }
  
end 

def num_points_scored(player) 
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |players|
      if players.has_key?(player)
       return players[player][:points]
      end 
    end 
  end
    
end 

def shoe_size(player)
   game_hash.each do |location, team_data|
    team_data[:players].each do |players|
      if players.has_key?(player)
       return players[player][:shoe]
      end 
    end 
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
    teams.push(team_data[:team_name])
  end 
  
  teams 
  
end 

def player_numbers(team)
  
  team_numbers = []
  
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team 
      team_data[:players].each do |player|
        team_numbers.push(player[player.keys.first][:number])
      end 
    end 
  end 
  
  team_numbers
  
end 

def player_stats(player_name)
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player.keys.first == player_name 
        return player.values.first 
      end 
    end 
  end 
  
end 

def big_shoe_rebounds 
  
 biggest_shoe_size = 0 

 game_hash.each do |location, team_data|
   team_data[:players].each do |player|
    if player.values.first[:shoe] > biggest_shoe_size
      biggest_shoe_size = player.values.first[:shoe]
    end 
   end 
 end 
 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player.values.first[:shoe] == biggest_shoe_size
        return player.values.first[:rebounds]
      end 
    end 
  end 

end 

def most_points_scored
  
 most_points = 0 

 game_hash.each do |location, team_data|
   team_data[:players].each do |player|
    if player.values.first[:points] > most_points
      most_points = player.values.first[:points]
    end 
   end 
 end 
 
 game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player.values.first[:points] == most_points
        return player.keys.first
      end 
    end 
  end 
  
end 

def winning_team
  
  nets_points = 0 
  
  hornet_points = 0 
  
  game_hash.each do |location, team_data| 
    team_data[:players].each do |player|
      if team_data[:team_name] == "Brooklyn Nets"
        nets_points += player.values.first[:points] 
      elsif team_data[:team_name] == "Charlotte Hornets"
        hornet_points += player.values.first[:points] 
      end 
    end 
  end 
  
  if nets_points > hornet_points
    return "Brooklyn Nets"
  else
    return "Charlotte Hornets"
  end 
  
end 

def player_with_longest_name 
  
  longest_name = ""
  
  game_hash.each do |location, team_data| 
    team_data[:players].each do |player|
      if player.keys.first.length > longest_name.length 
        longest_name = player.keys.first
      end 
    end 
  end 
  
  longest_name
  
end 

def long_name_steals_a_ton?
  
  most_steals = 0 

 game_hash.each do |location, team_data|
   team_data[:players].each do |player|
    if player.values.first[:steals] > most_steals
      most_steals = player.values.first[:steals]
    end 
   end 
 end 
 
 game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player.keys.first == player_with_longest_name && player.values.first[:steals] == most_steals 
        return true 
      end 
    end 
  end 
  
end 

