require 'twitter'
require 'voice_text_api'
def make_wav(str)
    vt = VoiceTextAPI.new(your voice text api) 

    wav = vt.tts(str, :takeru, { :emotion => 'happiness' })

    # wavファイルを保存
    filename = "koishi.wav"
    File.open(filename, "wb") do |f|
        f.write(wav)
    end
end
client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "XXXXXXXXXXXXXXXXXXXXXX"
  config.consumer_secret = "XXXXXXXXXXXXXXXXXXXXXX"
  config.access_token    = "XXXXXXXXXXXXXXXXXXXXXX"
  config.access_token_secret = "XXXXXXXXXXXXXXXXXXXXXX"
end
now_tweet = ""
tweet = ""
cnt = 0
account_name = "@koishihshs" 
loop do
    client.search("from:" + account_name, :count => 1, :exclude => "retweets").map do |block|
        puts block.text
        now_tweet = block.text
        tweet = block.text if cnt == 0
        break
    end 
    if now_tweet != tweet or cnt == 0 then
        make_wav(now_tweet)
        system("node main.js")
        tweet = now_tweet
    end
    cnt += 1
    sleep(10)
end