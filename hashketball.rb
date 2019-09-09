require 'pry'

def game_hash
  
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0, 
          shoe: 16, 
          points: 22, 
          rebounds: 12, 
          assists: 12, 
          steals: 3, 
          blocks: 1, 
          slam_dunks: 1},
        "Reggie Evans" => {
          number: 30, 
          shoe: 14, 
          points: 12, 
          rebounds: 12, 
          assists: 12, 
          steals: 12, 
          blocks: 12, 
          slam_dunks: 7},
        "Brook Lopez" => {
          number: 11, 
          shoe: 17, 
          points: 17, 
          rebounds: 19, 
          assists: 10, 
          steals: 3, 
          blocks: 1, 
          slam_dunks: 15},
        "Mason Plumlee" => {
          number: 1, 
          shoe: 19, 
          points: 26, 
          rebounds: 11, 
          assists: 6, 
          steals: 3, 
          blocks: 8, 
          slam_dunks: 5},
        "Jason Terry" => {
          number: 31, 
          shoe: 15, 
          points: 19, 
          rebounds: 2, 
          assists: 2, 
          steals: 4, 
          blocks: 11, 
          slam_dunks: 1}
      }
    },
    
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4, 
          shoe: 18, 
          points: 10, 
          rebounds: 1, 
          assists: 1, 
          steals: 2, 
          blocks: 7, 
          slam_dunks: 2},
        "Bismack Biyombo" => {
          number: 0, 
          shoe: 16, 
          points: 12, 
          rebounds: 4, 
          assists: 7, 
          steals: 22, 
          blocks: 15, 
          slam_dunks: 10},
        "DeSagna Diop" => {
          number: 2, 
          shoe: 14, 
          points: 24, 
          rebounds: 12, 
          assists: 12,
          steals: 4, 
          blocks: 5, 
          slam_dunks: 5},
        "Ben Gordon" => {
          number: 8, 
          shoe: 15, 
          points: 33, 
          rebounds: 3, 
          assists: 2, 
          steals: 1, 
          blocks: 1, 
          slam_dunks: 0},
        "Kemba Walker" => {
          number: 33, 
          shoe: 15, 
          points: 6, 
          rebounds: 12, 
          assists: 12, 
          steals: 7, 
          blocks: 5, 
          slam_dunks: 12}
        },
    }
    
  }
  hash
end

def num_points_scored(player_name)
  access = game_hash                                                        #access the information with variable
  
  access.each do |home_away,  team_info|                                    #iterate into the first hash
    team_info.each do |team_info_selector, value|                           #iterate into the second hash
      if value.include?(player_name)                                        #check for specific player name
        return access[home_away][team_info_selector][player_name][:points]  #when found, return their points
      end
    end
  end
end

def shoe_size(player_name)                                                  #same as above!
  access = game_hash
  
  access.each do |home_away,  team_info|
    team_info.each do |team_info_selector, value|
      if value.include?(player_name)
        return access[home_away][team_info_selector][player_name][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  access = game_hash
  
  access.each do |home_away,  team_info|                                  #same as above until . . .
    if access[home_away].values.include?(team_name)                     #check if the team name matches
      team_info.each do |team_info_selector, value|                     #if it does, then iterate into that team
        if team_info_selector == :colors                                #force the selector to be :colors 
            return value                                                  #and return it's value!
        end
      end
    end
  end
end

def team_names
  access = game_hash
  
  team_array = []
  
  access.each do |home_away,  team_info|                                  #same as above except . . .
    team_info.each do |team_info_selector, value|
      if team_info_selector == :team_name
        team_array << value
      end
    end
  end
  return team_array                                                       #RETURN YOUR STUFF MAN!
end
  
def player_numbers(team_name)
  access = game_hash
  numbers_array = []
  
  access.each do |home_away,  team_info|                                  #same as above until . . .
    if access[home_away].values.include?(team_name)                     #check if the team name matches
      team_info.each do |team_info_selector, value|                     #if it does, then iterate into that team
        if value.class == Hash
          value.each do |player, stats|
              stats.each do |stat, int|
                if stat == :number 
                  numbers_array << int.to_i
                end
              
            end
          end
        end
      end
    end
  end
  return numbers_array
end
  
def player_stats(player_name)
  access = game_hash
  
  access.each do |home_away, team_info|
    team_info.each do |team_info_selector, value|
      if value.include?(player_name)
        return access[home_away][team_info_selector][player_name]
      end
    end
  end
  
end

def big_shoe_rebounds
  access = game_hash
  player_name = ""
  shoe_size = 0
  
  access.each do |home_away,  team_info|                     
      team_info.each do |team_info_selector, value|
        if value.class == Hash
          value.each do |player, stats|
              stats.each do |stat, int|
                if stat == :shoe 
                  if int > shoe_size
                    shoe_size = int
                    player_name = player
                  end
                end
              end
          end
          return access[home_away][team_info_selector][player_name][:rebounds]
        end
      end
  end
end

def most_points_scored
  access = game_hash
  player_name = ""
  points = 0 
  
  access.each do |home_away,  team_info|                     
      team_info.each do |team_info_selector, value|
        if value.class == Hash
          value.each do |player, stats|
              stats.each do |stat, int|
                if stat == :points 
                  if int > points
                    points = int
                    player_name = player
                  end
                end
              end
          end
        end
      end
  end
  return player_name                                      #returned outside everything to make sure it iterates through both teams
  
  
  
end

def winning_team
  access = game_hash
  winner = ""
  brooklyn_points = 0 
  charlotte_points = 0 
  
  access.each do |home_away, team_info|
    if home_away == :home
      team_info.each do |team_info_selector, value|
        if value.class == Hash 
          value.each do |player, stats|
            stats.each do |stat, int|
              if stat == :points
                brooklyn_points += int
                winner = access[:home][:team_name]
              end
            end
          end
        end
      end
    else
      team_info.each do |team_info_selector, value|
        if value.class == Hash 
          value.each do |player, stats|
            stats.each do |stat, int|
              if stat == :points
                charlotte_points += int
                if charlotte_points > brooklyn_points
                  winner = access[:away][:team_name]
                end
              end
            end
          end
        end
      end
    end
  end
  return winner
end

def player_with_longest_name
  access = game_hash
  longest_name = ""
  longest_name_num = 0 
  
  access.each do |home_away, team_info|
    team_info.each do |team_info_selector, value|
      if value.class == Hash 
        value.each do |player, stats|
          if longest_name_num < player.length 
            longest_name = player
            longest_name_num = player.length
          end
        end
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  
  access = game_hash
  steal_amount = 0
  steal_most_name = ""
  steal_a_ton = false
  
  access.each do |home_away,  team_info|                     
      team_info.each do |team_info_selector, value|
        if value.class == Hash
          value.each do |player, stats|
              stats.each do |stat, int|
                if stat == :steals 
                  if int > steal_amount
                    steal_amount = int
                    steal_most_name = player
                  end
                end
              end
          end
        end
      end
  end
  
  if player_with_longest_name == steal_most_name
    steal_a_ton = true 
  end
  
  steal_a_ton
  
end