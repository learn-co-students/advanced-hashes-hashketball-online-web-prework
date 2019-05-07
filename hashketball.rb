require "pry"



def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
    ]
    }
  }
end

def num_points_scored(name)
  game_hash[:home][:players].each do |player_hash|
    if player_hash[:player_name] == name
      return player_hash[:points]
    end
  end
  game_hash[:away][:players].each do |player_hash|
    if player_hash[:player_name] == name
      return player_hash[:points]
   end
  end
end

def shoe_size(name)
  game_hash[:home][:players].each do |player_hash|
    if player_hash[:player_name] == name
      return player_hash[:shoe]
    end
  end
  game_hash[:away][:players].each do |player_hash|
    if player_hash[:player_name] == name
      return player_hash[:shoe]
    end
   end
 end

def team_colors(team_name)
array = []
  game_hash.each do |location, attributes|
    if game_hash[location].values.include?(team_name)
      attributes.each do |attribute, info|
        if attribute == :colors
          return info
        end
      end
    end
  end
end

def team_names
  array = []
  game_hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if attribute == :team_name
        array << info
      end
    end
  end
  return array
end

def player_numbers(team_name)
  numbers_array = []
  game_hash.each do |location, attributes|
    if attributes[:team_name] == team_name
      attributes[:players].each do |player|
        numbers_array << player[:number]
    end
   end
  end
  return numbers_array.sort
end

def player_stats(player_name)
  game_hash.each do |location, attributes|
    attributes[:players].each do |stats|
      if stats[:player_name] == player_name
        stats.delete(:player_name)
        return stats
    end
  end
 end
end

def big_shoe_rebounds
  game_hash.each do |location, attributes|
    attributes[:players].each do |stats|
      if stats[:shoe].size
        return stats[:rebounds]
   end
  end
 end
end
