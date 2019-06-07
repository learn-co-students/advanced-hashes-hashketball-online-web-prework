require 'pry'

def game_hash
{
    :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => { "Alan Anderson" => {

      :number => 0,
      :shoe => 16,
      :points=> 22,
      :rebounds => 12,
      :assists  => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1

  },

  "Reggie Evans" => {

    :number => 30,
    :shoe => 14,
    :points=> 12,
    :rebounds => 12,
    :assists  => 12,
    :steals => 12,
    :blocks => 12,
    :slam_dunks => 7

  },

  "Brook Lopez" => {

    :number => 11,
    :shoe => 17,
    :points=> 17,
    :rebounds => 19,
    :assists  => 10,
    :steals => 3,
    :blocks => 1,
    :slam_dunks => 15

  },

  "Mason Plumlee" => {

    :number => 1,
    :shoe => 19,
    :points=> 26,
    :rebounds => 12,
    :assists  => 6,
    :steals => 3,
    :blocks => 8,
    :slam_dunks => 5

  },

  "Jason Terry" => {

    :number => 31,
    :shoe => 15,
    :points=> 19,
    :rebounds => 2,
    :assists  => 2,
    :steals => 4,
    :blocks => 11,
    :slam_dunks => 1

  }

  }

  },


  :away =>
    {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players =>  {"Jeff Adrien" => {

        :number => 4,
        :shoe => 18,
        :points=> 10,
        :rebounds => 1,
        :assists  => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2

    },

    "Bismak Biyombo" => {

      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists  => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10

    },


    "DeSagna Diop" => {

      :number => 2,
      :shoe => 14,
      :points=> 24,
      :rebounds => 12,
      :assists  => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5

    },

    "Ben Gordon" => {

      :number => 8,
      :shoe => 15,
      :points=> 33,
      :rebounds => 3,
      :assists  => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0

    },

    "Brendan Haywood" => {

      :number => 33,
      :shoe => 15,
      :points=> 6,
      :rebounds => 12,
      :assists  => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
  }

      }
  }

  }

end

def num_points_scored(name)

  points_scored = 0

  game_hash.each do |location, team_info|

    team_info.each do |attribute, data|


      if attribute == :players


        data.each do |player, player_stats|


          if player == name

          points_scored = player_stats[:points]

                end

        end
      end
    end
  end
points_scored
end


def shoe_size(name)

  shoe_size = 0

  game_hash.each do |location, team_info|

    team_info.each do |attribute, data|


      if attribute == :players


        data.each do |player, player_stats|


          if player == name

          shoe_size = player_stats[:shoe]

        end

        end
      end
    end
  end
shoe_size
end

def team_colors(name)

  team_colors = []
  game_hash.each do |location, team_info|

    if name == team_info[:team_name]
      team_info[:colors].each do |color|
          team_colors << color

        end

      end
  end
team_colors
end

def team_names
  team_names = []
  game_hash.each do |location, team_info|

    team_names << team_info[:team_name]

  end
team_names
end

def player_numbers(name)

    player_numbers = []

    game_hash.each do |location, team_info|

        if name == team_info[:team_name]

          team_info.each do |attribute, data|

        if attribute == :players

          data.each do |player, player_stats|

            player_numbers << player_stats[:number]

          end

          end
        end
      end
    end
  player_numbers
  end

def player_stats(name)

    player_staistics = {}

    game_hash.each do |location, team_info|

      team_info.each do |attribute, data|


        if attribute == :players


          data.each do |player, player_stats|


            if player == name

            player_staistics = player_stats

          end

          end
        end
      end
    end
player_staistics
  end

  def num_rebounds(name)

    rebound_number = 0

    game_hash.each do |location, team_info|

      team_info.each do |attribute, data|


        if attribute == :players


          data.each do |player, player_stats|


            if player == name

            rebound_number = player_stats[:rebounds]

                  end

          end
        end
      end
    end
  rebound_number
  end






def big_shoe_rebounds

    shoe_size = {}
    new_hash = {}

    game_hash.each do |location, team_info|

      team_info.each do |attribute, data|
        #binding.pry

        if attribute == :players


          data.each do |player, player_stats|
            #binding.pry

            name = player
            shoe = player_stats[:shoe]
            shoe_size.store(name, shoe)
            #new_hash creates a hash sorttd by shoe size (largest first) with a key of player' name
            new_hash = shoe_size.sort_by {|name, shoe| shoe}.reverse
            #binding.pry
            end

          end
        end
      end
first_value = new_hash[0].to_a
player_with_largest_foot = first_value[0]
num_rebounds(player_with_largest_foot)
  #binding.pry
  end
