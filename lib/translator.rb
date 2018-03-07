# require modules here
require "yaml"
require 'pry'

def load_library(str = "./lib/emoticons.yml")
  # code goes here
  hash = YAML.load_file("lib/emoticons.yml")
  japaneseEmoticon = {}
  englishEmoticon = {}

  hash.each do |key, arr|
    japaneseEmoticon[arr[1]] = key
    englishEmoticon[arr[0]] = arr[1]
  end

  ans = {
  "get_meaning" => japaneseEmoticon,
  "get_emoticon" => englishEmoticon
  }

  return ans

end

def get_japanese_emoticon(string = "./lib/emoticons.yml", emoticon)
  # code goes here
  hash = load_library(string)
  if hash["get_emoticon"][emoticon] != nil
    return hash["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(string = "./lib/emoticons.yml", emoticon)
  # code goes here
  hash = load_library(string)
  if hash["get_meaning"][emoticon] != nil
    return hash["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
