def game_hash()
  game = {
    :home => {
      :team_name => "Brooklyn Nets" ,
      :colors => ["Black", "White"] ,
      :players => [
        {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      ] #end players array
    },#end home
    
    :away => {
      :team_name => "Charlotte Hornets" ,
      :colors => ["Turquoise", "Purple"] ,
      :players => [
        {:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
        {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
      ] #end players array
    }#end away

  }#end game
end #end game_hash method

def num_points_scored(a_name)
  info = game_hash()
  all_players = info[:home][:players]
  target_player = all_players.find{|player| player[:player_name] == a_name}
  if target_player
	target_player[:points]
  else
	all_players = info[:away][:players]
	target_player = all_players.find{|player| player[:player_name] == a_name}
	target_player[:points]
  end
end #end num_points_scored method

def shoe_size(a_name)
  info = game_hash()
  all_players = info[:home][:players]
  target_player = all_players.find{|player| player[:player_name] == a_name}
  if target_player
	target_player[:shoe].to_i
  else
	all_players = info[:away][:players]
	target_player = all_players.find{|player| player[:player_name] == a_name}
	target_player[:shoe].to_i
  end
end #end shoe_size method

def team_colors(a_team_name)
  info = game_hash()
  if info[:home][:team_name] == a_team_name
    info[:home][:colors]
  else
    info[:away][:colors]
  end
end #end team_colors method

def team_names()
  info = game_hash()
  names = []
  info.each do |key,val|
    names << val[:team_name]
  end #end each
  names
end #end team_names method

def player_numbers(a_team_name)
  info = game_hash()
  player_nums = []
  if info[:home][:team_name] == a_team_name
    all_players = info[:home][:players]
	all_players.each{|player| player_nums << player[:number].to_i}
  else
    all_players = info[:away][:players]
	all_players.each{|player| player_nums << player[:number].to_i}
  end #if
  player_nums
end #player_numbers method

def player_stats(a_name)
  info = game_hash()
  home_players = info[:home][:players]
  home_players.each do |player|
    if player[:player_name] == a_name
	  player.delete(:player_name)
	  return player
	end #if
  end #home players each
  
  away_players = info[:away][:players]
  away_players.each do |player|
    if player[:player_name] == a_name
	  player.delete(:player_name)
	  return player
	end #if
  end #away players each
end #player_stats method

def get_all_players()
  info = game_hash()
  all_players = []
  info[:home][:players].each do |player|
    all_players << player
  end #end each
  info[:away][:players].each do |player|
    all_players << player
  end #end each
  all_players
end #method get_all_players

def big_shoe_rebounds()
  all_players = get_all_players()
  max_shoe = all_players[0][:shoe]
  rebounds = 0
  i = 1
  while i < all_players.length do
    if all_players[i][:shoe] > max_shoe
	  max_shoe = all_players[i][:shoe]
	  rebounds = all_players[i][:rebounds]
	end #end if
    i += 1
  end #end while
  rebounds
end #method big_shoe_rebounds

def most_points_scored()
  all_players = get_all_players()
  high_scorer = all_players[0][:player_name]
  max_points = all_players[0][:points]
  i = 1
  while i < all_players.length do
    if all_players[i][:points] > max_points
	  max_points = all_players[i][:points]
	  high_scorer = all_players[i][:player_name]
	end #if
	i += 1
  end #while
  high_scorer
end #method most_points_scored

def winning_team()
  info = game_hash()
  home_score = 0
  away_score = 0
  info[:home][:players].each do |player|
    home_score += player[:points]
  end #end each
  info[:away][:players].each do |player|
    away_score += player[:points]
  end #end each
  if home_score > away_score
    info[:home][:team_name]
  else
    info[:away][:team_name]
  end #if 
end #method winning_team

def player_with_longest_name()
  all_players = get_all_players()
  long_name = all_players[0][:player_name]
  max_length = long_name.length
  i = 1
  while i < all_players.length do
    if all_players[i][:player_name].length > max_length
	  long_name = all_players[i][:player_name]
	  max_length = long_name.length
	end #if
	i += 1
  end #while
  long_name
end #method player_with_longest_name

def long_name_steals_a_ton?()
  target_player = player_with_longest_name()
  all_players = get_all_players()
  max_steals = all_players[0][:steals]
  stealer = all_players[0][:player_name]
  i = 1
  
  while i < all_players.length do 
    if all_players[i][:steals] > max_steals
	  max_steals = all_players[i][:steals]
	  stealer = all_players[i][:player_name]
	end #if
	i += 1
  end #while
  if stealer == target_player
    true
  else
    false
  end #end if
end #method long_name_steals_a_ton?