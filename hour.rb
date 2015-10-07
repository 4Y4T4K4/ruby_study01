require('./common.rb')

loop{
  text = word('hour.txt')
  tweet(text)
  sleep(3600)
}
