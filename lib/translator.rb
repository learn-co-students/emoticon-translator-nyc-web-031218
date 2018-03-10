# require modules here
require "yaml"
require "pry"
#path = "./lib/emoticons.yml"

def load_library(path)
  hash = YAML.load_file("./lib/emoticons.yml")
  new_hash = {}

  hash.each do |meaning, array|
    if !new_hash.include?("get_emoticon")
      new_hash["get_emoticon"] = {array[0] => array[1]}
    else
      new_hash["get_emoticon"].merge!({array[0] => array[1]})
    end
  end
  hash.each do |meaning, array|
    if !new_hash.include?("get_meaning")
      new_hash["get_meaning"] = {array[1] => meaning}
    else
      new_hash["get_meaning"].merge!({array[1] => meaning})
    end
  end

  new_hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  meaning = ""

  hash.each do |emoticon_or_meaning, hash_of_emoticons|
    if hash_of_emoticons.keys.include?(emoticon)
      meaning = hash_of_emoticons[emoticon]
      return meaning
    else
      return "Sorry, that emoticon was not found"
    end
  end

end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  meaning = ""

  if hash["get_meaning"].keys.include?(emoticon)
    meaning = hash["get_meaning"][emoticon]
    return meaning
  else
    return "Sorry, that emoticon was not found"
  end

end
