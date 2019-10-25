# Write your code here!
require 'pry'

def game_hash
game_hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"], 
    :players => [
      {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
      {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
      {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
      {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
      {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}]}, 
  :away => {
    :team_name => "Charlotte Hornets", 
    :colors => ["Turquoise", "Purple"], 
    :players => [
      {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
      {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10},
      {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
      {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
      {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12}]}}
game_hash
end
def num_points_scored(name)
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      player.each do |key, value|
        #binding.pry
        if value == name
          return player[:points]
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      player.each do |key, value|
        #binding.pry
        if value == name
          return player[:shoe]
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |team_side, collect|
    #binding.pry
    if collect[:team_name] == team
      return collect[:colors]
    end
  end
end

def team_names
  names_array = []
  game_hash.each do |team_side, collect|
    names_array << collect[:team_name]
  end
  names_array
end

def player_numbers(team)
  numbers_array = []
  game_hash.each do |team_side, collect|
    if collect[:team_name] == team
      #binding.pry
      collect[:players].each do |player|
        numbers_array << player[:number]
      end
    end
  end
  numbers_array
end

def player_stats(name)
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      if player[:player_name] == name
        #binding.pry
          return player.tap {|ps| ps.delete(:player_name)}
      end
    end
  end
end

def big_shoe_rebounds
  #retuns the number of rebounds of the player with the biggest
  #shoe size
  big_shoe = 0 
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      if big_shoe < player[:shoe]
        big_shoe = player[:shoe]
      end
    end
  end
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      if big_shoe == player[:shoe]
        return player[:rebounds]
      end
    end
  end
end

def most_points_scored
  big_score = 0 
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      if big_score < player[:points]
        big_score = player[:points]
      end
    end
  end
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      if big_score == player[:points]
        return player[:player_name]
      end
    end
  end
end

def winning_team
  team_a_score = 0
  team_b_score = 0
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      if team_side == :home
        team_a_score += player[:points]
      else
        team_b_score += player[:points]
      end
    end
  end
  game_hash.each do |team_side, collect|
    if team_a_score > team_b_score && team_side == :home
      return collect[:team_name]
    elsif team_b_score > team_a_score && team_side == :away
      return collect[:team_name]
    end
  end
end

def player_with_longest_name
  name_length = 0
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      if name_length < player[:player_name].length
        name_length = player[:player_name].length
      end
    end
  end
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      if name_length == player[:player_name].length
        return player[:player_name]
      end
    end
  end
end

def long_name_steals_a_ton?
  steal_count = 0
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      if steal_count < player[:steals]
        steal_count = player[:steals]
      end
    end
  end
  game_hash.each do |team_side, collect|
    collect[:players].each do |player|
      
      if steal_count == player[:steals] && player[:player_name] == player_with_longest_name
        return true
      end
    end
  end
  return false
end