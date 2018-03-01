require "yaml"
require "pry"
# require modules here

def load_library(file_name)
  # code goes here
  file = YAML.load_file(file_name)

  result = {}
  result["get_meaning"] = {}
  result["get_emoticon"] = {}

  file.each{ |english, emoticon|
    result["get_meaning"][emoticon[1]] = english
  }

  file.each{ |english, emoticon|
    result["get_emoticon"][emoticon[0]] = emoticon[1]
  }

  #binding.pry
  return result


end

#file = load_library("./lib/emoticons.yml")




def get_japanese_emoticon(file_path, emoticon)
  # code goes here

  reference = load_library(file_path)

  puts reference["get_emoticon"][emoticon]
  #binding.pry
  return reference["get_emoticon"][emoticon] || "Sorry, that emoticon was not found"

end

#get_japanese_emoticon("./lib/emoticons.yml", "=D")






def get_english_meaning(file_path, emoticon)
  # code goes here
  reference = load_library(file_path)
  return reference["get_meaning"][emoticon] || "Sorry, that emoticon was not found"

end

get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")
