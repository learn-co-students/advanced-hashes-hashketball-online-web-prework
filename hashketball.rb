def game_hash
  hash = {
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
          :rebounds => 12,
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
return hash
end

def num_points_scored(player_name)
  points = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            stats.each do |stat, value|
              if stat == :points
                points = value
              end
            end
          end
        end
      end
    end
  end
  points
end

def shoe_size(player_name)
  shoe_size = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            stats.each do |stat, value|
              if stat == :shoe
                shoe_size = value
              end
            end
          end
        end
      end
    end
  end
  shoe_size
end

def team_colors(team)
colorOutput = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
        if attribute == :colors
          colorOutput = data
        end
      end
    end
  end
  colorOutput
end

def team_names
teamsOutput = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
          teamsOutput << data
      end
    end
  end
  teamsOutput
end

def player_numbers(team)
  jerseyNumbersArr = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            stats.each do |stat, statValue|
              if stat == :number
                jerseyNumbersArr << statValue
              end
            end
          end
        end
      end
    end
  end
  jerseyNumbersArr
end

def player_stats(player_name)
  outputHash = {}
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player == player_name
            outputHash = stats
          end
        end
      end
    end
  end
  outputHash
end

def big_shoe_rebounds
  bigShoeArr = []

  #First, get all the shoe sizes and put them into an array to find out the one with the biggestShoeSize
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          bigShoeArr << shoe_size(player)
        end
      end
    end
  end
  biggestShoeSize = bigShoeArr.max

  #Now we are going to use the biggestShoeSize number to select the correct player and grab that player's rebounds stats
  #One issue with this logic is that if there are multiple players that have tied for the max shoe size
  reboundStat = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, statValue|
            if stat == :shoe
              if statValue == biggestShoeSize
                reboundStat = stats[:rebounds]
              end
            end
          end
        end
      end
    end
  end
  reboundStat
end

def most_points_scored
  pointsArr = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, statValue|
            if stat == :points
              pointsArr << statValue
            end
          end
        end
      end
    end
  end
  mostPoints = pointsArr.max

  mostPointsPlayer = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, statValue|
            if stat == :points
              if statValue == mostPoints
                mostPointsPlayer = player
              end
            end
          end
        end
      end
    end
  end
  mostPointsPlayer
end

def total_points(location)
  pointsTotal = 0

  game_hash.each do |hashlocation, team_data|
    if location == hashlocation
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, stats|
            stats.each do |stat, statValue|
              if stat == :points
                pointsTotal = pointsTotal + statValue
              end
            end
          end
        end
      end
    end
  end
  pointsTotal
end

def winning_team
  pointsHome = 0
  pointsAway = 0

  game_hash.each do |location, team_data|
    case location
    when :home
      pointsHome = total_points(:home)
    when :away
      pointsAway = total_points(:away)
    end
  end

  winningTeam = ""

  #doesn't account for if there is a tie game
  if pointsHome > pointsAway
    winningTeam = game_hash[:home][:team_name]
  else
    winningTeam = game_hash[:away][:team_name]
  end

  winningTeam
end

def player_with_longest_name
  nameLengthArr = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          nameLengthArr << player.length
        end
      end
    end
  end

  longestNameInt = nameLengthArr.max
  longestName = ""

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player.length == longestNameInt
            longestName = player
          end
        end
      end
    end
  end
  longestName
end

def most_steals
  stealsArr = []

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, statValue|
            if stat == :steals
              stealsArr << statValue
            end
          end
        end
      end
    end
  end
  mostSteals = stealsArr.max

  mostStealsPlayer = ""
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          stats.each do |stat, statValue|
            if stat == :steals
              if statValue == mostSteals
                mostStealsPlayer = player
              end
            end
          end
        end
      end
    end
  end
  mostStealsPlayer
end

def long_name_steals_a_ton?
  longestName = player_with_longest_name
  mostStealsName = most_steals

  longestName == mostStealsName
end
