def game_hash()
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
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
        :assists =>10,
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
      :colors => ["Turquoise", "Purple"],
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
        :slam_dunks => 10},
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
end

def num_points_scored(name) #Takes name and returns points scored
  hash = game_hash
  points = 0
  hash.each_value do |team|
    team[:players].each do |stat|
      if stat[:player_name] == name
        points = stat[:points]
      end
    end
  end
  points
end

def shoe_size(name) #Takes name and returns shoe size
  hash = game_hash
  shoe = 0
  hash.each_value do |team|
    team[:players].each do |stat|
      if stat[:player_name] == name
        shoe = stat[:shoe]
      end
    end
  end
  shoe
end

def team_colors(t_name) #Takes team name and returns colors
  hash = game_hash
  hash.each_value do |team|
    if team[:team_name] == t_name
      return team[:colors]
    end
  end
end

def team_names #Returns array of team names
  hash = game_hash
  teams = []
  hash.each_value do |team|
    teams << team[:team_name]
  end
  teams
end

def player_numbers(t_name) #Takes team name and returns array of numbers
  hash = game_hash
  num = []
  hash.each_value do |team|
    if team[:team_name] == t_name
      team[:players].each do |stat|
        num << stat[:number]
      end
    end
  end
  num
end

def player_stats(name) #Takes a name and returns player's stats
  hash = game_hash
  p_stats = {}
  hash.each_value do |team|
    team[:players].each do |stat|
      if stat[:player_name] == name
        p_stats = stat
      end
    end
  end
  p_stats.delete(:player_name)
  p_stats
end

def big_shoe_rebounds #Returns true if player with largest shoe size has most rebounds
  hash = game_hash
  shoe = hash[:home][:players][0]
  hash.each_value do |team|
    team[:players].each do |player|
      if player[:shoe] > shoe[:shoe]
        shoe = player
      end
    end
  end
  shoe[:rebounds]
end

def most_points_scored
  hash = game_hash
  points = hash[:home][:players][0]
  hash.each_value do |team|
    team[:players].each do |player|
      if player[:points] > points[:points]
        points = player
      end
    end
  end
  points[:player_name]
end

def winning_team
  hash = game_hash
  winner = ""
  points = 0
  hash.each_value do |team|
    team_points = 0
    team[:players].each do |stats|
      team_points += stats[:points]
    end
    if team_points > points
      points = team_points
      winner = team[:team_name]
    end
  end
  winner
end

def player_with_longest_name
  hash = game_hash
  name = ""
  hash.each_value do |team|
    team[:players].each do |player|
      if player[:player_name].length > name.length
        name = player[:player_name]
      end
    end
  end
  name
end

def long_name_steals_a_ton?
  hash = game_hash
  name = player_with_longest_name
  steals = hash[:home][:players][0]
  hash.each_value do |team|
    team[:players].each do |player|
      if player[:steals] > steals[:steals]
        steals = player
      end
    end
  end
  name == steals[:player_name]
end
