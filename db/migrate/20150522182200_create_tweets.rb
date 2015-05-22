class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |tweet|
      tweet.string :text
      tweet.integer :politician_id
      tweet.datetime :created_at
      tweet.datetime :updated_at
    end
  end
end
