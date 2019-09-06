require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [
        {:player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1},
        {:player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7},
        {:player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15},
        {:player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5},
        {:player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [
        {:player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2},
        {:player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10  },
        {:player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5},
        {:player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0},
        {:player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12}
      ]
    }
  }
# binding.pry
end

def num_points_scored(player_name)
  game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:points]
  binding.pry
            end   
          end
        end
      end
   end
end

def shoe_size(player_name)
   game_hash.each do |location, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            return player[:shoe]
  binding.pry
            end   
          end
        end
      end
   end
end

def team_colors(team_name)
  game_hash.each do |location, team|
    team.each do |name, colors|
      if team_name == team[:team_name]
        return team[:colors]
    binding.pry
  end
  end
  end
end

def team_names
  game_hash.map do |location, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  nums = []
  game_hash.each do |location, team|
    if team_name == team[:team_name]
    team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            # binding.pry
           nums << player[:number]
          end
    # binding.pry
  end
  end
  end
end
nums
end

def player_stats(player_name)
new = {}
game_hash.each do |location, team|
  team.each do |attribute, data|
    if attribute == :players 
      data.each do |player|
        if player[:player_name] == player_name
          new = player.delete_if do |k, v|
            k == :player_name
          end
        end
      end
    end
  end
end
new
end

def big_shoe_rebounds #Mason Plumlee
current = nil 
rebounds = nil 
  game_hash.each do |location, team|
    team[:players].each do |player|
     if current == nil || player[:shoe] > current
       current = player[:shoe]
          rebounds = player[:rebounds]
       end
    end
  end
return rebounds
end

def most_points_scored
  current = nil 
  points = nil 
  game_hash.each do |location, team|
    team[:players].each do |player|
      if current == nil || player[:points] > current
        current = player[:points]
        points = player[:player_name]
      end
    end
  end
  points
end

def winning_team
  home_team = 0
  away_team = 0
  game_hash.each do |location, team|
    team[:players].each do |player|
      if location == :home 
        home_team += player[:points] 
      else
        away_team += player[:points]
      end
    end
  end
  if home_team > away_team
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
current = 0
name = nil 
  game_hash.each do |location, team|
    team[:players].each do |player|
      if player[:player_name].length > current
        current = player[:player_name].length
        name = player[:player_name]
      end
      # binding.pry
    end
  end
 name
end

def long_name_steals_a_ton?
  current = nil
  name = nil
  game_hash.each do |location, team|
    team[:players].each do |player|
      if current == nil || player[:steals] > current
        current = player[:steals]
        name = player[:player_name]
        
      end
    end
  end
  if player_with_longest_name == name
    return true 
  else
    return false
  end
end