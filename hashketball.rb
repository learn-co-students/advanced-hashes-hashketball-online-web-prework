require 'pry'

def game_hash
  new_hash = {
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
          :rebounds => 11,
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
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
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
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
  
  return new_hash
end

def num_points_scored(player_name)
  data = game_hash
  points = 0
  
  if data[:home][:players].key?(player_name)
    points = data[:home][:players][player_name][:points]
  else
    points = data[:away][:players][player_name][:points]
  end
  
  
  return points
end

def shoe_size(player_name)
  data = game_hash
  size = 0
  
  if data[:home][:players].key?(player_name)
    size = data[:home][:players][player_name][:shoe]
  else
    size = data[:away][:players][player_name][:shoe]
  end
  
  
  return size
end

def team_colors(team_name)
  data = game_hash
  colors = nil
  
  if data[:home][:team_name] == team_name
    colors = (data[:home][:colors])
  else
    colors = (data[:away][:colors])
  end
  
  #binding.pry
  
  return colors
end

def team_names
  data = game_hash
  names = [
    data[:home][:team_name],
    data[:away][:team_name]
    ]
    
    return names
end

def player_numbers(team_name)
  data = game_hash
  numbers = []
  
  if data[:home][:team_name] == team_name
    data[:home][:players].map{ |item|
      numbers.push(item[1][:number])
    }
  else
    data[:away][:players].map{ |item|
      numbers.push(item[1][:number])
    }
  end
  
  return numbers
end

def player_stats(player_name)
  data = game_hash
  stats = nil
  
  if data[:home][:players].key?(player_name)
    stats = data[:home][:players][player_name]
  else
    stats = data[:away][:players][player_name]
  end
  
  return stats
end

def big_shoe_rebounds
  data = game_hash
  biggest_shoe = 0
  biggest_shoe_player = nil
  rebounds = nil
  
  
  #Mason Plumlee. 19 shoe. 11 rebounds
  data.map{ |parent_item|
    parent_item[1][:players].map{ |child_item|
      if child_item[1][:shoe] > biggest_shoe
        biggest_shoe = child_item[1][:shoe]
        biggest_shoe_player = child_item[0]
        rebounds = child_item[1][:rebounds]
      end
    }
  }
  
  return rebounds
end