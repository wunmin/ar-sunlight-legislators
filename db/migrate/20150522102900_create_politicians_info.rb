require_relative '../config'

class CreatePoliticiansInfo < ActiveRecord::Migration
  def change
    create_table :politician_infos do |info|
      info.string :name
      info.date :birthdate
      info.string :phone
      info.string :fax
      info.string :website
      info.string :webform
      info.string :gender
      info.string :twitter_id
      info.string :type
      info.string :party
      info.string :state
      info.boolean :active?
      info.datetime :created_at
      info.datetime :updated_at
    end
  end
end
