# Write your code here!
require "pry"

def game_hash
  {

    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
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
       :rebounds => 12,
       :assists => 6,
       :steals => 3,
       :blocks => 8,
       :slam_dunks => 5
        },
        "Jason Terry" => {
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
        "Bismak Biyombo" => {
       :number => 0,
       :shoe => 16,
       :points => 12,
       :rebounds => 4,
       :assists => 7,
       :steals => 7,
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
        "Brendan Haywood" => {
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


=begin
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
       attribute.each do |data_item|
            binding.pry
      end
    end
  end
end
=end 


def num_points_scored(name)
 game_hash.each do |location, team_hash|
   
   #the below is actually iterating through the keys of the hash containing the team info, because the value of game_hash is....another hash
    team_hash.each do |key, vals|
       if key == :players     # this makes sure I'm only iterating through the right pair to begin with
        return vals[name][:points] if vals[name]  # the return keyword ensures it will pop out of the method once the answer has been found 
      end
    end
  end
end


def shoe_size(name)
  game_hash.each do |location, team_hash|
    team_hash.each do |key, val|
      if key == :players
        return val[name][:shoe] if val[name]
      end
    end
  end
end


def team_colors(team_name)
  game_hash.each do |location, team_hash|
    flag = false
    team_hash.each do |key, val|
      
      if val == team_name  # this is passing by the colors key when it iterates, and returning the entire hash...meaning it's not evaluating to true...maybe i need to use a flag
      flag = true
        
        return team_hash[:colors] if flag == true
      end
    end
  end
end

#maybe try fetch_values here?
def team_names
  names = []
  game_hash.each do |location, team_hash|
    names << team_hash.fetch_values(:team_name)
  end
  
  names.flatten   # flatten is necessary because fetch was putting two arrays inside names

end


#  takes in an argument of a team name and returns an array of the jersey number's for that team

# this is working, just need to fix the conditional because it looks like it's returning all the numbers not a specific team
def player_numbers(team_name)
  nums = []
  
  tname = false
  game_hash.each do |location, team_hash|

   
   #the below is actually iterating through the keys of the hash containing the team info, because the value of game_hash is....another hash
    team_hash.each do |key, vals|
       
       #set flag to true if it's the right team
      if vals == team_name 
        tname = true 
        # this makes sure I'm only iterating through the right pair to begin with
        if key == :players && tname == true   # might need to swap these two
          vals.each do |player, stat|   # remember stat is a hash (the value of the player name)!
          
          #push the stat into the array if it's the jersey number, otherwise keep iterating.             
            nums << stat.fetch_values(:number)
          end
        end
      end
    end
  end
  nums.flatten
end



def player_stats(name)
  
end


def big_shoe_rebounds
  
end

# Bonus 
def winning_team
  
end

def player_with_longest_name

end

#Super Bonus

def long_name_steals_a_ton?
  
end
