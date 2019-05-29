require 'pry'

def game_hash
  
  game = { 
    :home => { 
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"],
      :players => {"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
                  "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
                  "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
                  "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
                  "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
    },
    },
    
    :away => {  :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise" , "Purple"],
      :players => {"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
                  "Bismack Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
                  "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
                  "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
                  "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
    
    
    
    }
  }
  }
    

end

def num_points_scored(string)
   game_hash.each do |k,v|
    v.each do |k1,v1|
      if k1==:players 
        v1.each do |k2,v2|
          if (k2==string)
            return v2[:points]
          end
        end
        
         
      end
    end    
   end   
end 
  
def shoe_size(string)
  game_hash.each do |k,v|
    v.each do |k1,v1|
    if k1==:players
      v1.each do |k2,v2|
        if (k2==string)
        return v2[:shoe]
      end
    end
  end
 end
end
end

def team_colors(string)
   game_hash.each do |k,v|
     v.each do |k1,v1|
       if (v1==string)
         return v[:colors]
       end
    end
  end
end 



def team_names
 array = []
 string = game_hash[:home][:team_name]
 string1 = game_hash[:away][:team_name]
 array.push(string) 
 array.push(string1)
 array
end 


def player_numbers(string)
  array = []
  game_hash.each do |k,v|
    if (v[:team_name]==string)
      v[:players].each do |k1,v1|
         array.push(v1[:number])
      end  
    end
  end
  array
end 

def player_stats(string)
 game_hash.each do |k,v|
    v.each do |k1,v1|
     if (k1==:players)
      v1.each do |k2,v2|
        if (k2==string)
          return v2
        end
      end
     end
    end
  end
end



def big_shoe_rebounds
  rebounds = 0
  shoe = 0 
  game_hash.each do |k,v|
     v[:players].each do |k1,v1|
       currentShoe = v1[:shoe]
       if (currentShoe > shoe)
         shoe = currentShoe
         rebounds = v1[:rebounds]
       end
    end
  end
  rebounds
end 


def most_points_scored
  players = ""
  points = 0 
  game_hash.each do |k,v|
    v[:players].each do |k1,v1|
      currentpoints = v1[:points]
      if (currentpoints > points)
        points = currentpoints
        players = k1
      end
    end
  end
  players
end


def winning_team
  teamName = ""
  points = 0
  game_hash.each do |k,v|
    team = v[:team_name]
    teamPoints = 0;
    v[:players].each do |k1,v1|
      teamPoints = teamPoints + v1[:points]
    end
    if teamPoints > points
      points = teamPoints
      teamName = team 
    end
  end
  teamName
end

def player_with_longest_name
  player_name_length = 0
  player = ""
  game_hash.each do |k,v|
    v[:players].each do |k1,v1|
      current_name_length = k1.length
      if (current_name_length>=player_name_length)
        player_name_length = current_name_length
        player = k1
      end
    end
  end
  player
  
end


def long_name_steals_a_ton?
  most_steals = 0;
  most_steals_longest_name=0
  player_name_length = 0
  player = ""
  game_hash.each do |k,v|
    v[:players].each do |k1,v1|
      current_name_length = k1.length
      current_steals = v1[:steals]
      if (current_steals > most_steals)
        most_steals = current_steals
      end
      if (current_name_length>=player_name_length)
        player_name_length = current_name_length
        player = k1
        if (current_steals > most_steals_longest_name)
          most_steals_longest_name = current_steals
        end
      end
    end
  end
  if (most_steals_longest_name>=most_steals)
    return true
  end
  false
end 
