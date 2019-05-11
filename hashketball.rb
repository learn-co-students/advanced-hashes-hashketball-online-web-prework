
# Write your code here!

require "pry"

def game_hash
  game_hash ={
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => 
   { "Alan Anderson" => {
      :number => 0, 
      :shoe => 16, 
      :points => 22, 
      :rebounds => 12, 
      :assists => 12, 
      :steals => 3, 
      :blocks => 1, 
      :slam_dunks => 1
    },
     "Reggie Evans" => {
      :number => 30, 
      :shoe => 14, 
      :points => 12, 
      :rebounds => 12, 
      :assists => 12, 
      :steals => 12, 
      :blocks => 12, 
      :slam_dunks => 7},
    "Brook Lopez" => {
      :number => 11, 
      :shoe => 17, 
      :points => 17, 
      :rebounds => 19, 
      :assists => 10, 
      :steals => 3, 
      :blocks => 1,
      :slam_dunks => 15},
    "Mason Plumlee" => {
      :number => 1, 
      :shoe => 19, 
      :points => 26, 
      :rebounds => 12, 
      :assists => 6, 
      :steals => 3, 
      :blocks => 8, 
      :slam_dunks => 5},
    "Jason Terry" => {
      :number => 31, 
      :shoe => 15, 
      :points => 19, 
      :rebounds => 2, 
      :assists => 2, 
      :steals => 4, 
      :blocks => 11, 
      :slam_dunks => 1}
   }
   },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"], 
    :players => {"Jeff Adrien" => {
      :number => 4, 
      :shoe => 18, 
      :points => 10, 
      :rebounds => 1, 
      :assists => 1, 
      :steals => 2, 
      :blocks => 7, 
      :slam_dunks => 2}, 
    "Bismack Biyombo" => {
      :number => 0, 
      :shoe => 16, 
      :points => 12, 
      :rebounds => 4, 
      :assists => 7, 
      :steals => 7, 
      :blocks => 15, 
      :slam_dunks => 10},
    "DeSagna Diop" => {
      :number => 2, 
      :shoe => 14, 
      :points => 24, 
      :rebounds => 12, 
      :assists => 12, 
      :steals => 4, 
      :blocks => 5, 
      :slam_dunks => 5},
    "Ben Gordon" => {
      :number => 8, 
      :shoe => 15,
      :points => 33, 
      :rebounds => 3, 
      :assists => 2, 
      :steals => 1, 
      :blocks => 1, 
      :slam_dunks => 0},
     "Brendan Haywood" => {
       :number => 33, 
       :shoe => 15, 
       :points => 6, 
       :rebounds => 12, 
       :assists => 12, 
       :steals => 22, 
       :blocks => 5, 
       :slam_dunks => 12}
  }
  }
  }
end 

def num_points_scored(players_name)
  if game_hash[:home][:players].include? (players_name)
    return game_hash[:home][:players][players_name][:points]
  elsif game_hash[:away][:players].include? (players_name)
    return game_hash[:away][:players][players_name][:points]
        end
end 

def shoe_size(players_name)
  if game_hash[:home][:players].include? (players_name)
     return game_hash[:home][:players][players_name][:shoe]
  elsif game_hash[:away][:players].include? (players_name)
   return game_hash[:away][:players][players_name][:shoe]
        end
end 
  
  
def team_colors(team_name)
  if game_hash[:home][:team_name].include?(team_name)
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name].include?(team_name)
    return game_hash[:away][:colors]
end 
end 

def team_names
  teams = []
 teams << game_hash[:home][:team_name]
 teams << game_hash[:away][:team_name]
 return teams 
end 

def player_numbers(team_name)
  jerseys = []
  if game_hash[:home][:team_name].include?(team_name)
    hash_home = game_hash[:home][:players]
     hash_home.each do |name, data|
       data.each do |attribute, num|
       if attribute == :number
          jerseys << num 
        end
      end
    end
  elsif game_hash[:away][:team_name].include?(team_name)
    hash_away = game_hash[:away][:players]
     hash_away.each do |name, data|
       data.each do |attribute, num|
       if attribute == :number
          jerseys << num 
        end 
      end 
    end 
  end
return jerseys
end 



def player_stats(players_name)
  if game_hash[:home][:players].include? (players_name)
     return game_hash[:home][:players][players_name]
  elsif game_hash[:away][:players].include? (players_name)
   return game_hash[:away][:players][players_name]
end 
end 


def big_shoe_rebounds
  biggest_shoe = 0 
  number_of_rebounds = 0 
  game_hash.each do |team, stats|
    stats[:players].each do |name, data| 
      if biggest_shoe < data[:shoe]
        biggest_shoe = data[:shoe]
        number_of_rebounds = data[:rebounds]
      end 
    end
  end
  return number_of_rebounds
end 

# def big_shoe_rebounds
     
#     def get_sizes
#       sizes = []
#       hash_away = game_hash[:away][:players]
#         hash_away.each do |name, data|
#           data.each do |attribute, num|
#           if attribute == :shoe 
#             sizes << num 
#           end 
#         end
#       end 
#       hash_home = game_hash[:home][:players]
#         hash_home.each do |name, data|
#           data.each do |attribute, num|
#           if attribute == :shoe 
#             sizes << num 
#           end 
#         end 
#       end 
#       return sizes 
#       end 
  
#     def find_player(biggest)
#       home_hash = game_hash[:home][:players]
#       away_hash = game_hash[:away][:players]
#       if home_hash.include?(:shoe => biggest) 
#       home_hash.select {|person, data| data == {:shoe => biggest}}
#       elsif  away_hash.include?(:shoe => biggest) 
#       away_hash.select {|person, data|data == {:shoe => biggest}}
#         end 
#       end 
  
# sizes = get_sizes 
# sorted_sizes = sizes.sort 
# biggest = sorted_sizes[-1]
# big_shoe_player = find_player(biggest)
  
# if game_hash[:away][:players].include?(big_shoe_player)
#   return game_hash[:away][:players][big_shoe_player][:rebounds]
#   elsif game_hash[:home][:players].include?(big_shoe_player)
#     return game_hash[:home][:players][big_shoe_player][:rebounds]
#   end
# end