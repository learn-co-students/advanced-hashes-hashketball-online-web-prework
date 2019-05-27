require 'pry'
def game_hash 
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
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
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
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
#==================================================
def num_points_scored(playa)
  method_output = nil
  game_hash.each do |team, info|
    info.each do |info_type, stats|
      if info_type == :players
        stats.each do |name, values|
          if name == playa 
            values.each do |data_type, data|
              if data_type == :points
                method_output = data
              end
            end
          end
        end
      end
    end
  end
  method_output
end
#==================================================
def shoe_size(playa) 
  method_output = nil
  game_hash.each do |team, info|
    info.each do |info_type, stats|
      if info_type == :players
        stats.each do |name, values|
          if name == playa 
            values.each do |data_type, data|
              if data_type == :shoe
                method_output = data
              end
            end
          end
        end
      end
    end
  end
  method_output
end
#==================================================
def team_colors(team_name)
end_var = nil
  game_hash.each do |team, info|
    if info[:team_name] == team_name
      end_var = info[:colors]
    end
  end
end_var
end 
        
#==================================================
def team_names
  team_array = []
  game_hash.each do |team, info|
    team_array.push(info[:team_name])
  end
  team_array
end 
#==================================================
def player_numbers(chosen_team)
  jersey_array = []
  game_hash.each do |team, info|
    info.each do |info_type, stats|
      if info_type == :team_name
        if stats == chosen_team
          info.each do |info_type_two, stats_two|
            if info_type_two == :players 
              stats_two.each do |player_name, data|
                data.each do |value, num|
                  if value == :number
                    jersey_array.push(num)
                  end 
                end
              end
            end 
          end 
        end 
      end
    end
  end
  jersey_array
end 
#==================================================
def player_stats(playa)
  method_output = nil
  game_hash.each do |team, info|
    info.each do |info_type, stats|
      if info_type == :players
        stats.each do |name, values|
          if name == playa 
            method_output = values
          end
        end
      end
    end
  end
  method_output
end 
#==================================================
def big_shoe_rebounds
  rebounds = 0
  shoe_size = 0
  game_hash.each do |team, info|
    info.each do |info_type, stats| 
      if info_type == :players
        stats.each do |name, values|
          values.each do |value_type, num|
            if value_type == :shoe
              if num > shoe_size
                shoe_size = num 
                values.each do |value_type1, num1|
                  if value_type1 == :rebounds
                    rebounds = num1 
                  end 
                end 
              end 
            end
          end 
        end 
      end 
    end 
  end 
  rebounds 
end 
#==================================================
def most_points_scored
  player = " "
  points_scored = 0
  game_hash.each do |team, info|
    info.each do |info_type, stats| 
      if info_type == :players
        stats.each do |name, values|
          bleeb = num_points_scored(name)
          if bleeb > points_scored 
            points_scored = bleeb 
            player = name 
          end 
        end 
      end 
    end 
  end
  player
end 
#==================================================
def winning_team
  home = 0
  away = 0
  game_hash.each do |team, info|
    turm = team 
    if turm == :home
      info.each do |info_type, stats|
        if info_type == :players
          stats.each do |name, values|
            bleeb = num_points_scored(name)
            home += bleeb
          end 
        end 
      end
    elsif turm == :away 
      info.each do |info_type, stats| 
        if info_type == :players
          stats.each do |name, values|
            bleeeeeep = num_points_scored(name)
            away += bleeeeeep
          end 
        end
      end
    else break
    end
  end
  if home > away
    return "Brooklyn Nets"
  elsif away > home 
    return "Charlotte Hornets"
  else return "TIE"
  end 
end 
#==================================================
def player_with_longest_name
  player = " "
  name_length = 0
  game_hash.each do |team, info|
    info.each do |info_type, stats| 
      if info_type == :players
        stats.each do |name, values|
          namae = name.length 
          if name_length <= namae 
            player = name 
            name_length = namae
          end
        end 
      end 
    end 
  end
  player
end
#==================================================
def long_name_steals_a_ton?
  longest_named = player_with_longest_name
  player_dat_steals = " "
  steal_count = 0
  game_hash.each do |team, info|
    info.each do |info_type, stats| 
      if info_type == :players
        stats.each do |name, values|
          values.each do |value_type, num|
            if value_type == :steals
              if steal_count <= num
                steal_count = num 
                player_dat_steals = name
              end 
            end
          end
        end 
      end 
    end 
  end
  if player_dat_steals == longest_named
    return true 
  else false 
  end
end