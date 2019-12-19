def game_hash
  
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      }, {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },{
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },{
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },{
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },{
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },{
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },{
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },{
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }]
    }
  }
  
  hash
end

def num_points_scored(player_name)
  game_hash.each{|home_away, teams_stat|
    teams_stat[:players].each{|player|
      if player_name == player[:player_name]
        return player[:points]
      end
    }
  }
end

def shoe_size(player_name)
  game_hash.each{|home_away, teams_stat|
    teams_stat[:players].each{|player|
      if player_name == player[:player_name]
        return player[:shoe]
      end
    }
  }
end

def team_colors(team_name)
  game_hash.each{|home_away, teams_stat|
    if team_name == teams_stat[:team_name]
        return teams_stat[:colors]
    end
  }
end

def team_names
  names = []
  game_hash.each{|home_away, teams_stat|
    names.push(teams_stat[:team_name])
  }
  names
end

def player_numbers(team_name)
  numbers = []
  game_hash.each{|home_away, teams_stat|
    if team_name == teams_stat[:team_name]
        teams_stat[:players].each{|player|
          numbers.push(player[:number])
        }
    end
  }
  numbers
end

def player_stats(player_name)
  game_hash.each{|home_away, teams_stat|
    teams_stat[:players].each{|player|
      if player_name == player[:player_name]
         player.delete(:player_name)
         return player
      end
    }
  }
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  rebounds = 0
  game_hash.each{|home_away, teams_stat|
    teams_stat[:players].each{|player|
      if player[:shoe] > biggest_shoe_size
        biggest_shoe_size = player[:shoe]
        rebounds = player[:rebounds]
      end
    }
  }
  rebounds
end

def most_points_scored
  most_points = 0
  player_most_points_name = ""
  game_hash.each{|home_away, teams_stat|
    teams_stat[:players].each{|player|
      if player[:points] > most_points
        most_points = player[:points]
        player_most_points_name = player[:player_name]
      end
    }
  }
  player_most_points_name
end

#helping method
def team_score(team_name)
  total_score = 0 
  game_hash.each{|home_away, teams_stat|
    if team_name == teams_stat[:team_name]
      teams_stat[:players].each{|player|
        total_score += player[:points]
      }
    end
  }
  total_score
end

def winning_team
  winner_score = 0
  winners = ""
  game_hash.each{|home_away, teams_stat|
    
    if winner_score < team_score(teams_stat[:team_name])
      winner_score = team_score(teams_stat[:team_name])
      winners = teams_stat[:team_name]
    end
  }
  winners
end

def player_with_longest_name
  name_length = 0
  player_longest_name = ""
  game_hash.each{|home_away, teams_stat|
    teams_stat[:players].each{|player|
      if player[:player_name].length > name_length
        name_length = player[:player_name].length
        player_longest_name = player[:player_name]
      end
    }
  }
  player_longest_name
end

#helping method
def most_steals
  most_steals_stolen = 0
  player_most_steals = ""
  game_hash.each{|home_away, teams_stat|
    teams_stat[:players].each{|player|
      if player[:steals] > most_steals_stolen
        most_steals_stolen = player[:steals]
        player_most_steals = player[:player_name]
      end
    }
  }
  player_most_steals
end

def long_name_steals_a_ton? 
  #if most_steals == player_with_longest_name
  #  return true
  #end
  #false
  most_steals == player_with_longest_name ? true : false
end