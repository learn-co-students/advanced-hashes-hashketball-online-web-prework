require "pry"

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def hashketball = {
  :home => {
    :team_name => "Brooklyn Nets"
    :colors => ["Black", "White"]
    :players => {
      {
      
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1 
        }
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
        }
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
        }
      
    }
   }
  }
  
  :away => {
      :team_name => "Charlotte Hornets"
    :colors => ["Turquoise", "Purple"]
    :players => {
      
  "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2 
        }
      },

      "Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10 
        }
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
}


def num_points_scored(player, hashketball)
   player.capitalize!
  if hashketball[:home][:players].include?(player)
   hashketball[:home][:players][player][:stats][:points]
  elsif hashketball[:away][:players].include?(player)
   hashketball[:away][:players][player][:stats][:points]
  else
   "No player found."
  end
end
end

def shoe_size(player, hashketball)
  player.capitalize!
  if hashketball[:home][:players].include?(player)
   hashketball[:home][:players][player][:shoe_size]
  elsif hashketball[:away][:players].include?(player)
   hashketball[:away][:players][player][:shoe_size]
  else
   "No player found."
  end
end
end

def team_colors(team, hashketball)
    sym = team.to_sym
  if hashketball.include?(sym)
   hashketball[sym][:colors]
  else
   "Try home or away."
  end
end
end









