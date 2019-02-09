require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1
          },
          "Reggie Evans" => {
            :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7
          },
          "Brook Lopez" => {
            :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15
          },
          "Mason Plumlee" => {
            :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5
          },
          "Jason Terry" => {
            :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1
          }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2 
        },
        "Bismak Biyombo" => {
          :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10 
        },
        "DeSagna Diop" => {
          :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5 
        },
        "Ben Gordon" => {
          :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0 
        },
        "Brendan Haywood" => {
          :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12
        }
      }
    }
  }
  
end


#def good_practices
#  game_hash.each do |location, team_data|
    
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    
    #binding.pry
    
#      team_data.each do |attribute, data|
        
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        
        #binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        
#       data.each do |data_item|
            #binding.pry
#      end
#    end
#  end
#end

#good_practices


def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item, stats|
          if data_item == name
            return stats[:points] 
          end
        end
      end 
    end
  end
end 



def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item, stats|
          if data_item == name
            return stats[:shoe] 
          end
        end
      end 
    end
  end
end 


def team_colors(team_name)

  game_hash.each do |location, team_data|

#   if team_data == team_name                This line was so wrong, because the conditional is asking if the team name passed in, which will be a string, is equal to the whole                                               team_data hash.

    if team_data[:team_name] == team_name  # This is correct. First grabbing the value of team_data[:team_name], which is a string, and then asking if it is equal to team_name                                            passed in, which is also a string. This line is the correct reasoning for the conditional.
#binding.pry

      return team_data[:colors]
      
#       

#       team_data.each do |attribute, data|  These lines are not necessary because we don't need to iterate this deep to access the value of :colors. The first level iteration             if attribute == :colors            gives us access to the information we need and we used binding pry on line 111 to to plug in - team-data and :team_name and :colors to                                            see what was returned - verifying that we don't need to iterate further down into game_hash.
#             return attribute[:colors] 
#         end 
#       end 
    end
  end
end


def team_names
  team_name_file = []
    game_hash.each {|location, team_data| team_name_file << team_data[:team_name]} 
      team_name_file 
end 
    
    
    
def player_numbers(team_name)
  team_numbers_file = []
    game_hash.each do |location, team_data|
      if team_data[:team_name] == team_name
        team_data.each do |attribute, data|
          if attribute == :players 
            data.each do |data_item, stats|
              team_numbers_file << stats[:number]
            end 
          end 
        end 
      end 
    end
  team_numbers_file
end


def player_stats(player_name) 
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players 
        data.each do |data_item, stats|
          if data_item == player_name
            return stats 
          end
        end
      end 
    end 
  end
end 


def big_shoe_rebounds
  
  highest_shoe_key = nil 
  
  highest_shoe_value = nil
  
  number_of_rebounds = nil 
  
  game_hash.each do |location, team_data|
    
    team_data.each do |attribute, data|
      
      if attribute == :players 
      
        data.each do |data_item, stats|

          stats.each do |stat_key, stat_value|
            
           
#binding.pry             
            if highest_shoe_value == nil || stats[:shoe] > highest_shoe_value
              
              highest_shoe_value = stats[:shoe]
              
              highest_shoe_key = data_item
              
              number_of_rebounds = stats[:rebounds] 
              
              
#binding.pry             
            end
          end
        end
      end 
    end 
  end
  return number_of_rebounds 
#binding.pry
end 



#if stat_key[:shoe] == nil || stat_value > highest_value 
          
#            if highest_value == nil || stat_value > highest_value
              
#              highest_value = stat_value
              
#              highest_key = stat_key
     
    
 
    
    
  
  
        
        
      

   
  












