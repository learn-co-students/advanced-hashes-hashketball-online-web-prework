require 'pry'
def game_hash  
  hash = {
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
        }
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
        }
      ]
    }
  }
end


# "Alan Anderson" => {},
#         "Reggie Evans" => {},
#         "Brook Lopez" => {},
#         "Mason Plumlee" => {},
#         "Jason Terry" => {}

# "Jeff Adrien" => {},
#         "Bismack Biyombo" => {},
#         "DeSagna Diop" => {},
#         "Ben Gordon" => {},
#         "Kemba Walker" => {}


def num_points_scored(name)
  result = nil
  game_hash.each { |keys, values|
  i = 0
    while i < game_hash[keys][:players].length do 
      if game_hash[keys][:players][i][:player_name] == name
        result = game_hash[keys][:players][i][:points]
      end
      i += 1
    end
  }
  result
end

def shoe_size(name)
  result = nil
  game_hash.each { |keys, values|
  i = 0
    while i < game_hash[keys][:players].length do 
      if game_hash[keys][:players][i][:player_name] == name
        result = game_hash[keys][:players][i][:shoe]
      end
      i += 1
    end
  }
  result
end

def team_colors(team_name)
  result = nil
  game_hash.each { |keys, values|
    if game_hash[keys][:team_name] == team_name
      result = game_hash[keys][:colors]
    end
  }
  result
end

def team_names
  names = []
  game_hash.each { |key, values| names << game_hash[key][:team_name] }
  names
end

def player_numbers(team_name)
  result = []
  home_or_away = game_hash.keys
  home_or_away.each_with_index { |v, i|
    if game_hash[v][:team_name] == team_name
      # binding.pry
      game_hash[v][:players].each_with_index do |val, ind| 
        result << game_hash[v][:players][ind][:number]
      end
    end
  }
  result
end

def player_stats(player_name)
  result = {}
  game_hash.each { |keys, values|
  i = 0
    while i < game_hash[keys][:players].length do 
      if game_hash[keys][:players][i][:player_name] == player_name
        result = game_hash[keys][:players][i]
        result.shift
      end
      i += 1
    end
  }
  result
  # binding.pry
end


def big_shoe_rebounds
  #find largest shoe 
  largest_shoe_size = 0 
  rebounds = nil
  # loop through all :shoe
  # make largest_shoe_size = shoe size if larger than current 
  
  game_hash.each { |keys, values|
  i = 0
    while i < game_hash[keys][:players].length do 
      if game_hash[keys][:players][i][:shoe] > largest_shoe_size
        largest_shoe_size = game_hash[keys][:players][i][:shoe]
        rebounds = game_hash[keys][:players][i][:rebounds]
      end
      i += 1
    end
  }
  rebounds
  
  
  
  # binding.pry
end
  
  # find rebound of that player

def most_points_scored
  most_points = 0 
  name = nil
  game_hash.each { |keys, values|
  i = 0
    while i < game_hash[keys][:players].length do 
      if game_hash[keys][:players][i][:points] > most_points
        most_points = game_hash[keys][:players][i][:points]
        name = game_hash[keys][:players][i][:player_name]
      end
      i += 1
    end
  }
  name
  # binding.pry
end

# def winning_team
#   # total up points mini-method?
#   home_or_away = game_hash.keys
#   total_points = 0 
  
#   game_hash.each { |keys, values|
#   i = 0
#     while i < game_hash[keys][:players].length do 
#       total_points += game_hash[keys][:players][i][:points] 
#       i += 1
#     end
#   }
#   total_points
#   binding.pry
#   # compare totals
  
#   #return string of name 
# end

def winning_team
  # total up points mini-method?
  home_or_away = game_hash.keys
  total_points_home = 0 
  total_points_away = 0
  winner = nil
  
  i = 0
    while i < game_hash[:home][:players].length do 
      total_points_home += game_hash[:home][:players][i][:points] 
      i += 1
    end
  total_points_home

  
  i = 0
    while i < game_hash[:away][:players].length do 
      total_points_away += game_hash[:away][:players][i][:points] 
      i += 1
    end
  total_points_away
  
  # compare totals
  if total_points_home > total_points_away
    winner = game_hash[:home][:team_name]
  else
    winner = game_hash[:away][:team_name]
  end
  winner
  #return string of name 
  # binding.pry
end

def player_with_longest_name
  # go through each name 
  # determine if longer than current 
  #update if longer
  # return name 
  longest_name = 0 
  name = nil
  game_hash.each { |keys, values|
  i = 0
  
    while i < game_hash[keys][:players].length do 
      # binding.pry
      if game_hash[keys][:players][i][:player_name].length > longest_name
        
        longest_name = game_hash[keys][:players][i][:player_name].length
        name = game_hash[keys][:players][i][:player_name]
      end
      i += 1
    end
  }
  name
end

def long_name_steals_a_ton?
  # get most steals 
  
  most_steals = 0 
  name = nil
  game_hash.each { |keys, values|
  i = 0
    while i < game_hash[keys][:players].length do 
      if game_hash[keys][:players][i][:steals] > most_steals
        most_steals = game_hash[keys][:players][i][:steals]
        name = game_hash[keys][:players][i][:player_name]
      end
      i += 1
    end
  }
  name
  # binding.pry
  if name == player_with_longest_name
    true 
  else
    false
  end
end 




