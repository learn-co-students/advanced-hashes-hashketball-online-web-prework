# Write your code here!
require "pry"

def game_hash
  a_hash = {
    :home =>{
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :stats => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          }
        },
        {
          :player_name =>"Reggie Evans",
          :stats => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          }
        },
        {
          :player_name => "Brook Lopez",
          :stats => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          }
        },
        {
          :player_name => "Mason Plumlee",
          :stats => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          }
        },
        {
          :player_name => "Jason Terry",
          :stats => {
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
      ]
    },
    :away =>{
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :stats => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          }
        },
        {
          :player_name =>"Bismak Biyombo",
          :stats => {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 7,
            :blocks => 15,
            :slam_dunks => 10
          }
        },
        {
          :player_name => "DeSagna Diop",
          :stats => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          } 
        },
        {
          :player_name => "Ben Gordon",
          :stats => {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          }
        },
        {
          :player_name => "Brendan Haywood",
          :stats => {
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
      ]
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    binding.pry
    team_data.each do |attribute, data|
      binding.pry
      data.each do |data_item|
        binding.pry
      end
    end
  end
end

#good_practices

def num_points_scored (player_name)
  points = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:player_name] == player_name
        points = player[:stats][:points].to_i
      end
    end
  end
  points
end

def shoe_size (player_name)
  shoe_size = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:player_name] == player_name
        shoe_size = player[:stats][:shoe].to_i
      end
    end
  end
  shoe_size
end

def team_colors (team_name)
  team_colors = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_colors = team_data[:colors]
    end
  end
  team_colors
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_names << team_data[:team_name]
  end
  team_names
end

def player_numbers (team_name)
  player_numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |player|
        player_numbers << player[:stats][:number].to_i
      end
    end
  end
  player_numbers
end

def player_stats (player_name)
  player_stats = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:player_name] == player_name
        player_stats = player[:stats]
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  biggest_shoe_number = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:stats][:shoe] > biggest_shoe_number
        biggest_shoe_number = player[:stats][:shoe]
        rebounds = player[:stats][:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  most_points = 0
  player_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:stats][:points] > most_points
        most_points = player[:stats][:points]
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

def winning_team 
  team_name = ""
  winning_points = 0
  game_hash.each do |location, team_data|
    points = 0
    team_data[:players].each do |player|
      points += player[:stats][:points]
    end
    if points > winning_points
      winning_points = points
      team_name = team_data[:team_name]
    end
  end
  team_name
end

def player_with_longest_name
  player_name = ""
  longest_name_length = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      name_length = player[:player_name].length
      if name_length > longest_name_length
        longest_name_length = name_length
        player_name = player[:player_name]
      end
    end
  end
  player_name
end

def long_name_steals_a_ton?
  biggest_steal = 0
  player_name = ""
  is_true = true
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if biggest_steal < player[:stats][:steals]
        biggest_steal = player[:stats][:steals]
        player_name = player[:player_name]
      end
    end
  end
  if player_with_longest_name == player_name
    is_true = true
  else
    is_true = false
  end
  is_true
end