require 'pry'
def game_hash
   {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black","White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
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
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
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
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
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
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
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

def num_points_scored(playerPoints)
  game_hash.each do |team,team_hash|
    team_hash[:players].each do |player, player_hash|
      if player == playerPoints
        return player_hash[:points]
      end
    end
  end
end

def shoe_size (playerName)
  game_hash.each do |team,team_hash|
    team_hash[:players].each do |player, player_hash|
      if player  == playerName
        return player_hash[:shoe]
      end
    end
  end
end

def team_colors (teamName)
  team_colors = []
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == teamName
      team_hash[:colors].collect do |color|
      team_colors << color
      end
    end
  end
  team_colors
end

def team_names
  game_hash.collect do |team, team_hash|
    team_hash[:team_name]
  end
end

def player_numbers(teamName)
  playerNumbers = []
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == teamName
      team_hash[:players].each {|player,player_hash| playerNumbers << player_hash[:number]}
    end
  end
  playerNumbers
end

def player_stats(playerName)
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player,player_hash|
      if player == playerName
        return player_hash
      end
    end
  end
end

def big_shoe_rebounds
playerShoe = 0
rebounds = 0
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player, player_stats|
      if player_stats[:shoe]>playerShoe
        playerShoe = player_stats[:shoe]
        rebounds = player_stats[:rebounds]
      end
    end
  end
  rebounds
end
