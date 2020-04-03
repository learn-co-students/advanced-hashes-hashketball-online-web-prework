require 'pry'
require 'pp'

def game_hash
  
  game_hash = {}
  game_hash[:home] = {}
  game_hash[:away] = {}
  game_hash[:home][:team_name] = "Brooklyn Nets"
  game_hash[:home][:colors] = "Black", "White"
  game_hash[:home][:players] = [
    {
:player_name => "Alan Anderson" ,
:number => 0 ,
:shoe => 16,
:points => 22,
:rebounds => 12,
:assists => 12,
:steals => 3,
:blocks => 1 , 
:slam_dunks => 1},
{
:player_name => "Reggie Evans" ,
:number => 30,
:shoe => 14,
:points => 12,
:rebounds => 12,
:assists => 12,
:steals => 12,
:blocks => 12, 
:slam_dunks => 7 
},
{
:player_name => "Brook Lopez",
:number => 11,
:shoe => 17,
:points => 17,
:rebounds => 19,
:assists => 10,
:steals => 3,
:blocks => 1, 
:slam_dunks => 15
},
{
:player_name => "Mason Plumlee",
:number => 1,
:shoe => 19,
:points => 26,
:rebounds => 11,
:assists => 6,
:steals => 3,
:blocks => 8, 
:slam_dunks => 5
},
{
:player_name => "Jason Terry",
:number => 31,
:shoe => 15,
:points => 19,
:rebounds => 2,
:assists => 2,
:steals => 4,
:blocks => 11, 
:slam_dunks => 1
}]
  game_hash[:away][:team_name] = "Charlotte Hornets"
  game_hash[:away][:colors] = "Turquoise", "Purple" 
  game_hash[:away][:players] = [
{
:player_name => "Jeff Adrien",
:number => 4,
:shoe => 18,
:points => 10,
:rebounds => 1,
:assists => 1,
:steals => 2,
:blocks => 7, 
:slam_dunks => 2
},
{
:player_name => "Bismack Biyombo",
:number => 0,
:shoe => 16,
:points => 12,
:rebounds => 4,
:assists => 7,
:steals => 22,
:blocks => 15, 
:slam_dunks => 10
},
{
:player_name => "DeSagna Diop",
:number => 2,
:shoe => 14,
:points => 24,
:rebounds => 12,
:assists => 12,
:steals => 4,
:blocks => 5, 
:slam_dunks => 5
},
{
:player_name => "Ben Gordon",
:number => 8,
:shoe => 15,
:points => 33,
:rebounds => 3,
:assists => 2,
:steals => 1,
:blocks => 1, 
:slam_dunks => 0
},
{
:player_name => "Kemba Walker",
:number => 33,
:shoe => 15,
:points => 6,
:rebounds => 12,
:assists => 12,
:steals => 7,
:blocks => 5, 
:slam_dunks => 12
}
]
  game_hash
end 

def load_players
  players = game_hash.keys.map do |teams|
   game_hash[teams][:players]
    
  end 
  players.flatten
  
end 

def num_points_scored(player_name)
  player = load_players.find do |names|
    names[:player_name] == player_name
  end
  points = player[:points]
  points
end 

def shoe_size(player_name) 
  player = load_players.find do |names|
    names[:player_name] == player_name
  
  end
  shoe_size = player[:shoe]
  shoe_size
end 


def team_colors(team)
  selected_team =  game_hash.keys.map do |t|
    game_hash[t]
  end 

  team_finder = selected_team.find do |name|
    name[:team_name] == team
  end
    color = team_finder[:colors]
    color
    
end 

def team_names
  selected_team = game_hash.keys.map do |t|
    game_hash[t]
  end 
  teams = selected_team.map do |names|
    names[:team_name]
  end 
end 

def player_numbers(team)
  selected_team =  game_hash.keys.map do |t|
    game_hash[t]
  end 
  
  numbers = selected_team.find do |num|
    num[:team_name] == team 
  end
  
  p_numbers = numbers[:players].map do |n|
    n[:number]
  end
  p_numbers
end

def player_stats(player_name)
  stats = load_players.find do |names|
    names[:player_name] == player_name
  end

stats

ps = Hash[Array(stats)[1..-1]].each_pair do |k, v|

end 
ps
end 

def big_shoe_rebounds
  shoe_size = load_players.map do |names|
     names[:shoe]
     names[:rebounds]
  end
  big_shoe = shoe_size.max
  
  rebounds = load_players.find do |names|
    names[:shoe] == big_shoe
    
  end 
  rebounds[:rebounds]
end 