require_relative '../config'

class ChangeActiveType < ActiveRecord::Migration
  def change
    change_column :politician_infos, :active?, :integer
  end
end
