require "pry"

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
  
def home_team_name
  game_hash[:home][:team_name]
end


#def good_practices
#  game_hash.each do |location, team_data|
#    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#    binding.pry
#      team_data.each do |attribute, data|
#        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#        binding.pry
 
#        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
#        data.each do |data_item|
#            binding.pry
#      end
#    end
#  end
#end


def num_points_scored(all_scorers)
  if game_hash[:home][:players].include?(all_scorers)
    game_hash[:home][:players][all_scorers][:points]
  elsif 
  game_hash[:away][:players].include?(all_scorers)
  game_hash[:away][:players][all_scorers][:points]
  end
end

def shoe_size(players_shoe_size)
  if game_hash[:home][:players].include?(players_shoe_size)
    game_hash[:home][:players][players_shoe_size][:shoe]
  elsif 
  game_hash[:away][:players].include?(players_shoe_size)
  game_hash[:away][:players][players_shoe_size][:shoe]
  end
end

def team_colors(jersey_colors)
  if game_hash[:home].value? (jersey_colors)
    game_hash[:home][:colors]
    elsif
    game_hash[:away].value? (jersey_colors)
    game_hash[:away][:colors]
  end
end

def team_names
teams = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
teams
end

def player_numbers(teams)
  if game_hash[:home].value? (teams)
    game_hash[:home][:players].map do |names, stats|
      stats.values.first
    end
      elsif
      game_hash[:away].value? (teams)
      game_hash[:away][:players].map do |names, stats|
        stats[:number]
      end
    end
  end
    
def player_stats (name)
  if game_hash[:home][:players].include?(name)
   game_hash[:home][:players]["#{name}"]
  elsif game_hash[:away][:players].include?(name)
   game_hash[:away][:players]["#{name}"]
  end
end
    

def big_shoe_rebounds
  big_boy=game_hash[:home][:players].max_by { |name, stats| stats[:shoe] }.first
  if game_hash[:home][:players].include?(big_boy)
    game_hash[:home][:players][big_boy][:rebounds]
  elsif game_hash[:away][:players].include?(big_boy)
    game_hash[:away][:players][big_boy][:rebounds]
  end
end












    
    