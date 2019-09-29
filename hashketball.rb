def game_hash

  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => %w(Black White),
      :players => [
        :player_name => ["Alan Anderson","Reggie Evans","Brook Lopez","Mason Plumlee","Jason Terry"],
        :number => %w(0 30 11 1 31),
        :shoe => %w(16 14	17 19	15),
        :points => %w(22 12	17 26	19),
        :rebounds => %w(12 12	19 11 2),
        :assists => %w(12	12 10	6	2),
        :steals => %w(3	12 3 3 4),
        :blocks => %w(1	12 1 8 11),
        :slam_dunks => %w(1 7 15	5	1)
    ]
  },
    :away => {
      :team_name => "Charlotte Hornets",
        :colors => %w(Turquoise Purple),
        :players => [
          :player_name => ["Jeff Adrien",	"Bismack Biyombo",	"DeSagna Diop",	"Ben Gordon",	"Kemba Walker"],
          :number => %w(4 0 2 8 33),
          :shoe => %w(18 16 14 15 15),
          :points => %w(10 12 24 33 6),
          :rebounds => %w(1 4 12 3 12),
          :assists => %w(1 7 12 2 12),
          :steals => %w(2 22 4 1 7),
          :blocks => %w(7 15 5 1 5),
          :slam_dunks => %w(2 10 5 0 12)
        ]
      }
    }

  hash
end

def num_points_scored(player)

points = 0;
  game_hash.each { |team,level|
      level[:players].each { |stat|
        index = (stat[:player_name]).find_index(player)
        if((stat[:player_name]).find_index(player))
        points = stat[:points][index].to_i
        end
    }
  }

  points
end

def shoe_size(player)

shoe_size = 0;
  game_hash.each { |team,level|
      level[:players].each { |stat|
        index = (stat[:player_name]).find_index(player)
        if((stat[:player_name]).find_index(player))
          shoe_size = stat[:shoe][index].to_i
        end
    }
  }

  shoe_size
end

def team_colors(team_name)

colors = 0;
  game_hash.each { |team,level|
    if(level[:team_name] == team_name)
      colors = level[:colors]
    end
  }
  colors
end

def num_points_scored(player)

points = 0;
  game_hash.each { |team,level|
      level[:players].each { |stat|
        index = (stat[:player_name]).find_index(player)
        if((stat[:player_name]).find_index(player))
        points = stat[:points][index].to_i
        end
    }
  }

  points
end

def team_names

teams = Array.new()

  game_hash.each_with_index { |(team,level),index|
      teams[index] = level[:team_name]
  }

  teams
end

def player_numbers(team_name)

numbers = ""

  game_hash.each { |team,level|
    level[:players].each { |stat|
    if(level[:team_name]==team_name)
      numbers = stat[:number]
    end
    }
  }

  numbers.map(&:to_i)

end

def player_stats(player_name)

stats = {}
  game_hash.each { |team,level|
    level[:players].each { |stat|
      stat.each { |e,value|
        index = (stat[:player_name]).find_index(player_name)
        if((stat[:player_name]).find_index(player_name))
          stats[e] = stat[e][index].to_i
        end
      }
    }
  }
  stats.delete(:player_name)
  stats

end

def big_shoe_rebounds
  shoe_sizes = Array.new
  number_of_rebounds = 0

  game_hash.each_with_index { |(team,level), index|
    level[:players].each { |stat|
        shoe_sizes[index] = stat[:shoe].map(&:to_i)
    }
  }

  shoe_sizes = shoe_sizes.flatten
  shoe_sizes = shoe_sizes.sort
  biggest_shoe_size = shoe_sizes[(shoe_sizes.length)-1]

  game_hash.each { |team,level|
    level[:players].each { |stat|
      index = (stat[:shoe]).find_index(biggest_shoe_size.to_s)
        if((stat[:shoe]).find_index(biggest_shoe_size.to_s))
          number_of_rebounds = stat[:rebounds][index]
        end
    }
  }
number_of_rebounds.to_i
end

def most_points_scored
  points = Array.new
  most_points_scored_p = ""

  game_hash.each_with_index { |(team,level), index|
    level[:players].each { |stat|
        points[index] = stat[:points].map(&:to_i)
    }
  }

  points = points.flatten
  points = points.sort
  most_points = points[(points.length)-1]

  game_hash.each { |team,level|
    level[:players].each { |stat|
      index = (stat[:points]).find_index(most_points.to_s)
        if((stat[:points]).find_index(most_points.to_s))
          most_points_scored_p = stat[:player_name][index]
        end
    }
  }

most_points_scored_p
end

def winning_team
  points = Hash.new
  points_sum = Hash.new
  team = ""

  game_hash.each { |team,level|
    level[:players].each { |stat|
        points[level[:team_name]] = stat[:points].map(&:to_i)
    }
  }

  points.each { |team,value|
    points_sum[team] = 0
      value.each { |point|
        points_sum[team] += point
      }
  }

team = points_sum.max_by{|k,v| v}[0]

team
end

def player_with_longest_name
  players = Array.new

  game_hash.each_with_index { |(team,level), index|
    level[:players].each { |stat|
        players[index] = stat[:player_name]
    }
  }

  players = players.flatten

  players.inject { |f, s|
    f.length > s.length ? f : s
  }
end

def long_name_steals_a_ton?
  steals = Array.new
  player = player_with_longest_name
  game_hash.each_with_index { |(team,level), index|
    level[:players].each { |stat|
        steals[index] = stat[:steals]
    }
  }

  steals = steals.flatten
  steals = steals.map(&:to_i)
  steals = steals.sort
  most_steals = steals[(steals.length)-1]
  index = 0

  game_hash.each { |team,level|
    level[:players].each { |stat|
      index = (stat[:player_name]).find_index(player)
      if((stat[:player_name]).find_index(player))
        if((stat[:steals][index])==most_steals.to_s)
          return true
        else
          return false
        end
      end
    }
  }
end
