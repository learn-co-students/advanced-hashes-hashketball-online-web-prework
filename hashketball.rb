require 'pry'

def game_hash
   {
  home:{
    team_name: "Brooklyn Nets",
    colors:["Black", "White"],
    players:{
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

  away:{
    team_name: "Charlotte Hornets",
    colors:["Turquoise", "Purple"],
    players:{
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
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
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
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  }

}
end

def num_points_scored(name)
game_hash.each do |location, team_data|
  #binding.pry
  team_data.each do |attribute, data|
    #binding.pry
    if data.include?(name)
     return game_hash[location][attribute][name][:points]
        end
      end
    end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    #binding.pry
    team_data.each do |attribute, data|
      #binding.pry
      if data.include?(name)
     return game_hash[location][attribute][name][:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    #binding.pry
    if game_hash[location].values.include?(team)
      team_data.each do |key, value|
        if key == :colors
          return value
        end
      end
    end
  end
end

def team_names
matchup = []
game_hash.each do |location, team_data|
  #binding.pry
  team_data.each do |key, value|
  if key == :team_name
  matchup << value
end
end
end
matchup
end

def player_numbers(team)
  starters = []
  game_hash.each do |location, team_data|
    if game_hash[location][:team_name] == team
        game_hash[location][:players].each do |name, stats|
          stats.each do |key, value|
            if key == :number
              starters << value
            end
          end
        end
      end
   end
   starters
end

def player_stats(name)
  game_hash.each do |location, team_data|
    #binding.pry
    team_data.each do |attribute, data|
      #binding.pry
      if data.include?(name)
      return game_hash[location][:players][name]
     end
   end
 end
end

def big_shoe_rebounds
  biggest_shoe = 0
  boards = 0
game_hash.values.each do |team_data|
#binding.pry
team_data[:players].values.each do |player|
  if player[:shoe] > biggest_shoe
    biggest_shoe = player[:shoe]
    boards = player[:rebounds]
  end
end
end
return boards
end
