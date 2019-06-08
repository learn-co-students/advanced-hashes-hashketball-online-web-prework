# Write your code here!
require "pry"

def game_hash 
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {
        name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds:12, 
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      {
        name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12, 
        steals: 12, 
        blocks: 12, 
        slam_dunks: 7
      },
      {
        name: "Brook Lopez", 
        number: 11, 
        shoe: 17, 
        points: 17, 
        rebounds: 19, 
        assists: 10, 
        steals: 3, 
        blocks: 1, 
        slam_dunks: 15
      },
      {
        name: "Mason Plumlee", 
        number: 1, 
        shoe: 19, 
        points: 26, 
        rebounds: 12, 
        assists: 6, 
        steals: 3, 
        blocks: 8, 
        slam_dunks: 5
      },
      {
        name: "Jason Terry", 
        number: 31, 
        shoe: 15, 
        points: 19, 
        rebounds: 2, 
        assists: 2, 
        steals: 4, 
        blocks: 11,
        slam_dunks: 1 
      }
      ]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {
        name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1, 
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      {
        name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7, 
        steals: 22,
        blocks: 15, 
        slam_dunks: 10
      },
      {
        name: "DeSagna Diop", 
        number: 2, 
        shoe: 14, 
        points: 24, 
        rebounds: 12, 
        assists: 12, 
        steals: 4, 
        blocks: 5, 
        slam_dunks: 5
      },
      {
        name: "Ben Gordon", 
        number: 8, 
        shoe: 15, 
        points: 33, 
        rebounds: 3, 
        assists: 2, 
        steals: 1, 
        blocks: 1, 
        slam_dunks: 0
      },
      {
        name: "Kemba Walker",
        number: 33, 
        shoe: 15, 
        points: 6, 
        rebounds: 12, 
        assists: 12, 
        steals: 7, 
        blocks: 5,
        slam_dunks: 12 
      }
      ]
  }
}
end

def num_points_scored(player_name)
  game_hash.each do |team, team_hash|
    team_hash.each do |team_characteristic, characteristic_value|
      if team_characteristic == :players 
        characteristic_value.each do |player_hash|
          player_hash.each do |player_characteristic, player_characteristic_value|
            player_points = player_hash[:points]
            if player_characteristic == :name
              if player_characteristic_value == player_name
                return player_points
              end
            end
          end
        end
      end
    end
  end
end
  
  
def shoe_size(player_name)
  game_hash.each do |team, team_hash|
    team_hash.each do |team_characteristic, characteristic_value|
      if team_characteristic == :players 
        characteristic_value.each do |player_hash|
          player_hash.each do |player_characteristic, player_characteristic_value|
            player_points = player_hash[:shoe]
            if player_characteristic == :name
              if player_characteristic_value == player_name
                return player_points
              end
            end
          end
        end
      end
    end
  end
end
  
  
def team_colors(team_name)
  game_hash.each do |team, team_attribute|
    if team_attribute[:team_name] == team_name
      return game_hash[team][:colors]
    end
  end
end
  
  
def team_names
  team_names_array = []
  game_hash.each do |team_location, team_hash|
    team_hash.each do |team_attribute, team_attribute_value|
      if team_attribute == :team_name 
        team_names_array << team_attribute_value
      end
    end
  end
  team_names_array
end
  
  
def player_numbers(team_name)
  player_number_array = []
  game_hash.each do |team_location, team_hash|
    team_hash.each do |team_attribute, team_attribute_value|
      if team_attribute == :players && team_hash[:team_name] == team_name
        team_attribute_value.each do |player_hash|
          player_hash.each do |player_attribute, player_attribute_value|
            if player_attribute == :number
              player_number_array << player_attribute_value
            end
          end
        end
      end
    end
  end
  player_number_array
end


def player_stats(player_name)
  game_hash.each do |team_location, team_hash|
    team_hash.each do |team_attribute, team_attribute_value|
      if team_attribute == :players
        team_attribute_value.each do |player_hash|
          if player_hash[:name] == player_name
            return player_hash
          end
        end
      end
    end
  end
end

  
  
  
  