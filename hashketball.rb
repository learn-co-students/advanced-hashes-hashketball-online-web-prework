def game_hash
  
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        { player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1 },
        { player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7 },
        { player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15 },
        { player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5 },
        { player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1 }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        { player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2 },
        { player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10 },
        { player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5 },
        { player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0 },
        { player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 }
      ]
    }
  }
  
  return hash
end

def num_points_scored(player)
  hash = game_hash
  
  index = 0
  while index < hash[:home][:players].size do
    if hash[:home][:players][index][:player_name] == player
      return hash[:home][:players][index][:points]
    end
    index += 1
  end
  
  index = 0
  while index < hash[:away][:players].size do
    if hash[:away][:players][index][:player_name] == player
      return hash[:away][:players][index][:points]
    end
    index += 1
  end
  
end

def shoe_size(player)
  hash = game_hash
  
  index = 0
  while index < hash[:home][:players].size do
    if hash[:home][:players][index][:player_name] == player
      return hash[:home][:players][index][:shoe]
    end
    index += 1
  end
  
  index = 0
  while index < hash[:away][:players].size do
    if hash[:away][:players][index][:player_name] == player
      return hash[:away][:players][index][:shoe]
    end
    index += 1
  end
  
end

def team_colors(team_name)
  hash = game_hash
  
  if hash[:home][:team_name] == team_name
    return hash[:home][:colors]
  end
  
  if hash[:away][:team_name] == team_name
    return hash[:away][:colors]
  end
  
end

def team_names
  temp = []
  
  temp << game_hash[:home][:team_name]
  temp << game_hash[:away][:team_name]
  
  return temp
end

def player_numbers(team_name)
  hash = game_hash
  temp = []
  
  if hash[:home][:team_name] == team_name
    
    index = 0
    while index < hash[:home][:players].size do
      temp << hash[:home][:players][index][:number]
      index += 1
    end
  
  elsif hash[:away][:team_name] == team_name
    
    index = 0
    while index < hash[:away][:players].size do
      temp << hash[:away][:players][index][:number]
      index += 1
    end
    
  end
  
  return temp
end

def player_stats(player)
  hash = game_hash
  temp = {}
  
  index = 0
  while index < hash[:home][:players].size do
    if hash[:home][:players][index][:player_name] == player
      temp[:number] = hash[:home][:players][index][:number]
      temp[:shoe] = hash[:home][:players][index][:shoe]
      temp[:points] = hash[:home][:players][index][:points]
      temp[:rebounds] = hash[:home][:players][index][:rebounds]
      temp[:assists] = hash[:home][:players][index][:assists]
      temp[:steals] = hash[:home][:players][index][:steals]
      temp[:blocks] = hash[:home][:players][index][:blocks]
      temp[:slam_dunks] = hash[:home][:players][index][:slam_dunks]
    end
    index += 1
  end
  
  index = 0
  while index < hash[:away][:players].size do
    if hash[:away][:players][index][:player_name] == player
      temp[:number] = hash[:away][:players][index][:number]
      temp[:shoe] = hash[:away][:players][index][:shoe]
      temp[:points] = hash[:away][:players][index][:points]
      temp[:rebounds] = hash[:away][:players][index][:rebounds]
      temp[:assists] = hash[:away][:players][index][:assists]
      temp[:steals] = hash[:away][:players][index][:steals]
      temp[:blocks] = hash[:away][:players][index][:blocks]
      temp[:slam_dunks] = hash[:away][:players][index][:slam_dunks]
    end
    index += 1
  end
  
  return temp
end

def big_shoe_rebounds
  hash = game_hash
  size = 0
  rebounds = 0
  
  index = 0
  while index < hash[:home][:players].size do
    player_size = hash[:home][:players][index][:shoe]
    if player_size > size
      size = player_size
      rebounds = hash[:home][:players][index][:rebounds]
    end
    index += 1
  end
  
  index = 0
  while index < hash[:away][:players].size do
    player_size = hash[:away][:players][index][:shoe]
    if player_size > size
      size = player_size
      rebounds = hash[:away][:players][index][:rebounds]
    end
    index += 1
  end
  
  return rebounds
end

def most_points_scored
  hash = game_hash
  points = 0
  player = ""
  
  index = 0
  while index < hash[:home][:players].size do
    player_points = hash[:home][:players][index][:points]
    if player_points > points
      points = player_points
      player = hash[:home][:players][index][:player_name]
    end
    index += 1
  end
  
  index = 0
  while index < hash[:away][:players].size do
    player_points = hash[:away][:players][index][:points]
    if player_points > points
      points = player_points
      player = hash[:away][:players][index][:player_name]
    end
    index += 1
  end
  
  return player
end

def winning_team
  hash = game_hash
  home_points = 0
  away_points = 0
  winner = ""
  
  index = 0
  while index < hash[:home][:players].size do
    home_points += hash[:home][:players][index][:points]
    index += 1
  end
  
  index = 0
  while index < hash[:away][:players].size do
    away_points += hash[:away][:players][index][:points]
    index += 1
  end
  
  if home_points > away_points
    winner = hash[:home][:team_name]
  else
    winner = hash[:away][:team_name]
  end
  
  return winner
end

def player_with_longest_name
  hash = game_hash
  length = 0
  longest_name = ""
  
  index = 0
  while index < hash[:home][:players].size do
    name = hash[:home][:players][index][:player_name]
    if name.length > length
      length = name.length
      longest_name = name
    end
    index += 1
  end
  
  index = 0
  while index < hash[:away][:players].size do
    name = hash[:away][:players][index][:player_name]
    if name.length > length
      length = name.length
      longest_name = name
    end
    index += 1
  end
  
  return longest_name
end

def long_name_steals_a_ton?
  hash = game_hash
  steals = 0
  player = ""
  
  index = 0
  while index < hash[:home][:players].size do
    player_steals = hash[:home][:players][index][:steals]
    if player_steals > steals
      steals = player_steals
      player = hash[:home][:players][index][:player_name]
    end
    index += 1
  end
  
  index = 0
  while index < hash[:away][:players].size do
    player_steals = hash[:away][:players][index][:steals]
    if player_steals > steals
      steals = player_steals
      player = hash[:away][:players][index][:player_name]
    end
    index += 1
  end
  
  return player == player_with_longest_name
end
