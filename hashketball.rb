require 'pry'

def game_hash
  hash = {
    :home => {
        :team_name => "Brooklyn Nets",
        :colors => ["Black", "White"],
        :players => [
          {
            :player => "Alan Anderson",
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
            :player => "Reggie Evans",
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
            :player => "Brook Lopez",
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
            :player => "Mason Plumlee",
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          },
          {
            :player => "Jason Terry",
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
          :player => "Jeff Adrien",
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
          :player => "Bismak Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player => "DeSagna Diop",
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
          :player => "Ben Gordon",
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
          :player => "Brendan Haywood",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]
  }
}

end

def num_points_scored(player)
  points = nil
  game_hash.each do |team, stats|
    stat_array = stats[:players]
    stat_array.each do |player_hash|
      if player_hash[:player] == player
        points = player_hash[:points].to_i
      end
    end
  end
  points
end

def shoe_size(shoe)
  size = nil
  game_hash.each do |team, stats|
    stat_array = stats[:players]
    stat_array.each do |player_hash|
      if player_hash[:player] == shoe
        size = player_hash[:shoe].to_i
      end
    end
  end
  size
end

def team_colors(team_name)
  colors = nil
  game_hash.each do |team, stat|
    if stat[:team_name] == team_name
      colors = stat[:colors].flatten
    end
  end
  colors
end

def team_names
  game_hash.collect do |team, stat|
    stat[:team_name]
  end
end

def player_numbers(team_name)
  player_list = []
  game_hash.each do |team, stat|
    if stat[:team_name] == team_name
      stat[:players].each do |player|
        player.each do |key, value|
          if key == :number
            player_list << value.to_i
          end
        end
      end
    end
  end
  player_list
end

def player_stats(player_name)
  player_stats = {}
  game_hash.each do |team, values|
    values[:players].each do |stats|
      if stats[:player] == player_name
        stats.delete(:player)
        player_stats = stats
        end
    end
  end
  player_stats
end

def big_shoe_rebounds
  big_shoes_guy = 0
  rebounds = 0
    game_hash.each do | team, values|
      values[:players].each do | stats |
        if stats[:shoe] > big_shoes_guy
          big_shoes_guy = stats[:shoe]
          rebounds = stats[:rebounds]
        end
      end
    end
  rebounds
end
