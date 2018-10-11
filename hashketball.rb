def game_hash
  game_hash = {
    "home": {
      "team_name": 'Brooklyn Nets',
      "colors": ['Black', 'White'],
      "players": {
        "Alan Anderson": {
          "number": 0,
          "shoe": 16,
          "points": 22,
          "rebounds": 12,
          "assists": 12,
          "steals": 3,
          "blocks": 1,
          "slam_dunks": 1
        },
        "Reggie Evans": {
          "number": 30,
          "shoe": 14,
          "points": 12,
          "rebounds": 12,
          "assists": 12,
          "steals": 12,
          "blocks": 12,
          "slam_dunks": 7
        },
        "Brook Lopez": {
          "number": 11,
          "shoe": 17,
          "points": 17,
          "rebounds": 19,
          "assists": 10,
          "steals": 3,
          "blocks": 1,
          "slam_dunks": 15
        },
        "Mason Plumlee": {
          "number": 1,
          "shoe": 19,
          "points": 26,
          "rebounds": 12,
          "assists": 6,
          "steals": 3,
          "blocks": 8,
          "slam_dunks": 5
        },
        "Jason Terry": {
          "number": 31,
          "shoe": 15,
          "points": 19,
          "rebounds": 2,
          "assists": 2,
          "steals": 4,
          "blocks": 11,
          "slam_dunks": 1
        }
      }
    },
    "away": {
      "team_name": 'Charlotte Hornets',
      "colors": ['Turquoise', 'Purple'],
      "players": {
        "Jeff Adrien": {
          "number": 4,
          "shoe": 18,
          "points": 10,
          "rebounds": 1,
          "assists": 1,
          "steals": 2,
          "blocks": 7,
          "slam_dunks": 2
        },
        "Bismak Biyombo": {
          "number": 0,
          "shoe": 16,
          "points": 12,
          "rebounds": 4,
          "assists": 7,
          "steals": 7,
          "blocks": 15,
          "slam_dunks": 10
        },
        "DeSagna Diop": {
          "number": 2,
          "shoe": 14,
          "points": 24,
          "rebounds": 12,
          "assists": 12,
          "steals": 4,
          "blocks": 5,
          "slam_dunks": 5
        },
        "Ben Gordon": {
          "number": 8,
          "shoe": 15,
          "points": 33,
          "rebounds": 3,
          "assists": 2,
          "steals": 1,
          "blocks": 1,
          "slam_dunks": 0
        },
        "Brendan Haywood": {
          "number": 33,
          "shoe": 15,
          "points": 6,
          "rebounds": 12,
          "assists": 12,
          "steals": 22,
          "blocks": 5,
          "slam_dunks": 12
        }
    }
  }
  }
end

def num_points_scored(user_entered_name)
  game_hash[:home][:players].each do |name, attributes|
    if user_entered_name == name.to_s
      return attributes[:points]
    end
  end

  game_hash[:away][:players].each do |name, attributes|
    if user_entered_name == name.to_s
      return attributes[:points]
    end
  end
end

def shoe_size(user_entered_name)
  game_hash[:home][:players].each do |name, attributes|
    if user_entered_name == name.to_s
      return attributes[:shoe]
    end
  end

  game_hash[:away][:players].each do |name, attributes|
    if user_entered_name == name.to_s
      return attributes[:shoe]
    end
  end
end

def team_colors(user_entered_team_name)
  if user_entered_team_name == game_hash[:home][:team_name].to_s
    return game_hash[:home][:colors]
  end

  if user_entered_team_name == game_hash[:away][:team_name].to_s
    return game_hash[:away][:colors]
  end
end

def team_names
  game_hash.map do |name, attributes|
    attributes[:team_name]
  end
end

def player_numbers(user_entered_team_name)
  number_array = []
  game_hash.each do |name, attributes|
    if user_entered_team_name == attributes[:team_name].to_s
      attributes[:players].each do |name, attributes|
        number_array << attributes[:number]
      end
    end
  end
  number_array
end

def player_stats(user_entered_player)
  game_hash[:home][:players].each do |name, attributes|
    if user_entered_player == name.to_s
      return attributes
    end
  end

  game_hash[:away][:players].each do |name, attributes|
    if user_entered_player == name.to_s
      return attributes
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = 0
  game_hash.each do |name, attributes|
    attributes[:players].each do |name, attributes|
      if attributes[:shoe] > biggest_shoe
        biggest_shoe = attributes[:shoe]
      end
    end
    
    attributes[:players].each do |name, attributes|
      if attributes[:shoe] == biggest_shoe
        return attributes[:rebounds]
      end
    end
  end
end
