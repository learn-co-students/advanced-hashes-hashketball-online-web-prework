# Write your code here!
def game_hash
  hash_game = {
    :home => { :team_name => 'Brooklyn Nets',
            :colors => ["Black", "White"],
            :players => [
              { :player_name => 'Alan Anderson',
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1 },
              { :player_name => 'Reggie Evans',
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7 },
              { :player_name => 'Brook Lopez',
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15 },
              { :player_name => 'Mason Plumlee',
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 11,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5 },
              { :player_name => 'Jason Terry',
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1 }
            ] 
            },
    
    :away => {
            :team_name => 'Charlotte Hornets',
            :colors => ["Turquoise", "Purple"],
            :players => [
              { :player_name => 'Jeff Adrien',
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2 },
              { :player_name => 'Bismack Biyombo',
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
                :blocks => 15,
                :slam_dunks => 10 },
              { :player_name => 'DeSagna Diop',
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5 },
              { :player_name => 'Ben Gordon',
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0 },
              { :player_name => 'Kemba Walker',
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12 }
            ]
      }
    }
    
  hash_game
end

#require "pry"

def num_points_scored(name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_key|
          if player_key[:player_name] == name
            return player_key[:points]
            binding.pry
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
        data.each do |player_key|
          if player_key[:player_name] == name
            return player_key[:shoe]
          end
        end
      end
    end
  end
  
end

def team_colors(name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      return team_data[:colors]
    end
    
  end
end

def team_names
   game_hash.map do |location, team|
    team[:team_name]
  end
end

def player_numbers(name)
  jersey_nums = []
  game_hash.each do |location, team|
    if team[:team_name] == name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player_key|
           jersey_nums.push(player_key[:number])
        end
      end
    end
  end
end
jersey_nums
end

def player_stats(name)
  status = {}
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player_key|
          if player_key[:player_name] == name
            status = player_key.delete_if do |key, value|
              key == :player_name
            end
          end
        end
      end
    end
  end
  status
end

def big_shoe_rebounds
  current = 0 
  rebounds = 0 
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player_key|
          if player_key[:shoe] > current
            current = player_key[:shoe]
            rebounds = player_key[:rebounds]
          end
        end
      end
    end
  end
  return rebounds
end

def most_points_scored
  max = 0
  name = " "
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player_key|
          if player_key[:points] > max
            max = player_key[:points]
            name = player_key[:player_name]
          end
        end
      end
    end
  end
  return name
end

def winning_team
  total_name_home = 0
  total_name_away = 0
  team_name = ""
  
  game_hash.each do |location, team|
    if location == :home
      team.each do |attribute, data|
        if attribute == :players 
          data.each do |player_key|
            total_name_home += player_key[:points]
          end
        end
      end
    elsif location == :away
      team.each do |attribute, data|
        if attribute == :players 
          data.each do |player_key|
            total_name_away += player_key[:points]
          end
        end
      end
    end
  end
  
  if total_name_home > total_name_away
    return game_hash[:home][:team_name]
  
  elsif total_name_home < total_name_away
    return game_hash[:away][:team_name]
  end

end

def player_with_longest_name
  current = 0 
  long_name = " "
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player_key|
          if player_key[:player_name].length > current
            current = player_key[:player_name].length
            long_name = player_key[:player_name]
          end
        end
      end
    end
  end
  return long_name
end

def long_name_steals_a_ton?
  current = 0 
  current_steal = 0
  long_name = " "
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player_key|
          if player_key[:player_name].length > current && player_key[:steals] > current_steal
            current = player_key[:player_name].length
            current_steal = player_key[:steals]
            return true
          end
        end
      end
    end
  end
end


