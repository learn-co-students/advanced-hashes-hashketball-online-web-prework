# Write your code here!
require 'pry'
def game_hash
    hashy = {
      :home =>{
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => [
          {
            :player_name => "Alan Anderson",
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          },
          {
            :player_name => "Reggie Evans",
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          },
          {
            :player_name => "Brook Lopez",
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          },
          {
            :player_name => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          {
            :player_name => "Jason Terry",
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
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
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          },
          {
            :player_name => "Bismack Biyombo",
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          },
          {
            :player_name => "DeSagna Diop",
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          },
          {
            :player_name => "Ben Gordon",
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          },
          {
            :player_name => "Kemba Walker",
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }
        ]
      }
    }
    return hashy
end   

def num_points_scored(arg)
    game_hash.each do |key, value| 
       value.each do |other_key, other_value|
          if other_key == :players 
            other_value.each do |name|
              if name[:player_name] == arg
                return name[:points] 
              end   
            end   
          end   
       end  
    end  
end  

def shoe_size(arg)

    game_hash.each do |key, value| 
       value.each do |other_key, other_value|
          if other_key == :players 
            other_value.each do |shoe|
              if shoe[:player_name] == arg
                return shoe[:shoe] 
              end   
            end   
          end   
       end  
    end  
end 

def team_colors(arg)
     game_hash.each do |key, value| 
      value.each do |other_key, other_value|
        if other_key == :team_name
            if other_value == arg
              return value[:colors]
            end 
        end 
      end  
    end 
end

def team_names 
arr = []
  game_hash.each do |key, value|
    arr << value[:team_name]
  end
  return arr
end  

def player_numbers(arg)
  game_hash.each do |key, value|
    if value[:team_name] == arg
      return value[:players].map {|x| x[:number]}
    end
  end
end 

def player_stats(arg)
hashy_stats = {}
  game_hash.each do |key, value|
    value[:players].each do |one|
      if one[:player_name] == arg
        hashy_stats = one
      end
    end
  end
  hashy_stats.delete(:player_name)
  return hashy_stats
end 


def big_shoe_rebounds
  
big_shoe = 0
rebounds = 0

game_hash.each do |key, value|
 value[:players].each do |name|
  if name[:shoe] > big_shoe
    big_shoe = name[:shoe]
    rebounds = name[:rebounds]
  end  
 end
end
return rebounds
  
end  

def most_points_scored
  points = 0
name = ''
game_hash.each do |key, value|
  value[:players].each do |vals|
  if vals[:points] > points
    points = vals[:points]
    name = vals[:player_name]
  end
  end 
end
return name
end  

def winning_team
  home_points = 0
away_points = 0

game_hash.each do |key, value|
  if key == :home
  value[:players].each do |name|
    home_points += name[:points]
  end
  else 
  value[:players].each do |name|
    away_points += name[:points]
  end
  end
end

if home_points > away_points
  return "Brooklyn Nets"
else
  return "Charlotte Hornets"  
end

end  

def player_with_longest_name
name_arr = []
game_hash.each do |key, value|
  value[:players].each do |name|
    name_arr << name[:player_name]
  end
end

sorted_arr = name_arr.sort_by {|x| x.length}

return sorted_arr[-1]
end  


def big_steal 
  biggest_steal = 0
game_hash.each do |key, value|
  value[:players].each do |name|
      if name[:steals] > biggest_steal
        biggest_steal = name[:steals]
      end
  end
end  
return biggest_steal
end   





def long_name_steals_a_ton?
big = big_steal
long = player_with_longest_name 

if big == long 
  return FALSE
else 
  return TRUE
end   

end 










