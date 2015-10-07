#Process.daemon
require 'tweetstream'
require 'yaml'
require './common.rb'
require 'thread'

keys = YAML.load_file('./token.yml')

TweetStream.configure do |config|
  config.consumer_key        = keys["consumer_key"]
  config.consumer_secret     = keys["consumer_secret"]
  config.oauth_token         = keys["access_token"]
  config.oauth_token_secret  = keys["access_token_secret"]
  config.auth_method         = :oauth
end

TweetStream::Client.new.userstream do |status|
  if !status.text.index("RT") && status.text.include?("@YOUR_BOT_SCREEN_NAME")
    res = word('res.txt')
    reply("@#{status.user.screen_name} #{res}","#{status.id}")
  end
end
