def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: %w[Turquoise Purple],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: %w[Black White],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end

def num_points_scored(name)
  game_hash.each_value do |v|
    v[:players].each { |player| return player[:points] if name === player[:player_name] }
  end
end

def num_points_scored(name)
  game_hash.each_value do |v|
    v[:players].each { |player| return player[:points] if name === player[:player_name] }
  end
end

def shoe_size(name)
  game_hash.each_value do |v|
    v[:players].each { |player|return player[:shoe] if name === player[:player_name] }
  end
end

def team_colors(name)
  game_hash.each_value { |v| return v[:colors] if name === v[:team_name] }
end

def team_names
  arr = []
  game_hash.each_value { |v| arr << v[:team_name] }
  return arr
end

def player_numbers(name)
  arr = []
  game_hash.each_value do |v| 
    if name === v[:team_name]
      v[:players].each { |player| arr << player[:number] }
    end
end
  return arr
end

def player_stats(name)
  stats = {}
  game_hash.each_value do |v|
    v[:players].each do |player|
      if name === player[:player_name]
        player.each do |subk,subv|
          stats[subk] = subv if subv != name
        end
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  max = -1
  num_rebounds = 0
  game_hash.each_value do |v|
    v[:players].each do |player|
      name = player[:player_name]
      size = shoe_size(name)
      if size > max
        max = size
        num_rebounds = player[:rebounds]
      end
    end
  end
  return num_rebounds
end

def most_points_scored
  max = -1
  player_with_most_points = ""
  game_hash.each_value do |v|
    v[:players].each do |player|
      name = player[:player_name]
      points = player[:points]
      if points > max
        max = points
        player_with_most_points = player[:player_name]
      end
    end
  end
  return player_with_most_points
end

def winning_team
  max = -1
  winner_team = ""
  game_hash.each_value do |v|
    sum = 0
    v[:players].each do |player|
      name = player[:player_name]
      points = player[:points]
      sum += points
    end
    if sum > max
      max = sum
      winner_team = v[:team_name]
    end
  end
  return winner_team
end

def player_with_longest_name
  max = -1
  longest_name = ""
  game_hash.each_value do |v|
    v[:players].each do |player|
      name = player[:player_name]
      points = player[:points]
      if name.size > max
        max = name.size
        longest_name = player[:player_name]
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  max = -1
  player_with_most_steals = ""
  game_hash.each_value do |v|
    v[:players].each do |player|
      name = player[:player_name]
      steals = player[:steals]
      if steals > max
        max = steals
        player_with_most_steals = player[:player_name]
      end
    end
  end
  longest_name = player_with_longest_name
  return longest_name === player_with_most_steals
end
