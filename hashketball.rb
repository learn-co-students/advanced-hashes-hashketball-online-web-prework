# Write your code here!
#flatiron_school = {:instructor => "Isaac Newton"}
#flatiron_school = {instructor: "Isaac Newton"}

require "pry"

def game_hash
hash = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
       "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks =>1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
       :number => 30,
       :shoe => 14,
       :points => 12,
       :rebounds => 12,
       :assists => 12,
       :steals => 12,
       :blocks =>12,
       :slam_dunks => 7
     },
     "Brook Lopez" => {
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks =>1,
      :slam_dunks => 15
     },
     "Mason Plumlee" => {
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks =>8,
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
  :away =>{
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
        :blocks =>7,
        :slam_dunks => 2
      },
      "Bismack Biyombo" => {
       :number => 0,
       :shoe => 16,
       :points => 12,
       :rebounds => 4,
       :assists => 7,
       :steals => 7,
       :blocks =>15,
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
hash
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    # binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

# good_practices

def num_points_scored(name)
	point = 0
	game_hash.each do |location, team_data|
			team_data.each do |attribute, data|
					if attribute == :players
							data.each do |player, stat|
								if player == name
									stat.each do |item,value|
										if item == :points
											point = value
										end
									end
								end
						 end
					end
			end
	end
	point
end

def shoe_size(name)
size = 0
	game_hash.each do |location, team_data|
			team_data.each do |attribute, data|
					if attribute == :players
							data.each do |player, stat|
								if player == name
									stat.each do |item,value|
										if item == :shoe
											# puts "#{item} : #{value}"
											size = value
										  # puts "#{size}"
										end
									end
								end
						 end
					end
			end
	end
	size
end

def team_colors(name)
	color =[]
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :team_name
					# puts "#{attribute}: #{data}"
					if name == data
						# puts "#{name}"
					  color = game_hash[location][:colors]
					end
			end
		end
	end
	color
end

def team_names
	name_arr = []
	game_hash.each do |location, team_data|
		team_data.each do |attribute, data|
			if attribute == :team_name
				name_arr << data
			end
		end
	end
	name_arr
end

def player_numbers(name)
number = []
	game_hash.each do |location, team_data|
			team_data.each do |attribute, data|
				if attribute == :team_name
					if name == data # check team name
						# puts "#{name} == #{data}"
						game_hash[location][:players].each do |player,stat|
							puts "#{player}: #{stat}"
							stat.each do |sta, val|
								if sta == :number
									# puts "#{sta}: #{val}"
									number  << val
								end
							end
						end
					end
				end
			end
	end
	# puts "#{number}"
	number
end

def player_stats(name)
  stats ={}
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
          if attribute == :players
              data.each do |player, stat|
                if player == name
                  stats = game_hash[location][:players][player]
                  # binding.pry
                end
             end
          end
      end
  end
  stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebound = 0
  game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
          if attribute == :players
              data.each do |player, stat|
                # if player == name
                stat.each do |sta,val|
                  if sta == :shoe
                    shoe_size < val
                    shoe_size = val
                    rebound = game_hash[location][:players][player][:rebounds]
                  end
                end
             end
          end
      end
  end
  rebound
  # binding.pry
end
