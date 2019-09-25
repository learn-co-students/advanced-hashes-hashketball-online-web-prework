
def game_hash
  new_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
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
          rebounds: 11,
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
        ]
      },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
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
        "Bismack Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
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
        "Kemba Walker" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12 
          }
        ]
    }
  }
end


def num_points_scored(player_name)
  stat = nil
  game_hash.each do |team, info|
    if info[:players][0].include?(player_name)
      stat = info[:players][0][player_name][:points]
    end
  end
  stat
end

def shoe_size(player_name)
  stat = nil
  game_hash.each do |team, info|
    if info[:players][0].include?(player_name)
      stat = info[:players][0][player_name][:shoe]
    end
  end
  stat
end

def team_names
  stat = []
  game_hash.each do |team, info|
    stat.push(info[:team_name])
  end
  stat
end

def team_colors(team_name)
  stat = nil
  game_hash.each do |team, info|
    if info[:team_name] == team_name
      stat = info[:colors]
    end
  end
  stat
end

def player_numbers(team_name)
  stat = []
  game_hash.each do |team, info|
    if info[:team_name] == team_name
      info[:players][0].each do |player, stats|
        stat.push(stats[:number])
      end
    end
  end
  stat
end

def player_stats(player_name)
  stat = {}
  game_hash.each do |team, info|
    if info[:players][0].include?(player_name)
      stat = info[:players][0][player_name]
    end
  end
  stat
end

def big_shoe_rebounds
  biggest_shoe = 0
  stat = 0
  game_hash.each do |team, info|
    info[:players][0].each do |player, stats|
      if stats[:shoe] > biggest_shoe
        biggest_shoe = stats[:shoe]
        stat = stats[:rebounds]
      end
    end
  end
  stat
end

def most_points_scored
  most_points = 0
  stat = nil
  game_hash.each do |team, info|
    info[:players][0].each do |player, stats|
      if stats[:points] > most_points
        most_points = stats[:points]
        stat = player
      end
    end
  end
  stat
end

def winning_team
  winner = nil
  most_points = 0
  game_hash.each do |team, info|
    team_points = 0
    info[:players][0].each do |player, stats|
      team_points = team_points + stats[:points]
    end
    if team_points > most_points
      most_points = team_points
      winner = info[:team_name]
    end
  end
  winner
end

def player_with_longest_name
  long_name = 0
  stat = nil
  game_hash.each do |team, info|
    info[:players][0].each do |player, stats|
      if player.length > long_name
        long_name = player.length
        stat = player
      end
    end
  end
  stat
end

def long_name_steals_a_ton?
  most_steals = 0
  thief = nil
  stat = false
  game_hash.each do |team, info|
    info[:players][0].each do |player, stats|
      if stats[:steals] > most_steals
        most_steals = stats[:steals]
        thief = player
      end
    end
  end
  
  stat = true if player_with_longest_name == thief
end
