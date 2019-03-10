require "pry"

def game_hash
  {
:home => {:team_name => "Brooklyn Nets", 
          :colors => ["Black","White"],
         :players => { "Alan Anderson" => {:number => 0,
                                           :shoe => 16,
                                           :points => 22 ,
                                           :rebounds => 12,
                                           :assists => 12,
                                           :steals => 3,
                                           :blocks => 1,
                                           :slam_dunks => 1},
                       "Reggie Evans" => { :number => 30,
                                           :shoe => 14,
                                           :points => 12,
                                           :rebounds => 12,
                                           :assists => 12,
                                           :steals => 12,
                                           :blocks => 12,
                                           :slam_dunks => 7},
                                                    
                        "Brook Lopez"  => {:number => 11,
                                           :shoe => 17,
                                           :points => 17,
                                           :rebounds => 19,
                                           :assists => 10,
                                           :steals => 3,
                                           :blocks => 1,
                                           :slam_dunks => 15},
                        "Mason Plumlee" => {:number => 1,
                                           :shoe => 19,
                                           :points => 26,
                                           :rebounds => 12,
                                           :assists => 6,
                                           :steals => 3,
                                           :blocks => 8,
                                           :slam_dunks => 5},  
                         "Jason Terry"  => {:number => 31,
                                           :shoe => 15,
                                           :points => 19,
                                           :rebounds => 2,
                                           :assists => 2,
                                           :steals => 4,
                                           :blocks => 11,
                                           :slam_dunks => 1}
                }
      },
 :away => { :team_name => "Charlotte Hornets", 
          :colors => ["Turquoise", "Purple"],
            :players => {"Jeff Adrien"  =>{:number => 4,
                                           :shoe => 18,
                                           :points => 10 ,
                                           :rebounds => 1,
                                           :assists => 1,
                                           :steals => 2,
                                           :blocks => 7,
                                           :slam_dunks => 2},
                    "Bismak Biyombo" => { :number => 0,
                                           :shoe => 16,
                                           :points => 12,
                                           :rebounds => 4,
                                           :assists => 7,
                                           :steals => 7,
                                           :blocks => 15,
                                           :slam_dunks => 10},
                                                    
                       "DeSagna Diop"  => {:number => 2,
                                           :shoe => 14,
                                           :points => 24,
                                           :rebounds => 12,
                                           :assists => 12,
                                           :steals => 4,
                                           :blocks => 5,
                                           :slam_dunks => 5},
                          "Ben Gordon" => {:number => 8,
                                           :shoe => 15,
                                           :points => 33,
                                           :rebounds => 3,
                                           :assists => 2,
                                           :steals => 1,
                                           :blocks => 1,
                                           :slam_dunks => 0},  
                    "Brendan Haywood"  => {:number => 33,
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
    
    
def num_points_scored (name)
  game_hash.each do |location, values| 
  values.each do |k,v| if v.include?(name)
 return game_hash[location][k][name][:points]
end
end
end 
end   

def shoe_size(name)
    game_hash.each do |location,values|
    values.each do |k,v| 
    if v.include?(name)
  return game_hash[location][k][name][:shoe]
end 
end 
end 
end  


def team_colors(name)
  game_hash.each do |location, values|
    values.each do |k,v|
      if v.include?(name)
    return game_hash[location][:colors]
  end
end 
end 
end

def team_names
    team_array=[]
    team_name=""
    game_hash.each do |location,values|
      values.each do |k,v|
        if k == :team_name
          team_array << v 
        end
      end
    end 
    team_array
end
    
 def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.class == Hash
        info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end

def player_numbers(name)
array=[]

game_hash.each do |location,values|
if game_hash[location].values.include?(name)
values.each do |k,v| if k == :players 
v.each do |x,y| 
array << game_hash[location][k][x][:number].to_i

end
end
end
end
end 
return array
end  

def player_stats(player_name)
  game_hash.keys.each do |team|
    if game_hash[team][:players].keys.include?(player_name)
      return game_hash[team][:players][player_name]
    end 
  end 
end 

def player_points(player_name)
 game_hash.keys.each do |team|
    if game_hash[team][:players].keys.include?(player_name)
      return game_hash[team][:players][player_name][:points]
    end
  end
end 

def most_points_scored
   most_point = 0
   player_with_most = nil
   game_hash.each do |location, team_data|
      team_data[:players].each do |player_name, value|
         if player_points(player_name) > most_point
           most_point= player_points(player_name)
           player_with_most = player_name
         end
      end
   end
   player_with_most
end


def winning_team 
home=0 
away=0 
total_home=0
total_away=0
  
  game_hash[:home][:players].each do |player, points|
    home= player_points(player)
    total_home=total_home + home
    
  end 
     game_hash[:away][:players].each do |players,points|
       away=player_points(players)
       total_away= total_away+away
     end
    
      if total_home > total_away
             return "Brooklyn Nets"
        else 
            return "Charolette Hornets"
        
      end 
end


def player_with_longest_name
  name_length=0
  player_with=nil
  game_hash.each do |location, values|
     game_hash[location][:players].each do |players,stats|
        if players.to_s.size > name_length
          name_length= players.to_s.size
          player_with=players
        end 
        
     end 
  end
  player_with
end 



