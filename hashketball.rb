require 'pry'

def game_hash
  hash = 
  {
  :home => 
    {
      :team_name => "Brooklyn Nets", 
      :colors => ["Black", "White"], 
      :players => 
      [{:name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
      {:name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
      {:name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
      {:name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
      {:name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      ]
      
    }, 
   :away => 
    {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => [
        {:name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
      {:name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
      {:name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
      {:name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
      {:name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
      ]
      
    }
    
  }
  return hash
end


def num_points_scored(name)
 player = game_hash[:home][:players].find{|n| n[:name] == name
  }
  if player 
    
    return player[:points]
  else
    player = game_hash[:away][:players].find{|n| n[:name] == name
    }
    return player[:points]
    
  end
    
    
end
def shoe_size(name)
 player = game_hash[:home][:players].find{|n| n[:name] == name
  }
  if player 
    
    return player[:shoe]
  else
    player = game_hash[:away][:players].find{|n| n[:name] == name
    }
    return player[:shoe]
    
  end
    
    
end
def team_colors(team_name)
  
  if game_hash[:home][:team_name] == team_name
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end
def team_names
  names = []
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
  
  return names
end
def player_numbers(team_name)
numbers = []
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each{| n |
    
      numbers << n[:number]
    }
  else
    game_hash[:away][:players].each{| n |
      numbers << n[:number]
    }
  end
  return numbers
end
def player_stats(name)

  player = game_hash[:home][:players].find{|n| n[:name] == name
  }
  
  if player 
    player.delete(:name)
    return player
  else
    player = game_hash[:away][:players].find{|n| n[:name] == name
    }
    player.delete(:name)
    return player
    
  end
    
    
end  
def big_shoe_rebounds
  player1 = game_hash[:home][:players].max_by{|n| n[:shoe]}
  player2 = game_hash[:away][:players].max_by{|n| n[:shoe]}
  
  if player1[:shoe] > player2[:shoe]
    return player1[:rebounds]
  else
    return player2[:rebounds]
  end
end  
