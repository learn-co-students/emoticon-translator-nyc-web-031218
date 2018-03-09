# require modules here
require "yaml"
require 'pry'
# {"angel"=>["O:)", "☜(⌒▽⌒)☞"],
#  "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
#  "bored"=>[":O", "(ΘεΘ;)"],
#  "confused"=>["%)", "(゜.゜)"],
#  "embarrased"=>[":$", "(#^.^#)"],
#  "fish"=>["><>", ">゜))))彡"],
#  "glasses"=>["8D", "(^0_0^)"],
#  "grinning"=>["=D", "(￣ー￣)"],
#  "happy"=>[":)", "(＾ｖ＾)"],
#  "kiss"=>[":*", "(*^3^)/~☆"],
#  "sad"=>[":'(", "(Ｔ▽Ｔ)"],
#  "surprised"=>[":o", "o_O"],
#  "wink"=>[";)", "(^_-)"]}

# => {"get_meaning"=>{";)"=>"(^_-)"},
#  "get_emoticon"=>{[";)", "(^_-)"]=>"wink"}}

def load_library(path)
  # file=parse_yaml(path)
  library = YAML.load_file(path)
  final= {"get_meaning"=>{}, "get_emoticon"=>{}}
  library.each do |meaning, emoticons|
    # binding.pry
      # binding.pry
      final["get_meaning"][emoticons[1]] = meaning
      final["get_emoticon"][emoticons[0]]= emoticons[1]
      # binding.pry
  end
  final
  # binding.pry
end

# {"get_meaning"=>
#   {"☜(⌒▽⌒)☞"=>"angel",
#    "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry",
#    "(ΘεΘ;)"=>"bored",
#    "(゜.゜)"=>"confused",
#    "(#^.^#)"=>"embarrased",
#    ">゜))))彡"=>"fish",
#    "(^0_0^)"=>"glasses",
#    "(￣ー￣)"=>"grinning",
#    "(＾ｖ＾)"=>"happy",
#    "(*^3^)/~☆"=>"kiss",
#    "(Ｔ▽Ｔ)"=>"sad",
#    "o_O"=>"surprised",
#    "(^_-)"=>"wink"},
#  "get_emoticon"=>
#   {"O:)"=>"☜(⌒▽⌒)☞",
#    ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ",
#    ":O"=>"(ΘεΘ;)",
#    "%)"=>"(゜.゜)",
#    ":$"=>"(#^.^#)",
#    "><>"=>">゜))))彡",
#    "8D"=>"(^0_0^)",
#    "=D"=>"(￣ー￣)",
#    ":)"=>"(＾ｖ＾)",
#    ":*"=>"(*^3^)/~☆",
#    ":'("=>"(Ｔ▽Ｔ)",
#    ":o"=>"o_O",
#    ";)"=>"(^_-)"}}


def get_japanese_emoticon(path, emoticon)
  # binding.pry
  library=load_library(path)
  library.each do |get, data|
    data.each do |k, v|
        # binding.pry
      if k==emoticon
        return v
      end
        
      # binding.pry
    end

    # binding.pry
  end
return "Sorry, that emoticon was not found"
end

def get_english_meaning
  # code goes here
end
