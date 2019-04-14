require "pry"
# Write your code here!


def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White" ] ,
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16, 
          :points => 22,
          :rebounds => 12, 
          :assists => 12, 
          :steals =>3,
          :blocks =>1, 
          :slam_dunks =>1
          
        },
        "Reggie Evans" => {
          :number =>30,
          :shoe =>14, 
          :points =>12,
          :rebounds =>12, 
          :assists =>12,
          :steals =>12, 
          :blocks =>12, 
          :slam_dunks =>7
        },
        "Brook Lopez" => {
          :number =>11,
          :shoe =>17, 
          :points =>17,
          :rebounds =>19, 
          :assists =>10, 
          :steals =>3, 
          :blocks =>1, 
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number =>1,
          :shoe =>19, 
          :points =>26,
          :rebounds =>12, 
          :assists =>6, 
          :steals =>3, 
          :blocks =>8, 
          :slam_dunks =>5
        },
        "Jason Terry" => {
          :number =>31,
          :shoe =>15, 
          :points =>19,
          :rebounds =>2, 
          :assists =>2, 
          :steals =>4, 
          :blocks =>11, 
          :slam_dunks =>1
        }
        
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors =>["Turquoise", "Purple"],
      :players => {
           "Jeff Adrien" =>{
          :number =>4,
          :shoe =>18, 
          :points =>10,
          :rebounds =>1, 
          :assists =>1, 
          :steals =>2, 
          :blocks =>7, 
          :slam_dunks =>2
        },
           "Bismak Biyombo" =>{
          :number =>0,
          :shoe =>16, 
          :points =>12,
          :rebounds =>4, 
          :assists =>7, 
          :steals =>7, 
          :blocks =>15, 
          :slam_dunks =>10
        },
           "DeSagna Diop" =>{
          :number =>2,
          :shoe =>14, 
          :points =>24,
          :rebounds =>12, 
          :assists =>12, 
          :steals =>4, 
          :blocks =>5, 
          :slam_dunks =>5
        },
           "Ben Gordon" => {
          :number =>8,
          :shoe =>15, 
          :points =>33,
          :rebounds =>3, 
          :assists =>2, 
          :steals =>1, 
          :blocks =>1, 
          :slam_dunks =>0
        },
           "Brendan Haywood" =>{
          :number =>33,
          :shoe =>15, 
          :points =>6,
          :rebounds =>12, 
          :assists =>12, 
          :steals =>22, 
          :blocks =>5, 
          :slam_dunks =>12
        }
      }
    }
  }
end 


def num_points_scored(name)
 game_hash.each do |location, team_data|
   team_data[:players].each do |player, stats|
     if player == name
         return stats[:points]
       end
     end
 end
end 
 
def shoe_size(name)
 game_hash.each do |location, team_data|
   team_data[:players].each do |player, stats|
     if player == name
         return stats[:shoe]
       end
     end
 end
end 

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end 

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
end
end

def player_numbers(team_name)
array = []
 game_hash.collect do |location, team_data|
   if team_data[:team_name] == team_name
      team_data[:players].collect do |player, stats|
        array << stats[:number]
     end
   end
 end
 array
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if player == player_name
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  array = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      array << stats[:shoe]
    end
  end
  array.sort!
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      if array.last == stats[:shoe]
        return stats[:rebounds]
      end
    end
  end
end


def most_points_scored
  array = []
  game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
      array << stats[:points]
    end
  end
  array.sort!
   game_hash.each do |location, team_data|
    team_data[:players].each do |player, stats|
     if array.last == stats[:points]
       return player 
     end
   end
 end
end

def winning_team
  brooklyn_array = []
  charlotte_array = []
  game_hash.each do |location, team_data|
    if location == :home 
      team_data[:players].each do |player, stats|
        brooklyn_array << stats[:points]
      end
      elsif location == :away
        team_data[:players].each do |player, stats|
          charlotte_array << stats[:points]
        end
    end
  end
    if brooklyn_array.sum > charlotte_array.sum
      game_hash.each do |location, team_data|
        return team_data[:team_name]
      end
    end
 end
 
 def player_with_longest_name
   array = []
   game_hash.each do |location, team_data|
     team_data[:players].each do |player, stats|
       array << player.length
     end
   end
   array.sort 
   game_hash.each do |location, team_data|
     team_data[:players].each do |player, stats|
   if array.last == player.length 
     return player
   end
 end
 end
 end 
 
 def long_name_steals_a_ton?
   steals_array = []
   game_hash.each do |location, team_data|
     team_data[:players].each do |player, stats|
       steals_array << stats[:steals]
     end
   end
   steals_array.sort
   game_hash.each do |location, team_data|
     team_data[:players].each do |player, stats|
   if steals_array.last == stats[:steals]
     return player.eql?(player_with_longest_name)
   end
 end
 end
 end