# Write your code here!
def game_hash
  game_stats = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe =>  16,
          :points =>  22,
          :rebounds =>  12,
          :assists =>  12,
          :steals =>  3,
          :blocks =>  1,
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe =>  14,
          :points =>  12,
          :rebounds =>  12,
          :assists =>  12,
          :steals =>  12,
          :blocks =>  12,
          :slam_dunks =>  7
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe =>  17,
          :points =>  17,
          :rebounds =>  19,
          :assists =>  10,
          :steals =>  3,
          :blocks =>  1,
          :slam_dunks =>  15
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe =>  19,
          :points =>  26,
          :rebounds =>  11,
          :assists =>  6,
          :steals =>  3,
          :blocks =>  8,
          :slam_dunks =>  5
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points =>  19,
          :rebounds =>  2,
          :assists =>  2,
          :steals =>  4,
          :blocks =>  11,
          :slam_dunks =>  1
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
          :shoe =>  18,
          :points =>  10,
          :rebounds =>  1,
          :assists =>  1,
          :steals =>  2,
          :blocks =>  7,
          :slam_dunks =>  2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe =>  16,
          :points =>  12,
          :rebounds =>  4,
          :assists =>  7,
          :steals =>  22,
          :blocks =>  15,
          :slam_dunks =>  10
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe =>  14,
          :points =>  24,
          :rebounds =>  12,
          :assists =>  12,
          :steals =>  4,
          :blocks =>  5,
          :slam_dunks =>  5
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe =>  15,
          :points =>  33,
          :rebounds =>  3,
          :assists =>  2,
          :steals =>  1,
          :blocks =>  1,
          :slam_dunks =>  0
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe =>  15,
          :points =>  6,
          :rebounds =>  12,
          :assists => 12,
          :steals =>  7,
          :blocks =>  5,
          :slam_dunks =>  12
        }
        ]
    }
  }
end

def find_player(player_name)
  home_list = []
  away_list = []
  game_stats = game_hash
  # Create Arrays with only player name for each team
  i = 0
  while i < game_stats[:home][:players].length do
    home_list << game_stats[:home][:players][i][:player_name]
    i += 1 
  end
  i = 0
  while i < game_stats[:away][:players].length do
    away_list << game_stats[:away][:players][i][:player_name]
    i += 1 
  end
  
  # Find player index and return that player's hash
  if home_list.include?(player_name)
    index = home_list.index(player_name)
    result =  game_stats[:home][:players][index]
  elsif away_list.include?(player_name)
    index = away_list.index(player_name)
    result = game_stats[:away][:players][index]
  else
    result = nil
  end
  result
end

def find_biggest_shoe
  # Start with first player shoe size, save player stats to result
  # iterate through players, update result if shoe is bigger
 
  game_stats = game_hash
  biggest_home_shoe = game_stats[:home][:players][0]
  biggest_away_shoe = game_stats[:away][:players][0]
 
  i = 0 
  while i < game_stats[:home][:players].length do
    if game_stats[:home][:players][i][:shoe] > biggest_home_shoe[:shoe]
      biggest_home_shoe = game_stats[:home][:players][i]
      i += 1 
    else
      i += 1 
    end
  end
  
  i = 0 
  while i < game_stats[:away][:players].length do
    if game_stats[:away][:players][i][:shoe] > biggest_away_shoe[:shoe]
      biggest_away_shoe = game_stats[:away][:players][i]
      i += 1 
    else
      i += 1 
    end
  end
  
  if biggest_home_shoe[:shoe] > biggest_away_shoe[:shoe]
    return biggest_home_shoe
  else
    return biggest_away_shoe
  end
end

def num_points_scored(player)
  player_stats = find_player(player)
  player_stats[:points]
end

def shoe_size(player)
  player_stats = find_player(player)
  player_stats[:shoe]
end

def player_stats(player)
  player_stats = find_player(player)
  player_stats.delete(:player_name)
  player_stats
end

def team_colors(team_name)
  game_stats = game_hash
  if game_stats[:home][:team_name] == team_name
    colors = game_stats[:home][:colors]
  elsif game_stats[:away][:team_name] == team_name
    colors = game_stats[:away][:colors]
  else
    colors = "Sorry, it looks like that team didn't play"
  end
  colors
end

def team_names
  game_stats = game_hash
  team_names = [
    game_stats[:home][:team_name],
    game_stats[:away][:team_name]
    ]
end

def player_numbers(team)
  # First determine if team is away or home
  game_stats = game_hash
  numbers = []
  if game_stats[:home][:team_name] == team
    i = 0 
    while i < game_stats[:home][:players].length do
      numbers << game_stats[:home][:players][i][:number]
      i += 1 
    end
  elsif game_stats[:away][:team_name] == team
    i = 0 
    while i < game_stats[:away][:players].length do
      numbers << game_stats[:away][:players][i][:number]
      i += 1 
    end
  else
    return "Sorry that team didn't play"
  end
  numbers
end
  
def big_shoe_rebounds
  player_stats = find_biggest_shoe
  player_stats[:rebounds]
end

def most_points_scored
  # Start with first player ponts, save player stats to result
  # iterate through players, update result if scored more
 
  game_stats = game_hash
  most_home_points = game_stats[:home][:players][0]
  most_away_points = game_stats[:away][:players][0]
 
  i = 0 
  while i < game_stats[:home][:players].length do
    if game_stats[:home][:players][i][:points] > most_home_points[:points]
      most_home_points = game_stats[:home][:players][i]
      i += 1 
    else
      i += 1 
    end
  end
  
  i = 0 
  while i < game_stats[:away][:players].length do
    if game_stats[:away][:players][i][:points] > most_away_points[:points]
      most_away_points = game_stats[:away][:players][i]
      i += 1 
    else
      i += 1 
    end
  end
  
  if most_home_points[:points] > most_away_points[:points]
    return most_home_points[:player_name]
  else
    return most_away_points[:player_name]
  end
end

def most_steals
  # Start with first player steals, save player stats to result
  # iterate through players, update result if scored more
 
  game_stats = game_hash
  most_home_steals = game_stats[:home][:players][0]
  most_away_steals = game_stats[:away][:players][0]
 
  i = 0 
  while i < game_stats[:home][:players].length do
    if game_stats[:home][:players][i][:steals] > most_home_steals[:steals]
      most_home_steals = game_stats[:home][:players][i]
      i += 1 
    else
      i += 1 
    end
  end
  
  i = 0 
  while i < game_stats[:away][:players].length do
    if game_stats[:away][:players][i][:steals] > most_away_steals[:steals]
      most_away_steals = game_stats[:away][:players][i]
      i += 1 
    else
      i += 1 
    end
  end
  
  if most_home_steals[:steals] > most_away_steals[:steals]
    return most_home_steals[:player_name]
  else
    return most_away_steals[:player_name]
  end
end

def winning_team
  # Reduce game_hash[:home][:players] array by summing game_hash[:home][:players][i][:points]
  # Do same for away team and compare
  game_stats = game_hash
  home_points = 0 
  away_points = 0 
  
  i = 0 
  while i < game_stats[:home][:players].length do
    home_points += game_stats[:home][:players][i][:points]
    i += 1 
  end
  
  i = 0 
  while i < game_stats[:away][:players].length do
    away_points += game_stats[:away][:players][i][:points]
    i += 1 
  end
  
  if home_points > away_points
    result = game_stats[:home][:team_name]
  elsif away_points > home_points
    result = game_stats[:away][:team_name]
  else
    result = "It's a tie! Overtime!"
  end
  result
end

def player_with_longest_name
  home_list = []
  away_list = []
  game_stats = game_hash
  # Create Arrays with only player name for each team
  i = 0
  while i < game_stats[:home][:players].length do
    home_list << game_stats[:home][:players][i][:player_name]
    i += 1 
  end
  
  i = 0
  while i < game_stats[:away][:players].length do
    away_list << game_stats[:away][:players][i][:player_name]
    i += 1 
  end
  
  total_list = home_list.concat(away_list)
  longest_name = total_list[0]
  i = 0 
  while i < total_list.length do
    if total_list[i].length > longest_name.length
      longest_name = total_list[i]
      i += 1
    else
      i += 1 
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  if player_with_longest_name == most_steals
    return true 
  else
    return false
  end
end

