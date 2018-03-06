require 'yaml'
require 'pry'

def load_library (path)
  library = YAML.load_file(path)
  emoticon_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  library.each do |meaning, value|
    americon = value[0]
    japicon = value[1]
    emoticon_hash["get_meaning"][japicon] = meaning
    emoticon_hash["get_emoticon"][americon] = japicon
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  dictionary = load_library(path)
  if dictionary["get_emoticon"].include?(emoticon)
    dictionary["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  # code goes here
  dictionary = load_library(path)
  if dictionary["get_meaning"].include?(emoticon)
    dictionary["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end
