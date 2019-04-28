# Write your code here!
require "pry"

def game_hash
  {
    home:{
      team_name: "Brooklyn Nets",
      colors: ["Black","White"],
      players:{
        "Alan Anderson"=>{number:0,shoe:16,points:22,rebounds:12,assists:12,steals:3,blocks:1,slam_dunks: 1},
        "Reggie Evans"=>{number:30,shoe:14,points:12,rebounds:12,assists:12,steals:12,blocks:12,slam_dunks: 7},
        "Brook Lopez"=>{number:11,shoe:17,points:17,rebounds:19,assists:10,steals:3,blocks:1,slam_dunks: 15},
        "Mason Plumlee"=>{number:1,shoe:19,points:26,rebounds:12,assists:6,steals:3,blocks:8,slam_dunks: 5},
        "Jason Terry"=>{number:31,shoe:15,points:19,rebounds:2,assists:2,steals:4,blocks:11,slam_dunks: 1}
      }
    },
    away:{
      team_name: "Charlotte Hornets",
      colors:["Turquoise","Purple"],
      players:{
        "Jeff Adrien"=>{number:4,shoe:18,points:10,rebounds:1,assists:1,steals:2,blocks:7,slam_dunks: 2},
        "Bismak Biyombo"=>{number:0,shoe:16,points:12,rebounds:4,assists:7,steals:7,blocks:15,slam_dunks: 10},
        "DeSagna Diop"=>{number:2,shoe:14,points:24,rebounds:12,assists:12,steals:4,blocks:5,slam_dunks: 5},
        "Ben Gordon"=>{number:8,shoe:15,points:33,rebounds:3,assists:2,steals:1,blocks:1,slam_dunks: 0},
        "Brendan Haywood"=>{number:33,shoe:15,points:6,rebounds:12,assists:12,steals:22,blocks:5,slam_dunks: 12}
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |side,data|
    data.each do |attribute,stats|
      return game_hash[side][attribute][name][:points] if stats.include?(name)
    end
  end
end


def shoe_size(name)
  game_hash.each do |side,data|
    data.each do |attribute,stats|
      return game_hash[side][attribute][name][:shoe] if stats.include?(name)
    end
  end
end

def team_colors(team)
  game_hash.each do |side,data|
    data.each do |attribute,stats|
      return game_hash[side][:colors] if stats.include?(team)
    end
  end
end

def team_names
  array=[]
  game_hash.each do |side,data|
    data.each do |attribute, stats|
      if attribute==:team_name
        array.push(stats)
      end
    end
  end
  array
end

def player_numbers(team)
  array=[]
  game_hash.each do |side,data|
    data.each do |attribute, stats|
      if stats.include?(team)
        array.push((game_hash[side][:players].values).map{|i| i[:number] || i})
        #using .values returns an array of hashes containing the player stats
        #so since we have an array, we can use map to iterate over the array
        #and get the underlying stats :number
      end
    end
  end
  array.flatten
  #the result of the above iteration is an array of an array so we need
  #to flatten it
end

def player_stats(name)
  game_hash.each do |side,data|
    data.each do |attribute,stats|
      return game_hash[side][:players][name] if stats.include?(name)
    end
  end
end

def big_shoe_rebounds
  shoe_sizes=[]
  players=[]
  max_size=0
  biggest_shoe_player=""
  game_hash.each do |side,data|
    data.each do |attribute,stats|
      if attribute==:players
        shoe_sizes.push(stats.keys.map{|i| shoe_size(i) || i})
        #creating an array of all shoe sizes
        players.push(stats.keys)
        #creating array of all players
      end
    end
  end
  shoe_sizes=shoe_sizes.flatten
  max_size=shoe_sizes.max
  players=players.flatten
  biggest_shoe_player=players[shoe_sizes.index(max_size)]

  game_hash.each do |side,data|
    data.each do |attribute,stats|
      if stats.include?(biggest_shoe_player)
        return game_hash[side][:players][biggest_shoe_player][:rebounds]
      end
    end
  end
end
