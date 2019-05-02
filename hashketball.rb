# Write your code here!

require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        
        "Alan Anderson"=> {
          :number => 0,
          :shoe => 16, 
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        
          "Reggie Evans"=> {
          :number => 30,
          :shoe => 14, 
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
             
          "Brook Lopez"=> {
          :number => 11,
          :shoe => 17, 
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        
          "Mason Plumlee"=> {
          :number => 1,
          :shoe => 19, 
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
         
         "Jason Terry"=> {
          :number => 31,
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
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        
          "Jeff Adrien"=> {
          :number => 4,
          :shoe => 18, 
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        
          "Bismak Biyombo"=> {
          :number => 0,
          :shoe => 16, 
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
             
          "DeSagna Diop"=> {
          :number => 2,
          :shoe => 14, 
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        
          "Ben Gordon"=> {
          :number => 8,
          :shoe => 15, 
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
         
         "Brendan Haywood"=> {
          :number => 33,
          :shoe => 15, 
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  } 
end  

def num_points_scored(name)
  game_hash.each do |k, v| 
      #k is either away or home
    v.each do |x, y|      
      if x == :players #we are in players now
        y.keys.each do |a|
          #y is the values of players so the players.
          if a == name
          #team = k
         #binding.pry
          return y[name][:points]
          end
        end
      end
    end
  end
end  

def shoe_size(name) 
game_hash.each do |k, v| 
      #k is either away or home
    v.each do |x, y|      
      if x == :players #we are in players now
        y.keys.each do |a|
          #y is the values of players so the players.
          if a == name
          #team = k
         #binding.pry
          return y[name][:shoe]
          end
        end
      end
    end
  end
  #puts shoe
end



def shoe_size(name) 
  game_hash.each do |key, teams|
    teams.each do |team_keys, team_data|
      if team_keys == :players
        team_data.keys.each do |player_names|
          if player_names == name
            return team_data[name][:shoe]
          end
        end
      end
    end
  end 
end   



def team_colors(team)
 team_key = nil
  game_hash.each do |key, teams|
    teams.each do |team_keys, team_data|
      if team_data == team
        team_key = key
      end
    end
  end 
  return game_hash[team_key][:colors]
 end
 
def team_names
  names = []
  game_hash.each do |key, teams|
    teams.each do |team_keys, team_data|
      if team_data.is_a? String 
        names <<  team_data
        end
      end
    end
    return names
  end 

def player_numbers(team)
 jersey_numbers = []
  game_hash.each do |key, teams|
    teams.each do |team_keys, team_data|
      if team_data == team
        teams.each do |this_team_k, this_team_data|
         if this_team_data.is_a?(Hash)
         this_team_data.each do |player_name, player_data|
         player_data.each do |this_pl_k, this_pl_data|
         if this_pl_k == :number        
         jersey_numbers << this_pl_data
                end
              end
            end
          end
        end
      end   
    end   
  end
  jersey_numbers.sort
end

#basically a modified shoe_size method 
def player_stats(name)
   game_hash.each do |key, teams|
    teams.each do |team_keys, team_data|
      if team_keys == :players
        team_data.keys.each do |player_names|
          if player_names == name
            return team_data[name]
          end
        end
      end
    end
  end 
end     
  
def big_shoe_rebounds  
  biggest_shoe = nil
  biggest_name = nil
  this_key = nil
  game_hash.each do |key, teams|
    teams.each do |team_keys, team_data|
      if team_data.is_a?(Hash)
      team_data.each do |this_pl_k, this_pl_data|
        if this_pl_data.is_a?(Hash)
          this_pl_data.each do |stats_k, stats_d|
          if stats_k == :shoe
              if biggest_shoe == nil || stats_d > biggest_shoe
              biggest_shoe = stats_d
              biggest_name = this_pl_k
              this_key = key
            end 
          end
          end
         end
        end
      end
    end
  end 
  return game_hash[this_key][:players][biggest_name][:rebounds]
 end    