def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0 ,
          :shoe => 16 ,
          :points => 22 ,
          :rebounds => 12 , 
          :assists => 12 ,
          :steals => 3 ,
          :blocks => 1 ,
          :slam_dunks => 1 
        },
        {
          :player_name => "Reggie Evans",
          :number => 30 ,
          :shoe => 14 ,
          :points => 12 ,
          :rebounds => 12 , 
          :assists => 12 ,
          :steals => 12 ,
          :blocks => 12 ,
          :slam_dunks => 7 
        },
        {
          :player_name => "Brook Lopez",
          :number => 11 ,
          :shoe => 17 ,
          :points => 17 ,
          :rebounds => 19 , 
          :assists => 10 ,
          :steals => 3 ,
          :blocks => 1 ,
          :slam_dunks => 15 
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1 ,
          :shoe => 19 ,
          :points => 26 ,
          :rebounds => 11 , 
          :assists => 6 ,
          :steals => 3 ,
          :blocks => 8 ,
          :slam_dunks => 5 
        },
        {
          :player_name => "Jason Terry",
          :number => 31 ,
          :shoe => 15 ,
          :points => 19 ,
          :rebounds => 2 , 
          :assists => 2 ,
          :steals => 4 ,
          :blocks => 11 ,
          :slam_dunks => 1 
        }
        ]
      
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4 ,
          :shoe => 18 ,
          :points => 10 ,
          :rebounds => 1 , 
          :assists => 1 ,
          :steals => 2 ,
          :blocks => 7 ,
          :slam_dunks => 2 
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0 ,
          :shoe => 16 ,
          :points => 12 ,
          :rebounds => 4 , 
          :assists => 7 ,
          :steals => 22 ,
          :blocks => 15 ,
          :slam_dunks => 10 
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2 ,
          :shoe => 14 ,
          :points => 24 ,
          :rebounds => 12 , 
          :assists => 12 ,
          :steals => 4 ,
          :blocks => 5 ,
          :slam_dunks => 5 
        },
        {
          :player_name => "Ben Gordon",
          :number => 8 ,
          :shoe => 15 ,
          :points => 33 ,
          :rebounds => 3 , 
          :assists => 2 ,
          :steals => 1 ,
          :blocks => 1 ,
          :slam_dunks => 0 
        },
        {
          :player_name => "Kemba Walker",
          :number => 33 ,
          :shoe => 15 ,
          :points => 6 ,
          :rebounds => 12 , 
          :assists => 12 ,
          :steals => 7 ,
          :blocks => 5 ,
          :slam_dunks => 12 
        }
        ]
    }
  }
end

def find_player_info_hash(player_name)
  game_hash.each do |team, team_hash|
    team_hash[:players].find do |player_hash| 
      if player_hash[:player_name] == player_name 
        return player_hash
      end 
    end
  end
end

def num_points_scored(player_name)
  player_hash = find_player_info_hash(player_name)
  player_hash[:points]
end

def shoe_size(player_name)
  find_player_info_hash(player_name)[:shoe]
end 

def team_colors(team_name)
  game_hash.find do |team, team_hash|
    if team_hash[:team_name] == team_name
      return team_hash[:colors]
    end
  end
end 

def team_names
  teams = []
  game_hash.each_with_object(teams) do |(team, team_hash), teams|
    teams << team_hash[:team_name]
  end 
  teams 
end 

def player_numbers(team_name)
  team_numbers = []
  game_hash.each do |k,v| 
    if v[:team_name] == team_name
      v[:players].each_with_object(team_numbers) do |player_hash, team_numbers|
        team_numbers << player_hash[:number]
      end 
    end
  end 
  team_numbers
end

def player_stats(player_name)
  player_hash = find_player_info_hash(player_name)
  player_hash.delete(:player_name)
  player_hash
end

def all_players_array
  players_array = []
  game_hash.each_with_object(players_array) do |(team, team_hash), players_array|
    players_array << team_hash[:players]
  end 
  players_array.flatten
end 

def big_shoe_rebounds
  all_players_array.max_by { |player_hash| player_hash[:shoe] }[:rebounds] 
end 

def most_points_scored
  all_players_array.max_by { |player_hash| player_hash[:points] }[:player_name]
end 



def score_board 
  score = {}
  game_hash.each_with_object(score) do |(team, team_hash), score|
    team_name = team_hash[:team_name]
    score[team_name] = 0 
    team_hash[:players].each_with_object(score) do |player_hash, score|
      score[team_name] += player_hash[:points]
    end 
    score 
  end
end 

def winning_team
  score_board.each do  |team, score| 
    if score == score_board.values.max 
     return team 
    end 
  end 
end 

def player_with_longest_name 
  all_players_array.max_by { |player_hash| player_hash[:player_name].length }[:player_name]
end 
  
def steals_of_longest_name
  all_players_array.max_by { |player_hash| player_hash[:player_name].length }[:steals]
end 

def most_steals
  all_players_array.max_by { |player_hash| player_hash[:steals] }[:steals]
end 
  

def long_name_steals_a_ton?
  steals_of_longest_name == most_steals
end 
  

# rspec spec/hashketball_spec.rb -e num_points_scored