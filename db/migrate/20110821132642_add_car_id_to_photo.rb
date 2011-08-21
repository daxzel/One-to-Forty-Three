class AddCarIdToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :car_id, :integer
  end

  def self.down
    remove_column :photos, :car_id
  end
end
