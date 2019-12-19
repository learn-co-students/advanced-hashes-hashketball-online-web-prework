require "yaml"
require "pry"

# lib = YAML.load_file('game_hash.yml')

# pp lib

def game_hash
  lib = YAML.load_file('game_hash.yml')
  binding.pry
end