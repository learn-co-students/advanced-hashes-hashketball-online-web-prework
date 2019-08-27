require 'pry'

def game_hash
  {
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: [
      {name: "Alan Anderson", number: "0", shoe: "16",
      points: "22", rebounds: "12", assists: "12",
      steals: "3", blocks: "1", slam_dunks: "1"}, 
      {name: "Reggie Evans", number: "30", shoe: "14",
      points: "12", rebounds: "12", assists: "12",
      steals: "12", blocks: "12", slam_dunks: "7"}, 
      {name: "Brook Lopez", number: "11", shoe: "17",
      points: "17", rebounds: "19", assists: "10",
      steals: "3", blocks: "1", slam_dunks: "15"}, 
      {name: "Mason Plumlee", number: "1", shoe: "19",
      points: "26", rebounds: "11", assists: "6",
      steals: "3", blocks: "8", slam_dunks: "5"}, 
      {name: "Jason Terry", number: "31", shoe: "15",
      points: "19", rebounds: "2", assists: "2",
      steals: "4", blocks: "11", slam_dunks: "1"}, 
    ]
  },
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: [
      {name: "Jeff Adrien", number: "4", shoe: "18",
      points: "10", rebounds: "1", assists: "1",
      steals: "2", blocks: "7", slam_dunks: "2"}, 
      {name: "Bismack Biyombo", number: "0", shoe: "16",
      points: "12", rebounds: "4", assists: "7",
      steals: "22", blocks: "15", slam_dunks: "10"}, 
      {name: "DeSagna Diop", number: "2", shoe: "14",
      points: "24", rebounds: "12", assists: "12",
      steals: "4", blocks: "5", slam_dunks: "5"}, 
      {name: "Ben Gordon", number: "8", shoe: "15",
      points: "33", rebounds: "3", assists: "2",
      steals: "1", blocks: "1", slam_dunks: "0"}, 
      {name: "Kemba Walker", number: "33", shoe: "15",
      points: "6", rebounds: "12", assists: "12",
      steals: "7", blocks: "5", slam_dunks: "12"}, 
    ]
  }
}
end


def num_points_scored(athlete)
  game_hash
  hogash = game_hash[:home][:players]
  awgash = game_hash[:away][:players]
  ho_players = []
  hogash.length.times { |index|
    ho_players.push(hogash[index][:name]) }
  aw_players = []
  awgash.length.times { |index|
    aw_players.push(awgash[index][:name]) }
  if ho_players.include?(athlete)
    position = ho_players.find_index(athlete)
    hogash[position][:points].to_i
  elsif aw_players.include?(athlete)
    position = aw_players.find_index(athlete)
    awgash[position][:points].to_i
  else
    "SLAM"
  end
end


def shoe_size(athlete)
  game_hash
  hogash = game_hash[:home][:players]
  awgash = game_hash[:away][:players]
  ho_players = []
  hogash.length.times { |index|
    ho_players.push(hogash[index][:name]) }
  aw_players = []
  awgash.length.times { |index|
    aw_players.push(awgash[index][:name]) }
  if ho_players.include?(athlete)
    position = ho_players.find_index(athlete)
    hogash[position][:shoe].to_i
  elsif aw_players.include?(athlete)
    position = aw_players.find_index(athlete)
    awgash[position][:shoe].to_i
  else
    "SLAM"
  end
end

def team_colors(team)
  game_hash
  if game_hash[:home][:team_name] == team
    game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    game_hash[:away][:colors]
  else
    "SLAM"
  end
end

def team_names
  teams = []
  teams.push(game_hash[:home][:team_name])
  teams.push(game_hash[:away][:team_name])
  teams
end

def player_numbers(team)
  ho_numb = []
  game_hash[:home][:players].length.times { |index|
    ho_numb.push(game_hash[:home][:players][index][:number].to_i)
  }
  aw_numb = []
  game_hash[:away][:players].length.times { |index|
    aw_numb.push(game_hash[:away][:players][index][:number].to_i)
  }
  if game_hash[:home][:team_name] == team
    ho_numb
  elsif game_hash[:away][:team_name] == team
    aw_numb
  else
    "SLAM"
  end
end

def player_stats(athlete)
  game_hash
  hgash = game_hash[:home][:players]
  agash = game_hash[:away][:players]
  home_players = []
  hgash.length.times { |index|
    home_players.push(hgash[index][:name]) }
  away_players = []
  agash.length.times { |index|
    away_players.push(agash[index][:name]) }
  if home_players.include?(athlete)
    position = home_players.find_index(athlete)
    statistics = hgash[position]
  elsif away_players.include?(athlete)
    position = away_players.find_index(athlete)
    statistics = agash[position]
  else
    "SLAM"
  end
  statistics.reject! { |k| k == :name }
  statistics.keys.length.times { |index| statistics[statistics.keys[index]] = statistics[statistics.keys[index]].to_i }
  statistics
end

def big_shoe_rebounds
  game_hash
  hogash = game_hash[:home][:players]
  awgash = game_hash[:away][:players]
  walk_home = []
  hogash.length.times { |index|
    walk_home.push(hogash[index][:shoe].to_i) }
  walk_away = []
  awgash.length.times { |index|
    walk_away.push(awgash[index][:shoe].to_i) }
  if walk_home.max > walk_away.max
    place = :home
    titans = walk_home
  else
    place = :away
    titans = walk_away
  end
  giantdad = titans.index(titans.max)
  game_hash[place][:players][giantdad][:rebounds].to_i
end  

def most_points_scored
  game_hash
  hogash = game_hash[:home][:players]
  awgash = game_hash[:away][:players]
  win_home = []
  hogash.length.times { |index|
    win_home.push(hogash[index][:points].to_i) }
  win_away = []
  awgash.length.times { |index|
    win_away.push(awgash[index][:points].to_i) }
  if win_home.max > win_away.max
    place = :home
    champions = win_home
  else
    place = :away
    champions = win_away
  end
  the_legend = champions.index(champions.max)
  game_hash[place][:players][the_legend][:name]
end

def winning_team
  game_hash
  hogash = game_hash[:home][:players]
  awgash = game_hash[:away][:players]
  win_home = []
  hogash.length.times { |index|
    win_home.push(hogash[index][:points].to_i) }
  win_away = []
  awgash.length.times { |index|
    win_away.push(awgash[index][:points].to_i) }
  if win_home.reduce(0, :+) > win_away.reduce(0, :+)
    place = :home
  elsif win_away.reduce(0, :+) > win_home.reduce(0, :+)
    place = :away
  else
    "SLAM"
  end
  game_hash[place][:team_name]
end

def player_with_longest_name
  game_hash
  hogash = game_hash[:home][:players]
  awgash = game_hash[:away][:players]
  win_home = []
  hogash.length.times { |index|
    win_home.push(hogash[index][:name]) }
  win_away = []
  awgash.length.times { |index|
    win_away.push(awgash[index][:name]) }
  win_home.length.times { |index|
    win_home[index] = win_home[index].length }
  win_away.length.times { |index|
    win_away[index] = win_away[index].length }
  if win_home.max > win_away.max
    place = :home
    champions = win_home
  else
    place = :away
    champions = win_away
  end
  the_legend = champions.index(champions.max)
  game_hash[place][:players][the_legend][:name]
end

def most_points_stolen
    game_hash
  hogash = game_hash[:home][:players]
  awgash = game_hash[:away][:players]
  win_home = []
  hogash.length.times { |index|
    win_home.push(hogash[index][:steals].to_i) }
  win_away = []
  awgash.length.times { |index|
    win_away.push(awgash[index][:steals].to_i) }
  if win_home.max > win_away.max
    place = :home
    champions = win_home
  else
    place = :away
    champions = win_away
  end
  the_legend = champions.index(champions.max)
  game_hash[place][:players][the_legend][:name]
end

def long_name_steals_a_ton?
  la_Capitan = most_points_stolen
  la_Comodora = player_with_longest_name
  la_Comodora == la_Capitan
end

