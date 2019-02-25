require 'pry'
# Write your code here!

#example - 
# contacts = {
  #   "Jon Snow" => {
  #     name: "Jon",
  #     email: "jon_snow@thewall.we", 
  #     favorite_ice_cream_flavors: ["chocolate", "vanilla"]
  #   },
  #   "Freddy Mercury" => {
  #     name: "Freddy",
  #     email: "freddy@mercury.com",
  #     favorite_ice_cream_flavors: ["strawberry", "cookie dough", "mint chip"]
  #   }
  # }
  
#def remove_strawberry(contacts)
#  contacts.each do |person, person_details_hash|
#    person_details_hash.each do |attribute, data|
#      if attribute == :favorite_ice_cream_flavors
#        #binding.pry
#        data.delete_if {|ice_cream| ice_cream=="strawberry"}
#      end 
#    end 
#  end 
#end

#question 1 
def game_hash
  game_hash = {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
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
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
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
  #binding.pry 
  game_hash
end 

#question 2 
def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players  
        attr_data.each do |player_name, player_data|
          #binding.pry 
          if player_name == player 
            return player_data[:points]
          end 
        end
      end 
    end 
  end 
end 

#question 3 
def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players  
        attr_data.each do |player_name, player_data|
          #binding.pry 
          if player_name == player 
            return player_data[:shoe]
          end 
        end
      end 
    end 
  end
end 

#question 4 
def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute==:team_name && attr_data==team_name
        return team_data[:colors]
      end 
    end 
  end 
end 

#question 5 
def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute==:team_name
        team_names.push(team_data[:team_name])
      end 
    end 
  end 
  team_names
end 

#question 6 
def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, attr_data|
        if attribute == :players  
          attr_data.each do |player_name, player_data|
          #binding.pry 
            numbers.push(player_data[:number])
          end
        end 
      end 
    end
  end 
  numbers
end 

#question 7 
def player_stats(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players  
        attr_data.each do |player_name, player_data|
          if player_name == player
            #binding.pry 
            return player_data
          end 
        end
      end 
    end 
  end
end 

#question 8 
def big_shoe_rebounds
  shoe_numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players  
        attr_data.each do |player_name, player_data|
          #binding.pry 
          shoe_numbers.push(player_data[:shoe])
        end
      end 
    end 
  end
  max_shoe_number = shoe_numbers.sort[shoe_numbers.length-1]
  #max_shoe_number is 19
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players  
        attr_data.each do |player_name, player_data|
          #binding.pry 
          if player_data[:shoe] == max_shoe_number
            return player_data[:rebounds]
          end 
        end
      end 
    end 
  end
end 

#question 9 - bonus 
def most_points_scored 
  points_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players  
        attr_data.each do |player_name, player_data|
          #binding.pry 
          points_array.push(player_data[:points])
        end
      end 
    end 
  end
  max_points_scored = points_array.sort[points_array.length-1]
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players  
        attr_data.each do |player_name, player_data|
          if player_data[:points] == max_points_scored
            return player_name
          end 
        end
      end 
    end 
  end
end 

#question 10
def winning_team 
  brooklyn_nets = []
  charlotte_hornets = []
  total_brooklyn_nets = 0 
  total_charlotte_hornets = 0
  
  game_hash.each do |location, team_data|
    if location == :home
      team_data.each do |attribute, attr_data|
        if attribute == :players  
          attr_data.each do |player_name, player_data|
            brooklyn_nets.push(player_data[:points])
          end
        end
      end
    end
  end

  game_hash.each do |location, team_data|
    if location == :away
      team_data.each do |attribute, attr_data|
        if attribute == :players  
          attr_data.each do |player_name, player_data|
            charlotte_hornets.push(player_data[:points])
          end
        end
      end
    end
  end
  total_Brooklyn_nets = brooklyn_nets.reduce {|acc, x| acc+x}
  total_charlotte_hornets = charlotte_hornets.reduce {|acc, x| acc+x}
  
  return total_Brooklyn_nets > total_charlotte_hornets ? "Brooklyn Nets" : "Charlotte Hornets"
end 

#question 11
def player_with_longest_name
  player_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, attr_data|
      if attribute == :players  
        attr_data.each do |player_name, player_data|
          player_names.push(player_name) 
        end 
      end 
    end 
  end 
  #return player_names
  player_names.sort do |a, b|
    a.length <=> b.length
  end
  player_names[player_names.length - 1]
end 












