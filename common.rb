require 'yaml'
require 'twitter'

def tweet(text)
  #トークンとかコンシューマキーを読み込む
  keys = YAML.load_file('./token.yml')
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = keys["consumer_key"]
    config.consumer_secret     = keys["consumer_secret"]
    config.access_token        = keys["access_token"]
    config.access_token_secret = keys["access_token_secret"]
  end
  begin
    client.update(text)
  rescue => ex
    #p ex
    #logファイルか何かに出したい
  end
end

def reply(text,id = nil)
  #トークンとかコンシューマキーを読み込む
  keys = YAML.load_file('./token.yml')
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = keys["consumer_key"]
    config.consumer_secret     = keys["consumer_secret"]
    config.access_token        = keys["access_token"]
    config.access_token_secret = keys["access_token_secret"]
  end
  begin
    client.update(text, :in_reply_to_status_id => id)
  rescue => ex
    #p ex
    #log
  end
end

def word(file)
  result = []
  path = './word/' + file
  File.open(path) do |file|
    file.read.split("\n").each do |word|
      result.push(word)
    end
  end
  return result[rand(result.length)]
end
