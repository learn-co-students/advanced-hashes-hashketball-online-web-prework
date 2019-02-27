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
					},
			},
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
					},
			},
		}
	}	
end

def num_points_scored(player_name)
	pl_points = 0
	game_hash.each do |location,team_info|
		team_info[:players].each do |name,stats|
			if name.include?(player_name)
				pl_points += stats[:points]
			else
			  nil
			end
		end
	end
	pl_points
end

def shoe_size(player_name)
	pl_shoe = 0
	game_hash.each do |location,team_info|
		team_info[:players].each do |name,stats|
			if name.include?(player_name)
				pl_shoe += stats[:shoe]
			else
			  nil
			end
		end
	end
	pl_shoe
end

def team_colors(team)
	t_color = ""
	game_hash.each do |location,team_info|
		if team_info[:team_name] == team
		  t_color = team_info[:colors]
		else
		  nil
		end
	end
	t_color
end

def team_names
  name = []
	game_hash.each do |location,team_info|
		name << team_info[:team_name]
	end
	name
end

def player_numbers(team)
	numbers = []
	game_hash.each do |location,team_info|
		if team_info[:team_name] == team
			team_info[:players].each do |name,stat|
				numbers << stat[:number]
			end
		else
			nil
		end
	end
	numbers
end

def player_stats(player)
	all_stats = {}
	game_hash.each do |location,team_info|
		team_info[:players].each do |name,info|
			if name == player
		  	info.each do |stat,value|
					all_stats[stat] = value
				end
			else
				nil
		  end
		end
	end
	all_stats
end

def big_shoe_rebounds
	shoe_sizes = []
	rebounds = 0
	game_hash.each do |location,team_info|
		team_info[:players].each do |name,info|
			shoe_sizes << info[:shoe]
		end
	end
	shoe_sizes.sort!{|x,y| y <=> x}
	game_hash.each do |location,team_info|
		team_info[:players].each do |name,info|
			if shoe_sizes[0] == info[:shoe]
				rebounds += info[:rebounds]
			else
				nil
			end
		end
	end	
	rebounds			
end