# Write your code here!
require "pry"
def game_hash
  game_hash = {
    home: {team_name: "Brooklyn Nets", colors: ["Black", "White"], players: {
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
      }},
    away: {team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"] , players: {
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

def num_points_scored(name)
  hash = game_hash
    hash.each do |location, info|
      info.each do |attribute, stuff|
        if stuff.include?(name)
         return hash[location][attribute][name][:points]
        end
      end
    end
  end

def shoe_size(name)
  hash = game_hash
  hash.each do |location, info|
    info.each do |attribute, stuff|
      if stuff.include?(name)
        return hash[location][attribute][name][:shoe]
      end
    end
  end
end

def team_colors(team)
  hash = game_hash
  hash.each do |location, attributes|
    if hash[location].values.include?(team)
      attributes.each do |attribute, info|
        if attribute == :colors
          return info
        end
      end
    end
  end
end

def team_names
  hash = game_hash
  teams = []
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if attribute == :team_name
        teams << info
      end
    end
  end
  return teams
end

def player_numbers(teamname)
  hash = game_hash
  jersey_numbers = []
  hash.each do |location, attributes|
    if hash[location].values.include?(teamname)
      attributes.each do |attribute, info|
        if info.class == Hash
          info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :number
                jersey_numbers << int
              end
            end
          end
        end
      end
    end
  end
  return jersey_numbers
end

def player_stats(playername)
  hash = game_hash
  hash.each do |location, values|
    values.each do |attribute, info|
      if info.include?(playername)
        return hash[location][attribute][playername]
      end
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.class == Hash
        info.each do |player, stats|
          stats.each do |stat, int|
            if stat == :shoe
              if int > shoe_size
                shoe_size = int
                player_name = player
              end
            end
          end
        end
        return hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end
