# Write your code here!
require 'pry'

def game_hash
  game_hash = {
    :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
      :name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      {
      :name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      {
      :name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      {
      :name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      {
      :name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
      :name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      {
      :name => "Bismack Biyombo", 
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
      },
      {
      :name => "DeSagna Diop", 
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
      },
      {
      :name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      {
      :name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
      }
    ]
  }
}

return game_hash
end



def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end



def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end



def team_colors(team_names)
  game_hash.each do |place, team|
    if team[:team_name] == team_names
        return team[:colors]  
    end
  end
end



def team_names
  game_hash.collect do |place, team|
    team[:team_name]
    # binding.pry
  end
end


def player_numbers (team_names)
  player_numbers_list = []
  game_hash.each do |team, team_details_hash|
    if team_details_hash[:team_name] == team_names
      team_details_hash[:players].each do |player|
        player.each do |key, value|
          if key == :number 
            player_numbers_list.push(value)
          end
        end
      end
    end
  end
  player_numbers_list
end


def player_stats(player_name)
  player_stats = {}
  game_hash.each do |place, team|
    team[:players].each do |stats|

      if stats[:name] == player_name
        stats.delete(:name)
        player_stats = stats
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  big_shoes_guy = 0
  rebounds = 0
    game_hash.each do | team, team_details_hash|
      team_details_hash[:players].each do | stats |
        if stats[:shoe] > big_shoes_guy
          big_shoes_guy = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  rebounds
end


# BONUS 1: which player get the most POINT?
def most_points_scored
  points_scored = 0 
  player_name = 0 
  game_hash.each do |place,team|
    team[:players].each do |stats|
      if stats[:points] > points_scored
        points_scored = stats[:points]
        player_name = stats[:name]
        # binding.pry
      end
    end
  end
  return player_name
end




#BONUS 2: Which team has the highest score? should returns team name
def winning_team
  away_team_score = 0 
  home_team_score = 0 
  
  game_hash.each do |place,team| 
    
    if place == :home
      team[:players].each do |home_stats|
        if home_stats[:points] > home_team_score
          home_team_score += home_stats[:points]
        end
      end
    end
  
    if place == :away 
      team[:players].each do |away_stats|
        if away_stats[:points] > away_team_score
          away_team_score += away_stats[:points]
        end
      end
    end
    # binding.pry
    
      if home_team_score > away_team_score
          return game_hash[:home][:team_name]
        else
          return game_hash[:away][:team_name]
      end
  end
end


def player_with_longest_name
  player_name_length = 0 
  
  game_hash.each do |place, team|
    team[:players].each do |player_name|
      if team[:players][:name].length > player_name_length
        binding.pry
        team[:players][:name]
      end
    end
  end
end


    