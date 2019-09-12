require "pry"
# Write your code here!
def game_hash
  {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks =>1},
      {:player_name => "Reggie Evans", :number => 30,:shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
      {:player_name => "Brook Lopez", :number => 11,:shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
      {:player_name => "Mason Plumlee", :number => 1,:shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
      {:player_name => "Jason Terry", :number => 31,:shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks =>1}]
  },
    :away => {
      :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {:player_name => "Jeff Adrien", :number => 4,:shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks =>2},
      {:player_name => "Bismack Biyombo", :number => 0,:shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks =>10},
      {:player_name => "DeSagna Diop", :number => 2,:shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
      {:player_name => "Ben Gordon", :number => 8,:shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
      {:player_name => "Kemba Walker", :number => 33,:shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}]
  }
  }
end

def num_points_scored(name)
  points = 0
  game_hash.each do |team, team_details|
   team_details[:players].each do |player, stats|
    if player[:player_name] == name
      points = player[:points]
    end
   end 
  end
  points
end

num_points_scored("Jeff Adrien")

def shoe_size(name)
  size = 0
  game_hash.each do |team, team_details|
   team_details[:players].each do |player, stats|
    if player[:player_name] == name
     size = player[:shoe]
    end
   end 
  end
  size
end

def team_colors(name)
  colors = []
  game_hash.each do |team, team_details|
   if team_details[:team_name] == name
    colors = team_details[:colors]
   end 
  end
  colors
end

team_colors("Charlotte Hornets")

def team_names
  team_name_array = []
  game_hash.each do |team, details|
    details.each do |detail, specifics|
      if detail == :team_name
        team_name_array.push(specifics)
      end
    end 
  end 
  team_name_array
end

def player_stats(name)
  stats_hash = {}
  game_hash.each do |team, details|
    details[:players].each do |stats|
      if stats[:player_name] == name
        stats_hash = stats.dup
        stats_hash.delete(:player_name)
      end
    end
  end 
  stats_hash
end

def player_numbers(name)
  jersey_numbers = []
  game_hash.each do |team, details|
    if details[:team_name] == name
      details[:players].each do |player|
        jersey_numbers.push(player[:number])
      end
    end
  end 
  jersey_numbers
end


def big_shoe_rebounds
  shoe_sizes = []
  rebounds = 0
  game_hash.each do |team, team_details|
   team_details[:players].each do |player, stats|
    shoe_sizes.push(player[:shoe])
    biggest = shoe_sizes.max
    biggest
    if player[:shoe] == biggest
      rebounds = player[:rebounds]
    end
   end 
  end
  rebounds
end

def most_points_scored
  points = []
  high_scorer = ""
  game_hash.each do |team, team_details|
   team_details[:players].each do |player, stats|
    points.push(player[:points])
    highest = points.max
    if player[:points] == highest
      high_scorer = player[:player_name]
    end
   end 
  end
  high_scorer
end

def winning_team
  home_points = []
  away_points = []
  winner = ""
  game_hash.each do |team, team_details|
   team_details[:players].each do |player, stats|
    if team == :away
      away_points.push(player[:points])
    else
      home_points.push(player[:points])
    end
    away_score = away_points.sum
    home_score = home_points.sum
    if away_score > home_score
      winner = game_hash[:away][:team_name]
    else
      winner = game_hash[:home][:team_name]
    end
   end 
  end
  winner
end

def player_with_longest_name
  long_name = ""
  names = []
  game_hash.each do |team, team_details|
   team_details[:players].each do |player, stats|
    names.push(player[:player_name])
   end 
  end
  long_name = names.max_by{|x| x.length}
  long_name
end

def long_name_steals_a_ton?
  long_name = player_with_longest_name
  most_steals = 0 
  steals= []
  game_hash.each do |team, team_details|
   team_details[:players].each do |player, stats|
    steals.push(player[:steals])
    most_steals = steals.max
   end
   
   team_details[:players].each do |x, y| 
     if x[:player_name] == long_name && x[:steals] == most_steals
      return true 
     end
    end
  end
  false
end
p long_name_steals_a_ton?