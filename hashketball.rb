
#                                 DATA


def game_hash
  hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {player_name: "Alan Anderson", number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}, 
        {player_name: "Reggie Evans", number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        {player_name: "Brook Lopez", number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        {player_name: "Mason Plumlee", number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        {player_name: "Jason Terry", number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
    
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {player_name: "Jeff Adrien", number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2}, 
        {player_name: "Bismack Biyombo", number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
        {player_name: "DeSagna Diop", number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        {player_name: "Ben Gordon", number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        {player_name: "Kemba Walker", number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end


#                            HELPER METHODS


def remove_first_key
  data = game_hash
  result = []
  data.each do |key, value|
    result << value
  end
  result
end

def isolate_players
  data = remove_first_key
  result = []
  data.each do |team|
    team.each do |team_key, team_value|
      result << team_value
    end
  end
  result
end

def all_players
  data = isolate_players
  result = []
  result.concat(data[2], data[5])
  result
end

def fetcher(data, key, value, item)
ref = data
  i = 0
  while i < ref.size do
    if ref[i][key] == item
      return ref[i][value]
    end
    i += 1
  end
end

def get_player_stat(player, stat)
  data = fetcher(all_players, :player_name, stat, player)
  data
end

def stat_compare(key, value)
  data = all_players
  record = 0
  i = 0
  while i < data.size do
    if data[i][key] > record
      record = data[i][key]
      result = data[i][value]
    end
    i += 1
  end
  result
end

def longest_name_stats
  data = all_players
  record = 0
  i = 0
  while i < data.size do
    if data[i][:player_name].size > record
      record = data[i][:player_name].size
      result = data[i]
    end
    i += 1
  end
  result
end


#                                 MAIN METHODS


def num_points_scored(player)
  result = get_player_stat(player, :points)
end

def shoe_size(player)
  result = get_player_stat(player, :shoe)
end

def team_colors(team)
  data = fetcher(remove_first_key, :team_name, :colors, team)
  data
end

def team_names
  data = remove_first_key
  result = []
  i = 0
  while i < data.size do
    result << data[i][:team_name]
    i += 1
  end
  result
  
end

def player_numbers(team)
  data = remove_first_key
  result = []
  i = 0
  while i < data.size do
    if data[i][:team_name] == team
      ii = 0
      while ii < data[i][:players].size
        result << data[i][:players][ii][:number]
        ii += 1
      end
    end
    i += 1
  end
  if result.size < 1
    return "No info available for #{team}."
  end
  result
end

def player_stats(player)
  data = all_players
  i = 0
  while i < data.size do
    if data[i][:player_name] == player
      result = data[i]
    end
    i += 1
  end
  result.delete(:player_name)
  result
end

def big_shoe_rebounds
  data = stat_compare(:shoe, :rebounds)
  data
end

def most_points_scored
  data = stat_compare(:points, :player_name)
  data
end

def winning_team
  data = remove_first_key
  i = 0
  while i < data.size do
    sum = 0
    ii = 0
    while ii < data[i][:players].size
      sum += data[i][:players][ii][:points]
      ii += 1
    end
    if i < 1
      team1 = sum
    else
      team2 = sum
    end
    i += 1
  end
  if team1 > team2
    return data[0][:team_name]
  else
    return data[1][:team_name]
  end
end

def player_with_longest_name
  result = longest_name_stats[:player_name]
  result
end

def long_name_steals_a_ton?
  data = all_players
  record = longest_name_stats[:steals]
  i = 0
  while i < data.size do
    if data[i][:steals] > record
      return false
    end
    i += 1
  end
  return true
end
