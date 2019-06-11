require "pry"
def game_hash 
  game_hash = {:home =>{:team_name =>"Brooklyn Nets",
                        :colors =>["Black","White"],
                        :players =>{
                                   "Alan Anderson" => {
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
                                   :slam_dunks => 7
                                     
                        },
                                    "Brook Lopez" => {
                                   :number => 11,
                                   :shoe => 17,
                                   :points => 17,
                                   :rebounds => 19,
                                   :assists => 10,
                                   :steals => 3,
                                   :blocks => 1,
                                   :slam_dunks => 15
                        },
                                    "Mason Plumlee" => {
                                   :number => 1,
                                   :shoe => 19,
                                   :points => 26,
                                   :rebounds => 11,
                                   :assists => 6,
                                   :steals => 3,
                                   :blocks => 8,
                                   :slam_dunks => 5  
                        },
                                    "Jason Terry" => {
                                   :number =>31 ,
                                   :shoe => 15,
                                   :points => 19,
                                   :rebounds => 2,
                                   :assists => 2,
                                   :steals => 4,
                                   :blocks => 11,
                                   :slam_dunks => 1   
        }
     }
                                    
  }, 
               :away =>{:team_name => "Charlotte Hornets",
                        :colors => ["Turquoise", "Purple"],
                        :players => { 
                                    "Jeff Adrien" => {
                                   :number => 4,
                                   :shoe => 18,
                                   :points => 10,
                                   :rebounds => 1,
                                   :assists => 1,
                                   :steals => 2,
                                   :blocks => 7,
                                   :slam_dunks => 2 
                        },
                                    "Bismack Biyombo" => {
                                   :number => 0,
                                   :shoe => 16,
                                   :points => 12,
                                   :rebounds => 4,
                                   :assists => 7,
                                   :steals => 22,
                                   :blocks => 15,
                                   :slam_dunks => 10   
                        },
                                    "DeSagna Diop" => {
                                   :number => 2,
                                   :shoe => 14,
                                   :points => 24,
                                   :rebounds => 12,
                                   :assists => 12,
                                   :steals => 4,
                                   :blocks => 5,
                                   :slam_dunks => 5   
                        },
                                    "Ben Gordon" => {
                                   :number => 8,
                                   :shoe => 15,
                                   :points => 33,
                                   :rebounds => 3,
                                   :assists => 2,
                                   :steals => 1,
                                   :blocks => 1,
                                   :slam_dunks => 0  
                        },
                                    "Kemba Walker" => {
                                   :number => 33,
                                   :shoe => 15,
                                   :points => 6,
                                   :rebounds => 12,
                                   :assists => 12,
                                   :steals => 7,
                                   :blocks => 5,
                                   :slam_dunks => 12
          }
       } 
                 
    }
}
end
 
 
def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == player_name
       return player_stats[:points]
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == player_name
        return player_stats[:shoe]
      end
    end 
  end
end


def team_colors(name)
  array = [] 
   game_hash.each do |location, team_name|
  if team_name[:team_name] == name 
  array << team_name[:colors]
    end
  end
  array.flatten
end


def team_names
array = []
game_hash.each do |location, team|
  array << team[:team_name]
end
array
end


def player_numbers(name)
  array = []
   game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == team_data[:team_name]
        array << team_data[:players][player_name][:number]
      end
    end
  end
  array
end


def player_stats(name)
  game_hash().each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if name == player_name
        return player_stats
      end
    end
  end 
end


def big_shoe_rebounds
  largest_shoe = 0
  rebounds = 0
  player = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if largest_shoe < shoe_size(player_name)
        largest_shoe = shoe_size(player_name)
        player = player_name
          end
      end
  end
    return player_stats(player)[:rebounds]
end

def most_points_scored
  most_points = nil 
  player = nil 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
    if most_points == nil || most_points < player_stats[:points]
      most_points = player_stats[:points]
      player = player_name
    end
  end
end
player
end

def winning_team
  home_team = 0
  away_team = 0
  game_hash[:home][:players].each do |player_name, player_stats|
    home_team = player_stats[:points]
 end
  game_hash[:away][:players].each do |player_name, player_stats|
    away_team = player_stats[:points]
  end
  if home_team > away_team
      game_hash[:home][:team_name]
  elsif home_team < away_team
      game_hash[:away][:team_name]
  else
  end
end


def player_with_longest_name
  longest_name = 0
  name = nil 
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, player_stats|
      if longest_name < player_name.length
        longest_name = player_name.length
        name = player_name
      end
    end
  end
  name
end


def long_name_steals_a_ton?
 most_steals = 0 
 player_with_most_steals = nil
 game_hash.each do |location, team_data|
   team_data[:players].each do |player_name, player_stats|
      if player_stats[:steals] > most_steals
        most_steals = player_stats[:steals]
       player_with_most_steals = player_name
     end
   end
 end
 player_with_longest_name == player_with_most_steals ? true : false 
end


