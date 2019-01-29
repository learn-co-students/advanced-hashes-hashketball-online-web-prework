require "pry" 

def game_hash
  game = {
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

def num_points_scored(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, att_data|
      if attribute == :players
        #binding.pry 
        att_data.each do |name, nam_data|
          if name == player_name
             #binding.pry 
             nam_data.each do |data, value|
             #binding.pry
               if data == :points
                 return value 
               end
             end
          end
        end
      end
    end
  end
end
         
def shoe_size(player_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, att_data|
      if attribute == :players
        #binding.pry 
        att_data.each do |name, nam_data|
          if name == player_name
             #binding.pry 
             nam_data.each do |data, value|
             #binding.pry
               if data == :shoe
                 return value 
               end
             end
          end
        end
      end
    end
  end
end         

def team_colors(team)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, att_data|
      if attribute == :team_name
        if att_data == team 
          return game_hash[location][:colors]
        end
      end
    end
  end
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, att_data|
      if attribute == :team_name
        team_names << game_hash[location][:team_name]
      end
    end
  end
  team_names
end

def player_numbers(team)
  jersey_num = []
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team 
      team_data.each do |attribute, att_data|
        if attribute == :players
          att_data.each do |ply_name, ply_data|
              jersey_num << game_hash[location][attribute][ply_name][:number]
          end
        end
      end
    end
  end
  jersey_num
end

def player_stats(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, att_data|
      if attribute == :players
        att_data.each do |ply_name, ply_data|
          if ply_name == name
            return ply_data
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = ""
  big_size = 0 
  big_rebound = 0 
  game_hash.each do |location, team_data|
    team_data.each do |attribute, att_data|
      if attribute == :players
        att_data.each do |ply_name, ply_data|
          ply_data.each do |ind_data, value|
            if ind_data == :shoe
              if value > big_size
                big_size = value
                big_shoe = ply_name
              end
            end
          end
        end
      end
    end
  end
  big_shoe
  
  game_hash.each do |location2, team_data2|
    team_data2.each do |attribute2, att_data2|
      if attribute2 == :players
        att_data2.each do |ply_name2, ply_data2|
          if big_shoe == ply_name2
            big_rebound = game_hash[location2][attribute2][ply_name2][:rebounds]
          end
        end
      end
    end
  end
  big_rebound 
end

def most_points_scored
  mvp = ""
  most_points = 0  
  game_hash.each do |location, team_data|
    team_data.each do |attribute, att_data|
      if attribute == :players
        att_data.each do |ply_name, ply_data|
          ply_data.each do |ind_data, value|
            if ind_data == :points
              if value > most_points
                most_points = value
                mvp = ply_name
              end
            end
          end
        end
      end
    end
  end
  mvp
end

def winning_team
  win_team = ""
  team1 = game_hash[:home][:team_name]
  points1 = 0
  team2 = game_hash[:away][:team_name]
  points2 = 0 
  game_hash.each do |location, team_data|
    if location == :home
      team_data.each do |attribute, att_data|
        if attribute == :players
          att_data.each do |ply_name, ply_data|
            ply_data.each do |ind_data, value|
              if ind_data == :points
                points1 += value
              end
            end
          end
        end
      end
    elsif location == :away
      team_data.each do |attribute, att_data|
        if attribute == :players
          att_data.each do |ply_name, ply_data|
            ply_data.each do |ind_data, value|
              if ind_data == :points
                points2 += value
              end
            end
          end
        end
      end
    end
    if points1 > points2
      return win_team = team1
    else
      return win_team = team2
    end
  end
end

def player_with_longest_name
  pwln = ""
  letters = 0 
  game_hash.each do |location, team_data|
    team_data.each do |attribute, att_data|
      if attribute == :players
        att_data.each do |ply_name, ply_data|
          if ply_name.length > letters
            pwln = ply_name
            letters = ply_name.length
          end
        end
      end
    end
  end
  pwln
end

def long_name_steals_a_ton?
  pwln = player_with_longest_name
  max_steals = 0
  steal_ply = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, att_data|
      if attribute == :players
        att_data.each do |ply_name, ply_data|
          ply_data.each do |ind_data, value|
            if ind_data == :steals 
              if value > max_steals
                max_steals = value
                steal_ply = ply_name
              end
            end
          end
        end
      end
    end
  end
  if pwln == steal_ply
    return true
  else
    return false    
  end
end