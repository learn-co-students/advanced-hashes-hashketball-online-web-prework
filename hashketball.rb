require 'pry'
def good_practices
  game_hash.each do |location, team_data|
    
    binding.pry
    team_data.each do |attribute, data|
      
      binding.pry
 
    
      data.each do |data_item|
          binding.pry
      end
    end
  end
end

def game_hash={ 
  :home=> {
   :team_name => ["Brooklyn,Nets"]
   :colors    =>["Black,WHite"] ,
   :players   =>["{player_name:Alan Anderson,number  :0,Shoe:16,Points:22,Rebounds:12,Assists:12   ,Steals:3,Blocks:1,slamDunks:1 }"       } "[{[player_name:Reggie Evans,number:30,Shoe:14,Points:12,Rebounds:12,Assists:12,Steals:12  ,Blocks:12,slamDunks:7 }]" }"[{[player_name:Brook lopez,number:11,Shoe:17,Points:17,Rebounds:19,Assists:10,Steals:3,Blocks:1,slamDunks:15 }]" }"[{[player_name:Mason Plumlee,number:1,Shoe:19,Points:26,Rebounds:11,Assists:6,Steals:3,Blocks:8,slamDunks:5 }]" } "[{[player_name:Jason Terry,number:31,Shoe:15,Points:19,Rebounds:2,Assists:2,Steals:4,Blocks:11,slamDunks:1"}]
   :away => {
   :team_name =>"Charlotte Hornets",
   :colors =>"Turquoise,Purple" }
   :players => "[{"
     [player_name:Jeff Adrien,number:04,Shoe:18,Points:10,Rebounds:1,Assists:1,Steals:2,Blocks:7,slamDunks:2 }[player_name:Bismack Biyombo,number:0,Shoe:16,Points:12,Rebounds:4,Assists:7,Steals:22,Blocks:15,slamDunks:10 }[player_name:DeSagna Diop,number:2,Shoe:14,Points:24,Rebounds:12,Assists:12,Steals:4,Blocks:5,slamDunks:5 }[player_name:Ben Gordon,number:8,Shoe:15,Points:33,Rebounds:3,Assists:2,Steals:1,Blocks:1,slamDunks:0 }[player_name: Kemba Walker, number:33,Shoe:15,Points:6,Rebounds:12,Assists:12,Steals:7,Blocks:5,slamDunks:12 }]" 
} 

end

def home_team_name
  game_hash[:home][:team_name]
end
 
puts home_team_name








