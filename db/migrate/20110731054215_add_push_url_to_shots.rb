class AddPushUrlToShots < ActiveRecord::Migration
  def self.up
    add_column :shots, :push_url, :string
  end

  def self.down
    remove_column :shots, :push_url
  end
end
