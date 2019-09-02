# Write your code here!
require "pry"

def game_hash 
  {
    home: 
    {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:
      [
      {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      {
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
    
    away:
    {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players:
      [
      {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10
      },
      {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      {
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

def num_to_name(teamname, num)
  {
    "Brooklyn Nets" =>
    {
      0 => "Alan Anderson",
      30 => "Reggie Evans",
      11 => "Brook Lopez",
      1 => "Mason Plumlee",
      31 => "Jason Terry"
    },
    "Charlotte Hornets" =>
    {
      4 => "Jeff Adrien",
      0 => "Bismack Biyombo",
      2 => "DeSagna Diop",
      8 => "Ben Gordon",
      33 => "Kemba Walker"
    }
  }[teamname][num]
end
def num_points_scored(name)
  game_hash.each do |location, team_data| 
    out = team_data[:players].find { |player| num_to_name(team_data[:team_name],player[:number]) == name }
    return out[:points] if out != nil
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data| 
    out = team_data[:players].find { |player| num_to_name(team_data[:team_name],player[:number]) == name }
    return out[:shoe] if out != nil
  end
end

def team_colors(team)
  game_hash.find { |location, team_data| team_data[:team_name] == team }[1][:colors]
end

def team_names
  game_hash.reduce([]) do |memo, (location, team_data)|
    memo << team_data[:team_name]
  end
end

def player_numbers(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:players].reduce([]) do |memo, player|
        memo << player[:number]
      end
    end
  end
end

def player_stats(name)
  game_hash.each do |location, team_data|
    out = team_data[:players].find { |player| num_to_name(team_data[:team_name],player[:number]) == name }
    return out if out != nil
  end
end

def big_shoe_rebounds
  game_hash.reduce([]) { |memo, (location, team_data)| memo += team_data[:players] }.max { |a, b| a[:shoe] <=> b[:shoe] }[:rebounds]
end

def most_points_scored
  player = game_hash.reduce([]) do |memo, (location, team_data)| 
    team_data[:players].each do |player|
      player[:team_name] = team_data[:team_name]
      memo << player
    end
  end
  player = player.max { |a, b| a[:points] <=> b[:points] }
  player
  num_to_name(player[:team_name], player[:number])
end

def winning_team
  out = game_hash.max_by do |location, team_data| 
    team_data[:players].reduce(0) { |memo, player| memo += player[:points] }
  end
  out[1][:team_name]
end

def player_with_longest_name
  players = game_hash.reduce([]) do |memo, (location, team_data)|
    team_data[:players].each do |player|
      player[:team_name] = team_data[:team_name]
      memo << player
    end
  end
  player = players.max_by { |player| num_to_name(player[:team_name], player[:number]).length }
  num_to_name(player[:team_name], player[:number])
end

def long_name_steals_a_ton?
  players = game_hash.reduce([]) do |memo, (location, team_data)|
    team_data[:players].each do |player|
      player[:team_name] = team_data[:team_name]
      memo << player
    end
  end
  player = players.max_by { |player| player[:steals] }
  num_to_name(player[:team_name], player[:number]) == player_with_longest_name
end