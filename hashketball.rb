 require "pry"

def game_hash
   game_hash = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => [
       {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
       {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
       {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
       {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
       {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
       ]
     },

    :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => [
       {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
       {player_name: 'Bismak Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
       {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
       {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
       {player_name: 'Brendan Haywood', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
       ]
     }
   }
  end
  
def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out! 
        
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
           
      end
  end
end
   
   
 #location refers to home/away
 
def num_points_scored(player_name)
   game_hash.each do |location, keys|
     keys[:players].each do |player|
       return player[:points] if player[:player_name] == player_name
     end
   end
end
 
  

def shoe_size(player_name)
   game_hash.each do |location, keys|
     keys[:players].each do |player|
       return player[:shoe] if player[:player_name] == player_name
     end
   end
end
 
 
 
 
def team_colors(team_name)
  game_hash.each do |location, keys|
    if keys[:team_name] == team_name
      return keys[:colors]
    end
  end
end




def team_names
  teams = []
  game_hash.each do |location, keys|
    teams<< keys[:team_name]
  end
  teams
end


def shoe_size(player_name)
  game_hash.each do |location, keys|
    keys[:players].each do |player|
      return player[:shoe] if player[:player_name] == player_name
    end
  end
end


def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |location, keys|
      if keys[:team_name] == team_name
        keys[:players].each do |player|
          jersey_numbers<< player[:number]
        end
      end
  end
  jersey_numbers
#  binding.pry
end


# def shoe_size(player_name)
#   game_hash.each do |location, keys|
#     keys[:players].each do |player|
#       return player[:shoe] if player[:player_name] == player_name
#     end
#   end
# end


def player_stats(player_name)
  player_stats = []
  game_hash.each do |location, keys|
    keys[:players].each do |player_info|
      if player_info[:player_name] == player_name
        player_info.delete(:player_name)
        player_stats<< player_info
      end 
    end
  end
  player_stats[0]
  #binding.pry
end

def big_shoe_rebounds
  biggest_shoe_player = 0
  rebounds = 0
  game_hash.each do |location, keys|
    keys[:players].each do |player_info|
      if player_info[:shoe] > biggest_shoe_player
        biggest_shoe_player = player_info[:shoe]
        rebounds = player_info[:rebounds]
      end
    end
  end
  rebounds
  #binding.pry
end

##bonus challenges

def most_points_scored 
  top_points = 0
  highest_scoring_player = []
  player_team = []
  game_hash.each do |location, keys|
    keys[:players].each do |player_info|
      if player_info[:points] > top_points
        top_points = player_info[:points]
        highest_scoring_player = player_info[:player_name]
        player_team = keys[:team_name]
      end
    end
  end
  puts "The highest scoring player is #{highest_scoring_player} of the #{player_team} with #{top_points} points."
end

# above code puts:
# The highest scoring player is Ben Gordon of the Charlotte Hornets with 33 points.


# def winning_team
  
#   home_points = []
#   away_points = []

#   home_team = game_hash[:home][:team_name]
#   away_team = game_hash[:away][:team_name]
  
#   home_points<< 
#     game_hash[:home][:players][:points].to_i
  
#   away_points<< 
#     game_hash[:away][:players][:points].to_i

#   if home_points.sum = away_points.sum
#     puts "Tie game! The #{home_team} and the #{away_team} each scored #{home_points.sum}.""

#   elsif home_points.sum > away_points.sum
#     puts "The #{home_team} beat the #{away_team}, #{home_points.sum} - #{away_points.sum}."

#   elsif home_points.sum < away_points.sum
#     puts "The #{away_team} beat the #{home_team}, #{away_points.sum} - #{home_points.sum}."
#   end

  
# end

# above code returns: no implicit conversion of symbol into integer
      
      
# def player_with_the_longest_name
#   all_player_names = []
#   longest_name_length = 0
#   longest_name_player = []
  
#   game_hash.each do |location, keys|
#     keys.each do |player_info|
#       all_player_names<< player_info[:player_name]
#       i = 0 
#       while i < all_player_names.length 
#         if all_player_names[i].length > longest_name_length
#           longest_name_length = all_player_names[i].length
#           longest_name_player = all_player_names[i]
#         end
          
#         i+= 1 
#       end
#     end
#     puts "#{longest_name_player} has the longest name, with #{longest_name_length} characters."
#   end
  
#   above code returns: no implicit conversion of Symbol into Integer
  
  
        
      


  