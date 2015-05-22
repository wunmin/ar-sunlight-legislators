require_relative '../config'

class ChangeActiveDataType < ActiveRecord::Migration
  def change
    change_column :politician_infos, :active?, :boolean
    rename_column :politician_infos, :active?, :active
  end
end
