def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"], #end color array
      :players => {
        "Alan Anderson" => {
          :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks =>1, :slam_dunks => 1}, #end alan 
        "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks =>12, :slam_dunks => 7}, #end Reggie
        "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks =>1, :slam_dunks => 15}, #end Brook
        "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks =>8, :slam_dunks => 5}, #end Mason
        "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks =>11, :slam_dunks => 1}, #end Jason
      }, #end players 
    },#end home 
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
         "Jeff Adrien" => {
          :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2}, #end Jeff 
        "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks =>15, :slam_dunks => 10}, #end Bismak
        "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds =>12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5}, #end DeSagna
        "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0}, #end Ben
        "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks =>5, :slam_dunks => 12}, #end Brendan
      } #end players
    }#end away 
  }#end game 
end # game_hash

def num_points_scored(player)  
  player_names_home = game_hash[:home][:players].keys
  player_names_away = game_hash[:away][:players].keys
  #player_points_home = game_hash[:home][:players][player][:points]
  #player_points_away = game_hash[:away][:players][player][:points]
  if player_names_home.include?(player)
    game_hash[:home][:players][player][:points]
  elsif player_names_away.include?(player)
    game_hash[:away][:players][player][:points]
  else
  puts "Player not found"
  "Please try again"
  end #end if
end 

def shoe_size(player)  
  player_names_home = game_hash[:home][:players].keys
  player_names_away = game_hash[:away][:players].keys
  #player_points_home = game_hash[:home][:players][player][:points]
  #player_points_away = game_hash[:away][:players][player][:points]
  if player_names_home.include?(player)
    game_hash[:home][:players][player][:shoe]
  elsif player_names_away.include?(player)
    game_hash[:away][:players][player][:shoe]
  else
  puts "Player not found"
  "Please try again"
  end #end if
end 

def team_colors(team)
  team_name_home = game_hash[:home][:team_name]
  team_name_away = game_hash[:away][:team_name]
  if team_name_home.include?(team)
    game_hash[:home][:colors]
  elsif team_name_away.include?(team)
    game_hash[:away][:colors]
  else 
    "Team not playing, Please try again"
  end 
end #end team_colors

def team_names
  team_name_home = game_hash[:home][:team_name]
  team_name_away = game_hash[:away][:team_name]
  both_teams = [team_name_home, team_name_away]
end #end team names

def player_numbers(team)
  team_name_home = game_hash[:home][:team_name]
  team_name_away = game_hash[:away][:team_name]
  
  if team_name_home.include?(team)
  number = []
    game_hash[:home][:players].each do |k1,v1|
      v1.each do |k2,v2|
        if k2 == :number
          #puts v2
          number.push(v2)
  
        end #if 
    end #end do
  end
  number
  elsif team_name_away.include?(team)
  number = []
  game_hash[:away][:players].each do |k1,v1|
      v1.each do |k2,v2|
        if k2 == :number
          number.push(v2) 
        end #if 
      end #do
    end #do
    number 
  else 
    "No team"
  end #end if 
end #end player_numbers

def player_stats(player)
  player_names_home = game_hash[:home][:players].keys
  player_names_away = game_hash[:away][:players].keys
  #player_points_home = game_hash[:home][:players][player][:points]
  #player_points_away = game_hash[:away][:players][player][:points]
  if player_names_home.include?(player)
    game_hash[:home][:players][player]
  elsif player_names_away.include?(player)
    game_hash[:away][:players][player]
  else
  puts "Player not found"
  "Please try again"
  end #end if
end 

def big_shoe_rebounds
all_player_stats = game_hash[:away][:players].merge(game_hash[:home][:players])
big_shoe = nil
big_shoe_name = nil
all_player_stats.each do |k,v|
#puts "im here " + k
v.each do |k2,v2|
if k2 == :shoe
  if big_shoe == nil || v2 > big_shoe
big_shoe = v2
big_shoe_name = k
  end
end #if k2
end #do2
end #do1
big_shoe_reb = all_player_stats[big_shoe_name][:rebounds]
end #big shoe


