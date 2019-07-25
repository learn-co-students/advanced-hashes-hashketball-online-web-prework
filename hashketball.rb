expect(game_hash) .to bea(Hash)
expect(game_hash.keys) .to include(keys)
expect(game_hash.values.first.keys) .to include(key)
expect(num_points_scored("Jeff Adrien")) .to eq(10)
expect(shoe_size("Jeff Adrien")) .to eq(18)
expect(team_colors(team_colors("Brooklyn Nets")) .to contain_exactly ("Black", "White")
teams = team_names 
expect(player_numbers("Brooklyn Nets") .sort) .to eq(brooklyn_numbers)
expect(player_stats("Jeff Adrien")) .to eq(jeff_stats)
expect(big_shoe_rebounds) .to eq(11)
expect(most_point_scored) .to eq ("Ben Gordon")
expect(winning_team) .to eq("Brooklyn Nets")
expect(player_with_longest_name) .to eq("Bismack Biyombo")
expect(long_name_steals_)









