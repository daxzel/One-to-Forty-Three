class AddUsersCarsJoinTable < ActiveRecord::Migration
 def self.up
    create_table :cars_users, :id => false do |t|
      t.integer :car_id
      t.integer :user_id
    end
  end
 
  def self.down
    drop_table :cars_users
  end
  
end
