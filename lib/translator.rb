require "yaml"
require "pry"

# #load_library
#   accepts one argument, the file path
#   return value
#     returns a hash
#     has two keys, 'get_meaning' and 'get_emoticon'
#     the keys 'get_meaning' and 'get_emoticon' point to inner hashes
#     the keys inside the 'get_meaning' hash are the Japanese emoticons
#     the emoticon keys inside the 'get_meaning' hash point to their meanings
#     the keys inside the 'get_emoticon' hash are the English emoticons
#     the emoticon keys inside the 'get_emoticon' hash point to their Japanese equivalents

def load_library(path)
  emoticons = YAML.load_file(path)
  new_hash = {}
  new_hash["get_meaning"] = {}
  new_hash["get_emoticon"] = {}
  emoticons.each do |meaning, emoticon_array|
    new_hash["get_meaning"][emoticon_array[1]] = meaning
    new_hash["get_emoticon"][emoticon_array[0]] = emoticon_array[1]
  end
  # binding.pry
  new_hash
end

def get_japanese_emoticon(path, emoticon)
  data_hash = load_library(path)
  if data_hash["get_emoticon"][emoticon].nil?
    "Sorry, that emoticon was not found"
  else
    data_hash["get_emoticon"][emoticon]
  end
end

def get_english_meaning(path, emoticon)
  data_hash = load_library(path)
  if data_hash["get_meaning"][emoticon].nil?
    "Sorry, that emoticon was not found"
  else
    data_hash["get_meaning"][emoticon]
  end
end
