# Write your code here!
require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number:	0,
          shoe:	16,
          points:	22,
          rebounds:	12,
          assists:	12,
          steals:	3,
          blocks:	1,
          slam_dunks:	1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

###

def num_points_scored(name)
  points_scored = 0
  game_hash.each {|location, team_data|
    # location = :home, :away

    team_data[:players].each {|data_item, data_point|
    # data_item = individual player names
      if data_item == name
        points_scored = data_point[:points]
      end
    }
  }
  points_scored
end

###

def shoe_size(name)
  shoe_size = 0

  game_hash.each {|location, team_data|
    # location = :home, :away

    team_data[:players].each {|data_item, data_point|
    # data_item = individual player names

      if data_item == name
        shoe_size = data_point[:shoe]
      end
    }
  }
  shoe_size
end

###

def team_colors(team_name)
  # returns array of team colors
  colors = []
  game_hash.each {|location, team_data|
  # location = :home, :away
    if team_name == team_data[:team_name]
      colors = team_data[:colors]
    end
  }
  colors
end

###

def team_names
# return array of team names
  names = []
  game_hash.each {|location, team_data|
  # location = :home, :away
    names << team_data[:team_name]
  }
  names
end

###

def player_numbers(team_name)
# returns array of the jersey numbers for a team
  jerseys = []

  game_hash.each {|location, team_data|
  # location = :home, :away
    if team_data[:team_name] == team_name
      team_data[:players].each {|data_item, data_point|
      # data_item = individual player names
        jerseys << data_point[:number]
      }
    end
  }
  jerseys
end

###

def player_stats(name)
# returns hash of player's stats
  stats = {}
  game_hash.each {|location, team_data|
  # location = :home, :away
    team_data[:players].each {|player, values|
      if player == name
        stats = values
      end
    }
  }
  stats
end

def big_shoe_rebounds
#returns number of rebounds associated with the player with the largest shoe size
  shoe_size = 0
  rebounds = 0
  big_shoe_player = ""
  game_hash.each {|location, team_data|

    team_data[:players].each {|data_item, data_point|

      if data_point[:shoe] > shoe_size
        shoe_size = data_point[:shoe]
        rebounds = data_point[:rebounds]
        big_shoe_player = data_item
      end
    }
  }
  rebounds
  #binding.pry
end

###

def most_points_scored
  points_scored = 0
  big_point_player = ""
  game_hash.each {|location, team_data|

    team_data[:players].each {|data_item, data_point|

      if data_point[:points] > points_scored
        points_scored = data_point[:points]
        big_point_player = data_item
      end
    }
  }
  big_point_player
end

###

def winning_team
  home_points_scored = 0
  away_points_scored = 0


  game_hash.each {|location, team_data|
    # location = :home, :away
    team_data[:players].each {|data_item, data_point|
    # data_item = individual player names
      if location == :home
        home_points_scored += data_point[:points]
      elsif location == :away
        away_points_scored += data_point[:points]
      end
    }
  }
  if home_points_scored > away_points_scored
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_length = 0
  big_name_player = ""
  game_hash.each {|location, team_data|

    team_data[:players].each {|data_item, data_point|

      if data_item.length > name_length
        name_length = data_item.length
        big_name_player = data_item
      end
    }
  }
  big_name_player
end

###
###
###

def long_name_steals_a_ton?
  name_length = 0
  steal_count = 0
  big_name_player = ""
  big_stealer = ""

  game_hash.each {|location, team_data|

    team_data[:players].each {|data_item, data_point|

      if data_item.length > name_length

        big_name_player = data_item
      end
    }
  }

  game_hash.each {|location, team_data|

    team_data[:players].each {|data_item, data_point|

      if data_point[:steals] > steal_count
        steal_count = data_point[:steals]
        big_stealer = data_item
      end
    }
  }

  big_name_player == big_stealer
end
