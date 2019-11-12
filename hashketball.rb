# Write your code here!

def game_hash()
  hash = {
    :home=>{
      :team_name=>"Brooklyn Nets",
      :colors=>["Black", "White"],
      :players=>[{:player_name=>"Alan Anderson", 
        :number=>0,
        :shoe=>16,
        :points=>22,
        :rebounds=>12,
        :assists=>12,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>1
      },
      { :player_name=>"Reggie Evans", 
        :number=>30,
        :shoe=>14,
        :points=>12,
        :rebounds=>12,
        :assists=>12,
        :steals=>12,
        :blocks=>12,
        :slam_dunks=>7
      },
      { :player_name=>"Brook Lopez", 
        :number=>11,
        :shoe=>17,
        :points=>17,
        :rebounds=>19,
        :assists=>10,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>15
      },
      { :player_name=>"Mason Plumlee", 
        :number=>1,
        :shoe=>19,
        :points=>26,
        :rebounds=>11,
        :assists=>6,
        :steals=>3,
        :blocks=>8,
        :slam_dunks=>5
      },
      { :player_name=>"Jason Terry", 
        :number=>31,
        :shoe=>15,
        :points=>19,
        :rebounds=>2,
        :assists=>2,
        :steals=>4,
        :blocks=>11,
        :slam_dunks=>1
      }]
    },
    :away=>{
      :team_name=>"Charlotte Hornets",
      :colors=>["Turquoise", "Purple"],
      :players=>[{ :player_name=>"Jeff Adrien", 
        :number=>4,
        :shoe=>18,
        :points=>10,
        :rebounds=>1,
        :assists=>1,
        :steals=>2,
        :blocks=>7,
        :slam_dunks=>2
      },
      { :player_name=>"Bismack Biyombo", 
        :number=>0,
        :shoe=>16,
        :points=>12,
        :rebounds=>4,
        :assists=>7,
        :steals=>22,
        :blocks=>15,
        :slam_dunks=>10
      },
      { :player_name=>"DeSagna Diop", 
        :number=>2,
        :shoe=>14,
        :points=>24,
        :rebounds=>12,
        :assists=>12,
        :steals=>4,
        :blocks=>5,
        :slam_dunks=>5
      },
      { :player_name=>"Ben Gordon", 
        :number=>8,
        :shoe=>15,
        :points=>33,
        :rebounds=>3,
        :assists=>2,
        :steals=>1,
        :blocks=>1,
        :slam_dunks=>0
      },
      { :player_name=>"Kemba Walker", 
        :number=>33,
        :shoe=>15,
        :points=>6,
        :rebounds=>12,
        :assists=>12,
        :steals=>7,
        :blocks=>5,
        :slam_dunks=>12
      }]
    }
  }
  hash
end

def num_points_scored(name)
  hash = game_hash
  hash.each do |team, attribute|
    attribute[:players].each do |player|
      if name == player[:player_name]
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  hash = game_hash
  hash.each do |team, attribute|
    attribute[:players].each do |player|
      if name == player[:player_name]
        return player[:shoe]
      end
    end
  end
end

def team_colors(name)
  color_arr = []
  hash = game_hash
  hash.each do |team, attribute|
    if attribute[:team_name] == name
      attribute[:colors].each do |color|
        color_arr << color 
      end
    end
  end
  color_arr
end

def team_names()
  team_names = []
  hash = game_hash
  hash.each do |team, attribute|
    team_names << attribute[:team_name] 
  end
  team_names
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |team, attribute|
    if attribute[:team_name] == team_name
      attribute.each do |key, value|
        if key == :players 
          value.each do |stat|
            jersey_numbers << stat[:number] 
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
  player_stats = {}
  game_hash.each do |team, attribute|
    attribute[:players].each do |player|
      if name == player[:player_name]
        player.each do |stat, value|
          if stat != :player_name 
            player_stats[stat] = value
          end
        end
      end
    end 
  end
  player_stats
end

def big_shoe_rebounds()
  max_shoe = 0 
  rebounds = 0 
  game_hash.each do |team, attribute|
    attribute[:players].each do |player|
      if player[:shoe] > max_shoe
        max_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored()
  max_points = 0 
  player_with_max = ""
  game_hash.each do |team, attribute|
    attribute[:players].each do |player|
      if player[:points] > max_points
        max_points = player[:points]
        player_with_max = player[:player_name]
      end
    end
  end
  player_with_max
end

def winning_team()
  nets_points = 0 
  hornets_points = 0 
  game_hash[:home][:players].each do |player|
    nets_points += player[:points]
  end
  game_hash[:away][:players].each do |player|
    hornets_points += player[:points]
  end
  if nets_points > hornets_points
    return "Brooklyn Nets"
  else 
    return "Charlotte Hornets"
  end
end

def player_with_longest_name() 
  max_length = 0 
  player_with_max_length = ""
  game_hash.each do |team, attribute|
    attribute[:players].each do |player|
      if player[:player_name].length > max_length
        max_length = player[:player_name].length
        player_with_max_length = player[:player_name]
      end
    end
  end
  player_with_max_length
end

def long_name_steals_a_ton?() 
  most_steals = 0 
  bismacks_steals = 22
  game_hash.each do |team, attribute|
    attribute[:players].each do |player|
      if player[:steals] > most_steals
        most_steals = player[:steals]
      end
    end
  end
  if most_steals == bismacks_steals
    return true 
  else 
    return false 
  end 
end





