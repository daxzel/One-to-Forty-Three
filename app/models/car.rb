class Car < ActiveRecord::Base
  validates :title, :presence =>true, :length => { :minimum => 4 } 
  has_many :photos
  has_and_belongs_to_many :users
 
  def to_param
    title
  end

end
