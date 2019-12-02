# Write your code here!
require "pry"
def game_hash
  {
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
      },
      {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
        {   
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
        {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
        {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
      ]
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
      },
      {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
        {   
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
        {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
        {
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
end

def num_points_scored(name)
  
  #returns number of points for player.
  #values we need are in :players hash
  game_hash.each do |place, team|
    team.each do |attribute, data|
    if attribute == :players
      data.each do |player|
        if player[:player_name] == name
          return player[:points]
        end
      end
    end
  end
end

end

def shoe_size(name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == name
            return player[:shoe]
          end
        end
      end
    end
  end
  
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end
  
def team_names
  arr = []
  game_hash.each {|place, team|
    arr << team[:team_name]
  }
  arr
end

def player_numbers(team_name)
  arr = []
  game_hash.each {|place, team|
    if team[:team_name] == team_name
      team.each {|attribute, data|
        if attribute == :players
        data.each {|player|
          arr << player[:number]
        }
      end
      }
    end
  }
  arr
end

def player_stats(name)
  new_hash = {}
  game_hash.each {|place, team|
    team.each {|attribute, data|
    if attribute == :players
      data.each {|player|
        if player[:player_name] == name
          new_hash = player.reject {|k, v| k == :player_name}
        end
      }
    end
      
    }
  }
  new_hash
end

def num_rebounds(name)
  
  #returns number of points for player.
  #values we need are in :players hash
  game_hash.each do |place, team|
    team.each do |attribute, data|
    if attribute == :players
      data.each do |player|
        if player[:player_name] == name
          return player[:rebounds]
        end
      end
    end
  end
end
end

def big_shoe_rebounds
  bigfoot = ""
  shoes = 0
  game_hash.each {|place, team|
    team.each {|attribute, data|
      if attribute == :players
        data.each {|players|
        if  players[:shoe] > shoes
          shoes = players[:shoe]
          bigfoot = players[:player_name]
        end
        }
      end
    }
  }
  
  num_rebounds(bigfoot)
  end

def most_points_scored
  pts = 0
  scorer = ""
  game_hash.each {|place, team|
    team.each {|attribute, data|
      if attribute == :players
        data.each {|players|
          if players[:points] > pts
            pts = players[:points]
            scorer = players[:player_name]
          end
        }
      end
    }
  }
  scorer
end

def team_final_score(location)
  score = 0
  game_hash.each {|place, team|
    if place == location
      team.each {|attribute, data|
        if attribute == :players
          data.each {|players|
            score += players[:points]
          }
        end
      }
      
    end
  }
  score
end

def winning_team
  victor = ""
  if team_final_score(:home) > team_final_score(:away)
    victor = game_hash[:home][:team_name]
  elsif team_final_score(:home) < team_final_score(:away)
    vicor = game_hash[:away][:team_name]
  end
  victor
end

def player_with_longest_name
  char = 0
  long_name = ""
  game_hash.each {|place, team|
    team.each {|attribute, data|
      if attribute == :players
        data.each {|players|
          if players[:player_name].length > char
            char = players[:player_name].length
            long_name = players[:player_name]
          end
        }
      end
    }
  }
  long_name
end

def most_steals
  stls = 0
  thief = ""
  game_hash.each {|place, team|
    team.each {|attribute, data|
      if attribute == :players
        data.each {|players|
          if players[:steals] > stls
            stls = players[:steals]
            thief = players[:player_name]
          end
        }
      end
    }
  }
  thief
end

def long_name_steals_a_ton?
  if player_with_longest_name == most_steals
    return TRUE
  end
end