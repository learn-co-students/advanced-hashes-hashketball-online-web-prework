require "pry"

def game_hash
    {
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
                    :slam_dunks => 1,
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
                    :slam_dunks => 7,
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
                    :slam_dunks => 15,
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
                    :slam_dunks => 5,
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
                    :slam_dunks => 1,
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
                    :slam_dunks => 2,
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
                    :slam_dunks => 10,
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
                    :slam_dunks => 5,
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
                    :slam_dunks => 0,
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
                    :slam_dunks => 12,
                }
            ]
        }
    }
end

def num_points_scored(player_name)
    game_hash.each do |location, team_data|
        team_data[:players].each do |player|
            if player_name == player[:name]
                return player[:points]
            end
        end
    end
end

def shoe_size(player_name)
    game_hash.each do |location, team_data|
        team_data[:players].each do |player|
            if player_name == player[:name]
                return player[:shoe]
            end
        end
    end
end

def team_colors(team_name)
    game_hash.each do |location, team_data|
        if team_name == team_data[:team_name]
            return team_data[:colors]
        end
    end
end

def team_names
    [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
    player_numbers = []
    game_hash.each do |location, team_data|

        if team_name == team_data[:team_name]

            team_data[:players].each do |player|
                player_numbers << player[:number]
            end
        end
    end

    player_numbers

end

def player_stats(player_name)

    game_hash.each do |location, team_data|
        team_data[:players].each do |player|
            if player_name == player[:name]
                player.delete(:name)
                return player
            end
        end
    end
end

def big_shoe_rebounds
    largest_shoe = nil
    number_of_rebounds = nil

    game_hash.each do |location, team_data|
        team_data[:players].each do |player|
            if largest_shoe == nil || player[:shoe] > largest_shoe
                largest_shoe = player[:shoe]
                number_of_rebounds = player [:rebounds]
            end
        end
    end
    return number_of_rebounds
end




# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#     team_data.each do |attribute, data|
#       #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#       binding.pry
#
#       #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
#       data.each do |data_item|
#           binding.pry
#       end
#     end
#   end
# end
#
# good_practices
