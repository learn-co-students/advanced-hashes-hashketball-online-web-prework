require 'pry'

def game_hash
hash = {
     :home => {
       :team_name => "Brooklyn Nets",
       :colors => ["Black", "White"],
       :players => {"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12,
                                      :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
                    "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12,
                                      :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
                    "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19,
                                      :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
                    "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12,
                                      :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
                    "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2,
                                     :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}

                    }
              },
     :away => {
       :team_name => "Charlotte Hornets",
       :colors => ["Turquoise", "Purple"],
       :players => {"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1,
                                     :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
                    "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4,
                                        :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
                    "DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12,
                                      :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
                    "Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3,
                                    :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
                    "Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12,
                                         :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
                   }
              }
        }
end

def num_points_scored(player_name)
  points_p = nil
   game_hash.each do |location, team_data|
     team_data[:players].each do |player, data|
       if(player.to_s === player_name)
         data.each do |s, score|
            if(s.to_s === 'points')
              points_p = score
            end
         end
       end
     end
   end
   points_p
end# Write your code here!

def shoe_size(player_name)
  size = nil
   game_hash.each do |location, team_data|
     team_data[:players].each do |player, data|
       if(player.to_s === player_name)
         data.each do |s, score|
           if(s.to_s === 'shoe')
             size = score
           end
         end
       end
     end
   end
   size
end

def team_colors(team_name)
team_colors = nil
  game_hash.each do |location, team_data|
    team_data.each do |data, names|
      if(names.to_s === team_name)
       team_colors = game_hash[location][:colors]
     end
    end
  end
  team_colors
end

def team_names
  team = []
  game_hash.each do |location, team_data|
    team << game_hash[location][:team_name]
  end
  team
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |data, names|
      if(names.to_s === team_name)
        team_data[:players].each do |player, data|
          data.each do |s, score|
           if(s.to_s === 'number')
             numbers << score
           end
          end
        end
       end
     end
   end
  numbers
end

def player_stats(player_name)
 stats = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, data|
      if(player.to_s === player_name)
        data.each do |s, score|
          stats[s] = score
        end
      end
    end
  end
  stats
end

def big_shoe_rebounds
  # game_hash.each do |location, team_data|
  #   team_data[:players].each do |player, data|
  #     data.each do |s, score|
  #       data.max_by do |s, score|
  #         binding.pry
  #          if(s.to_s === 'shoe')
  #             score
  #          end
  #       end
  #     end
  #   end
  # end

  compare_shoe = 0
  largest_shoe = 0
  player_with_largest_shoe = ""
  rebounds = 0

  game_hash.each do |location, team_data|
    team_data[:players].each do |name, stats|
      stats.each do |stat_name, value|
        if(stat_name.to_s === "shoe")
          compare_shoe = value
           if compare_shoe > largest_shoe
             largest_shoe = compare_shoe
             player_with_largest_shoe = name
             rebounds = team_data[:players][player_with_largest_shoe][:rebounds]
           end
        end
      end
    end
  end
  rebounds
end
