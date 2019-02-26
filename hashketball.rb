require "pry"
def game_hash
  
  {:home =>
   { :team_name => "Brooklyn Nets",
     :colors => ["Black","White"], 
     :players => {"Alan Anderson" => {
        :number => 0 , 
        :shoe => 16, 
        :points => 22, 
        :rebounds => 12, 
        :assists => 12,
        :steals => 3, 
        :blocks => 1, 
        :slam_dunks => 1},
         "Reggie Evans" => {
        :number => 30, 
        :shoe => 14, 
        :points => 12, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 12, 
        :blocks => 12, 
        :slam_dunks => 7},  
        "Brook Lopez" => {
        :number => 11, 
        :shoe => 17, 
        :points => 17, 
        :rebounds => 19, 
        :assists => 10, 
        :steals => 3, 
        :blocks => 1, 
        :slam_dunks => 15}, 
         "Mason Plumlee" => { 
        :number => 1, 
        :shoe => 19, 
        :points => 26, 
        :rebounds => 12, 
        :assists => 6, 
        :steals => 3, 
        :blocks => 8, 
        :slam_dunks => 5}, 
        "Jason Terry" => {
        :number => 31, 
        :shoe => 15, 
        :points => 19, 
        :rebounds => 2, 
        :assists => 2, 
        :steals => 4, 
        :blocks => 11, 
        :slam_dunks => 1}
     }
  },
  :away => {
      :team_name => "Charlotte Hornets", 
      :colors => ["Turquoise", "Purple"], 
      :players => {
        "Jeff Adrien" => { 
       :number => 4, 
       :shoe => 18, 
       :points => 10, 
       :rebounds => 1, 
       :assists => 1,
       :steals => 2, 
       :blocks => 7, 
       :slam_dunks => 2},
        "Bismak Biyombo" => { 
        :number => 0, 
        :shoe => 16, 
        :points => 12, 
        :rebounds => 4, 
        :assists => 7, 
        :steals => 7, 
        :blocks => 15, 
        :slam_dunks => 10},  
         "DeSagna Diop" => { 
        :number => 2, 
        :shoe => 14, 
        :points => 24, 
        :rebounds => 12, 
        :assists => 12, 
        :steals => 4, 
        :blocks => 5, 
        :slam_dunks => 5}, 
         "Ben Gordon" => { 
        :number => 8, 
        :shoe => 15, 
        :points => 33, 
        :rebounds => 3, 
        :assists => 2, 
        :steals => 1, 
        :blocks => 1, 
        :slam_dunks => 0}, 
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

def num_points_scored(player_name)
   player_point = 0
    game_hash.each do |key, data|
      data[:players].each do |current_player, player_stats|
  
     if current_player == player_name
    
      player_point = player_stats[:points]

    end
   end
  end
  player_point
end

def shoe_size(player_name)
  player_shoe = 0
  game_hash.each do |key, data|
    data[:players].each do |current_player, player_stats|
      
     if current_player == player_name
       player_shoe = player_stats[:shoe]
  
     end
    end
  end
  player_shoe
end


def team_colors(team)
  colors = 0 
  game_hash.each do |location, team_stats|
    
    
      if team_stats[:team_name]  == team
       
       colors = team_stats[:colors]
      end  
  end
  colors
end

def team_names
     
   game_hash.collect do |location, team_stats|
     
     team_stats[:team_name]
    
 end
end

def player_numbers(team_name) 
    #number = []
    
    if game_hash[:home][:team_name] == team_name
        # game_hash[:home][:players].map do |name, player_stats|
        #   player_stats[:number]
        # end
        get_player_numbers(game_hash[:home][:players])
    else
        # game_hash[:away][:players].map do |name, player_stats|
        #   player_stats[:number]
        # end
       get_player_numbers(game_hash[:away][:players])
    end
  
    #game_hash[:home][:team_name] == team_name ? get_player_numbers(game_hash[:home][:players]) : get_player_numbers(game_hash[:away][:players])
    #number
end

def get_player_numbers(whatever)
  whatever.map{|name, stats| stats[:number]}
end

def player_stats(player_name)
   
  game_hash.each do |location, player_stat|
  
    player_stat[:players].each do |name, data|
      
     if name  == player_name
      return  data
     end
   end
  end
end

def big_shoe_rebounds
  num = 0
  game_hash.each do |location, player_stat|
    player_stat[:players].each do |name, data|
       data.keys.each {|key| puts key if data[key] > data[key]}
      
        return data[:rebounds]
       
    end
  end 
end 




