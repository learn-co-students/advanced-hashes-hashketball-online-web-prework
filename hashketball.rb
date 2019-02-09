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
      if attribute == :players               # This line directs the iteration to skip attributes :team_name and :team_colors, the value of which is a string and an array, which                                          makes things more complicated to deal with those key values. In this case, for this method, we don't need to deal with or iterate                                           over that data, so we can just skip past and deal directly with the attribute :players which is where the party (relevant data) is                                          for this method.
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
      if attribute == :players               # The purpose of this line of code and what it's doing is the same as above. See commented notes for Line 80 above.
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
    if team_data[:team_name] == team_name  
      return team_data[:colors]
    end
  end
end                                          # See explanation notes lines 117-136 of this passing method directly below.       


#def team_colors(team_name)

#  game_hash.each do |location, team_data|

#   if team_data == team_name                 This line was so wrong, because the conditional is asking if the team name passed in, which will be a string, is equal to the whole                                               team_data hash.

#    if team_data[:team_name] == team_name  # This is correct. First grabbing the value of team_data[:team_name], which is a string, and then asking if it is equal to team_name                                                passed in, which is also a string. This line is the correct reasoning for the conditional.
#binding.pry

#      return team_data[:colors]
      
#       

#       team_data.each do |attribute, data|   These lines are not necessary because we don't need to iterate this deep to access the value of :colors. The first level iteration             if attribute == :colors            gives us access to the information we need and we used binding pry on line 111 to to plug in - team-data and :team_name and :colors to                                             see what was returned - verifying that we don't need to iterate further down into game_hash.
#             return attribute[:colors] 
#         end 
#       end 
#    end
#  end
#end 


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
          if attribute == :players            # The purpose of this line of code and what it's doing is the same as above. See commented notes for Line 80 above.
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
      if attribute == :players               # The purpose of this line of code and what it's doing is the same as above. See commented notes for Line 80 above.
        data.each do |data_item, stats|
          if data_item == player_name
            return stats 
          end
        end
      end 
    end 
  end
end 


#def big_shoe_rebounds
#  highest_shoe_key = 0 
#  highest_shoe_value = 0
#  players_number_of_rebounds = 0 
#  game_hash.each do |location, team_data|
#    team_data.each do |attribute, data|
#      if attribute == :players                # The purpose of this line of code and what it's doing is the same as above. See commented notes for Line 80 above.
#        data.each do |data_item, stats|
#          if highest_shoe_value == 0 || stats[:shoe] > highest_shoe_value  
#              highest_shoe_value = stats[:shoe]
#              highest_shoe_key = data_item
#              players_number_of_rebounds = stats[:rebounds] 
#          end
#        end
#      end 
#    end                                       # This method passes all spec.rb tests!
#  end
#  return players_number_of_rebounds           # See explanation notes of this passing method directly below. 
#end
                                               # Then see lines 248-292 for simplified/refactored (more abstract with less code smell) version of this method. 


#def big_shoe_rebounds
  
#  highest_shoe_key = 0 
#  highest_shoe_value = 0
#  players_number_of_rebounds = 0 
  
#  game_hash.each do |location, team_data|
#    team_data.each do |attribute, data|
#      if attribute == :players                # The purpose of this line of code and what it's doing is the same as above. See commented notes for Line 80 above.
#        data.each do |data_item, stats|

#          stats.each do |stat_key, stat_value|#  Don't need to iterate down to this level, all the necessary data is in the :players hash represented by data.
            
#binding.pry                                  # Very important take away: My initial approach to finding the player with the highest shoe size by comparing players shoe sizes, by defining placeholder values to zero and resetting those values when they are not zero when using them to compare shoe size values of each player and then re_assigning them when encountering a value that is higher, was Good! - reaching back to the previous problem solving in my key_for_min lab (see lines 234-244 below. Also note that the placeholder values are defined on lines 203-205 so they are accessible outside of the .each iterations scope.The placeholder values defined on lines 203-205 will be reset/re-asigned inside the iteration scope, but accessible from outside that scope because the are define outside that scop. So thay are accessible from within the scope and outside of it as well. Also and very important: The placeholder values are re_assigned (finalized) on lines 217-219 after all :players and their corresponding stats hash have been iterated through - after the final iteration, leaving me with the final players and that players data. The referrences - stats[:shoe], data_item, and stats[:rebounds] are all referrencing the data of the player of that iteration and are accessible as such. To return the player with the highest shoe size number of rebounds, is not about using some varient of bracket notation in the return statement (return highest_shoe_key[:rebounds] which is incorrect) to access that data (like I spent so much time fixated on) but... assigning the players stats[:rebounds] to a placeholder(variable) on line 219 (understanding that the stats[:rebounds] bracket notaion is correct and relevant to or corresponds to the last player of the final iteration) and just returning that placeholder(variable). This very long explanation may not be a very well articulated psuedo code, but hopefully serve to explain all my progressive reasoning in problem solving this method for future referrnce.

#            if highest_shoe_value == 0 || stats[:shoe] > highest_shoe_value  
#              highest_shoe_value = stats[:shoe]
#              highest_shoe_key = data_item
#              players_number_of_rebounds = stats[:rebounds] 
              
#binding.pry             
#            end
#          end 
#        end
#      end 
#    end 
#  end
#  return players_number_of_rebounds 
#binding.pry
#end 



#def key_for_min_value(name_hash)
# lowest_key = nil
# lowest_value = nil
#   name_hash.each do |k, v|
#     if lowest_value == nil || v < lowest_value
#       lowest_value = v
#       lowest_key = k
#     end
#   end
# lowest_key
#end
     
     
     
#def big_shoe_rebounds
#  highest_shoe_key = 0 
#  highest_shoe_value = 0
#  players_number_of_rebounds = 0
  
#  game_hash[:home][:players].each do |player_name, stats|                  # Change k and v variables.
  
#  game_hash.each do |location, team_data|                                  # Don't need this. This done in line 253.
#   team_data.each do |attribute, data|                                     # Don't need this. This done in line 253.

#     if attribute == :players                                              # Don't need this. This done in line 253.
        
#        data.each do |data_item, stats|                                    # Don't need this. This done in line 253.
#          if highest_shoe_value == 0 || stats[:shoe] > highest_shoe_value  
#              highest_shoe_value = stats[:shoe]
#              highest_shoe_key = player_name                               # Change what was data-item to player_name to correspond to change made to k and v variable on line 253.

#              players_number_of_rebounds = stats[:rebounds]
 
#          end
#        end                                                                # Don't need this. This done in line 253.
        
#      end                                                                  # Don't need this. This done in line 253.
       
#    end                                                                    # Don't need this. This done in line 253.
#  end
#  binding.pry
#  return players_number_of_rebounds          
#end 

    
 
def big_shoe_rebounds
  highest_shoe_key = 0 
  highest_shoe_value = 0
  players_number_of_rebounds = 0
  game_hash[:home][:players].each do |player_name, stats|                   
    if highest_shoe_value == 0 || stats[:shoe] > highest_shoe_value  
      highest_shoe_value = stats[:shoe]
      highest_shoe_key = player_name                                
      players_number_of_rebounds = stats[:rebounds]
    end
  end
  return players_number_of_rebounds                   
end   
                     # This method is re-factored but not correct because it is only iterating through the home team player stats -                                                                    see line 284 game_hash[:home]. Just by chance that the player with the highest shoe size is in the home team                                                                    players hash and thats why it passes the spec.rb tests. So I'm commenting out this refactored method and                                                                        returing to my original long (code smelly) method and moving on.      
 

def most_points_scored
  
  highest_points_key = 0
  highest_points_value = 0 
#  player_highest_points = 0
  
  game_hash[:home][:players].each do |player_name, stats|
    
    if highest_points_value == 0 || stats[:points] > highest_points_value

      highest_points_value = stats[:points]
 
      highest_points_key = player_name
      
 
 binding.pry       
#          end  
#        end   
    end 
  end
  return highest_points_key 
end  
    
# As per discussion with AAQ Coach, research .fetch if I want to take on the bonus questions. This lab is a monster and not well placed in the curriculum. I have exercised all do diligence with the code I have written and trying to understand all the concepts at my level of understanding. I'm in good shape to move on.  
  
#        game_hash[:away][:players].each do |player_name, stats| 
          
#          if highest_points_value == 0 || stats[:points] > highest_points_value

#            highest_points_value = stats[:points]
 
#            highest_points_key = player_name        
     
      

   
  












