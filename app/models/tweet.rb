class Tweets < ActiveRecord::Base
  validates :text, presence: true, uniqueness: true

  def save_tweets(twitter_id)
    require_relative "../app.rb"

    client = Twitter::REST::Client.new do |config|
    config.consumer_key    = "5dObfy1pEi97hjLpyEdYIX0ck"
    config.consumer_secret = "JbUMd8IlFW9J3bzINzqkXSsp5QsaF17Mx4D9WwuTEvmSZkJRfa"
    end

    client.user_timeline("gem")
    tweets = client.user_timeline(screen_name: "WongYouJing1", count: 10)

    tweets.each do |t|
      tweet_object = Tweets.create(text: t.text, politician_id: twitter_id)
    end

    t = Tweets.create(
          text: "",
          politician_id: ,
         )
  end
end