require 'pp'
require 'pry'

def game_hash
  nba_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
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
        },
        ]
        
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
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
        },
        ]
    }
  }
end

def get_stat(player_name, player_stat)
  game_hash.each do |key1, value1|
    i = 0 
    while i < game_hash[key1][:players].length do 
      if game_hash[key1][:players][i][:player_name] == player_name
        return stat = game_hash[key1][:players][i][player_stat]
      end
      i += 1 
    end 
  end
end 

def num_points_scored(player_name)
  points = get_stat(player_name, :points)
end

def shoe_size(player_name)
  size_of_shoe = get_stat(player_name, :shoe)
end

def team_colors(team_name)
  game_hash.each do |key1, value1|
    if game_hash[key1][:team_name] == team_name
      return team_color = game_hash[key1][:colors]
    end 
  end 
end

def team_names()
  team_names = []
  game_hash.each do |key1, value1|
    team_names << game_hash[key1][:team_name]
  end
team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |key1, value1|
    i = 0 
    while i < game_hash[key1][:players].length do 
      if game_hash[key1][:team_name] == team_name
        jersey_numbers << game_hash[key1][:players][i][:number]
      end 
      i += 1
    end 
  end
jersey_numbers
end 

def player_stats(player_name)
  player_stats = {}
  game_hash.each do |key1, value1|
    i = 0 
    while i < game_hash[key1][:players].length do 
      if game_hash[key1][:players][i][:player_name] == player_name
        return player_stats = {
          :number => get_stat(player_name, :number),
          :shoe => get_stat(player_name, :shoe),
          :points => get_stat(player_name, :points),
          :rebounds => get_stat(player_name, :rebounds),
          :assists => get_stat(player_name, :assists),
          :steals => get_stat(player_name, :steals),
          :blocks => get_stat(player_name, :blocks),
          :slam_dunks => get_stat(player_name, :slam_dunks)
        }
      end
      i +=1 
    end
  end 
end 

def player_array()
  player_array = []
  game_hash.each do |key1, value1|
    i = 0 
    while i < game_hash[key1][:players].length do 
      player_array << game_hash[key1][:players][i]
      i += 1 
    end 
  end
player_array
end

def big_shoe_rebounds()
  player_array = player_array()
  player_array.sort_by! {|key| -key[:shoe]}
player_array[0][:rebounds]
end 

def most_points_scored()
  player_array = player_array()
  player_array.sort_by! {|key| -key[:points]}
player_array[0][:player_name]
end 

def winning_team()
  home_team = 0 
  away_team = 0 
  game_hash.each do |key1, value1|
    i = 0
    while i < game_hash[key1][:players].length do 
        home_team += game_hash[:home][:players][i][:points]
        away_team += game_hash[:away][:players][i][:points]
        i += 1 
    end
    if home_team > away_team
      return game_hash[:home][:team_name]
    else
      return game_hash[:away][:team_name]
    end 
  end
end 

def player_with_longest_name()
  player_array = player_array()
  player_array.sort_by! {|key| -key[:player_name].length}
player_array[0][:player_name]
end 

def most_steals()
  player_array = player_array()
  player_array.sort_by! {|key| -key[:steals]}
player_array[0][:player_name]
end 

def long_name_steals_a_ton?()
  longest_name = player_with_longest_name()
  return true if longest_name == most_steals()
end
