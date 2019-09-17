require "pry"

def game_hash
  {
    home: {team_name: "Brooklyn Nets", colors: ["Black", "White"], players: [
      {"Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}}, {"Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7}}, {"Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15}}, {"Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5}}, {"Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}}
      ]}, 
    away: {team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"], players: [
      {"Jeff Adrien" =>{ number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2}}, {"Bismack Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10}}, {"DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5}}, {"Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0}}, {"Kemba Walker" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}}
      ]}
  }
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def num_points_scored(name)
  game_hash[:home][:players].map {|player|
    if player.has_key?(name)
      return player[name][:points]
    end
  }
  game_hash[:away][:players].map {|player|
    if player.has_key?(name)
      return player[name][:points]
    end
  }
end

def shoe_size(name)
  game_hash[:home][:players].map {|player|
    if player.has_key?(name)
      return player[name][:shoe]
    end
  }
  game_hash[:away][:players].map {|player|
    if player.has_key?(name)
      return player[name][:shoe]
    end
  }
end

def team_colors(name)
  if game_hash[:home].has_value?(name)
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  team_names = []
  team_names << game_hash[:home][:team_name]
  team_names << game_hash[:away][:team_name]
end

def player_numbers(name)
  player_numbers = []
  if game_hash[:home].has_value?(name)
    game_hash[:home][:players].map {|player|
      player.each_pair {|key,value| 
        player_numbers << player[key][:number]
      }
    }
  else
    game_hash[:away][:players].map {|player|
      player.each_pair {|key,value| 
        player_numbers << player[key][:number]
      }
    }
  end
  player_numbers
end

def player_stats(name)
  game_hash[:home][:players].each {|player|
    player.each_pair {|key,value| 
      if key == name
        return value
      end
    }
  }
  game_hash[:away][:players].each {|player|
    player.each_pair {|key,value| 
      if key == name
        return value
      end
    }
  }
end

def big_shoe_rebounds
  largest_shoe_rebounds = 0
  largest_shoe_size = 0 
  game_hash[:home][:players].each {|player|
    player.each_pair {|key,value| 
      if player[key][:shoe] > largest_shoe_size
        largest_shoe_size = player[key][:shoe]
        largest_shoe_rebounds = player[key][:rebounds]
      end
    }
  }
  game_hash[:away][:players].each {|player|
    player.each_pair {|key,value| 
      if player[key][:shoe] > largest_shoe_size
        largest_shoe_size = player[key][:shoe]
        largest_shoe_rebounds = player[key][:rebounds]
      end
    }
  }
  largest_shoe_rebounds
end

def most_points_scored
  most_points = 0
  most_points_player = ""
  game_hash[:home][:players].each {|player|
    player.each_pair {|key,value| 
      if player[key][:points] > most_points
        most_points = player[key][:points]
        most_points_player = key
      end
    }
  }
  game_hash[:away][:players].each {|player|
    player.each_pair {|key,value| 
      if player[key][:points] > most_points
        most_points = player[key][:points]
        most_points_player = key
      end
    }
  }
  most_points_player
end

def winning_team
  home_team_points = 0
  away_team_points = 0 
  game_hash[:home][:players].each {|player|
    player.each_pair {|key,value| 
      home_team_points += player[key][:points]
    }
  }
  game_hash[:away][:players].each {|player|
    player.each_pair {|key,value| 
      away_team_points += player[key][:points]
    }
  }
  if home_team_points > away_team_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash[:home][:players].each {|player|
    player.each_pair {|key,value| 
      if key.length > longest_name.length
        longest_name = key
      end
    }
  }
  game_hash[:away][:players].each {|player|
    player.each_pair {|key,value| 
      if key.length > longest_name.length
        longest_name = key
      end
    }
  }
  longest_name
end

def long_name_steals_a_ton?
  name_of_stealer = ""
  most_steals = 0 
  game_hash[:home][:players].each {|player|
    player.each_pair {|key,value| 
      if player[key][:steals] > most_steals
        most_steals = player[key][:steals]
        name_of_stealer = key
      end
    }
  }
  game_hash[:away][:players].each {|player|
    player.each_pair {|key,value| 
      if player[key][:steals] > most_steals
        most_steals = player[key][:steals]
        name_of_stealer = key
      end
    }
  }
  if name_of_stealer == player_with_longest_name
    return true 
  else
    return false 
  end
end