require 'pry'
def game_hash
  game_setup_hash = {
    home: {
           team_name: "Brooklyn Nets",
           colors: [
                   "Black","White"
                   ],

           players: {
                    "Alan Anderson" =>
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

                      "Reggie Evans" =>
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

                      "Brook Lopez" =>
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

                      "Mason Plumlee" =>
                      {
                      number: 1,
                      shoe: 19,
                      points: 26,
                      rebounds: 12,
                      assists: 6,
                      steals: 3,
                      blocks: 8,
                      slam_dunks: 5
                      },

                      "Jason Terry" =>
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
                     }

                   },

    away: {
           team_name: "Charlotte Hornets",
           colors: [
                    "Turquoise","Purple"
                   ],

           players: {
                    "Jeff Adrien" =>
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


                      "Bismack Biyombo" =>
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


                      "DeSagna Diop" =>
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


                      "Ben Gordon" =>
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


                      "Kemba Walker" =>
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

                    }

                 }
               }
end

def num_points_scored (player_name)
  hash = game_hash
  hash.each do |level_1, level_2|
    level_2.each do |level_3, level_4|
        if level_4.include?(player_name)
          return hash[level_1][level_3][player_name][:points]
        end
    end
  end
end


def shoe_size (player_name)
  game_hash.each do |level_1, level_2|
    level_2.each do |level_3, level_4|

        if level_4.include?(player_name)
          return game_hash[level_1][level_3][player_name][:shoe]
        end
    end
  end
end

def team_colors (team_name)
  game_hash.each do |location, info|
    if info[:team_name] == team_name
      return info[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, info|
    teams << game_hash[location][:team_name]
  end
  teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, info|
    if team_name == game_hash[location][:team_name]
      game_hash[location][:players].each do |name, stats|
        numbers.push(stats[:number])
      end
    end
  end
  numbers
end

def player_stats(name)
  game_hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.include?(name)
       return game_hash[location][attribute][name]
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
