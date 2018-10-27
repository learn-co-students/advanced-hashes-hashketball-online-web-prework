# Write your code here!
require 'pry'

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => { number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => { number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => { number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks:15},
        "Mason Plumlee" => { number: 1, shoe: 19, points:  26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => { number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      },
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => { number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => { number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => { number: 2, shoe: 14, points:  24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => { number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => { number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
  game
end


def num_points_scored(name)
  out = nil
  game_hash.each do |key, val|
    if val[:players][name]
      out = val[:players][name][:points]
    end
  end
  out
end

def shoe_size(name)
  out = nil
  game_hash.each do |key, val|
    if val[:players][name]
      out = val[:players][name][:shoe]
    end
  end
  out
end

def team_colors(team)
  out = nil
  game_hash.each do |key, val|
    if val[:team_name] == team
      out = val[:colors]
    end
  end
  out
end

def team_names
  out = []
  game_hash.each do |key, val|
    if val[:team_name]
      out.push(val[:team_name])
    end
  end
  out
end

def player_numbers(team)
  out = []
  game_hash.each do |key, val|
    if val[:team_name] == team
      val[:players].each do |k,v|
        out.push(v[:number])
      end
    end
  end
  out
end

def player_stats(name)
  out = []
  game_hash.each do |key, val|
    if val[:players][name]
      out = val[:players][name]
    end
  end
  out
end 

def big_shoe_rebounds
  a = []
  out = nil
  game_hash.each do |key,val|
    val.each do |k,v|
      if v == val[:players]
        v.each do |attr, value|
          a.push(value[:shoe])
        end
      end
    end
  end

  out = a.max
  game_hash.each do |key, val|
    val.each do |k,v|
      if v == val[:players]
        v.each do |attr, value|
          if value[:shoe] == out
            out = value[:rebounds]
          end
        end
      end
    end
  end
  out
end