class Car < ActiveRecord::Base
  validates :title, :presence =>true, :length => { :minimum => 4 } 
  has_many :photos
  
  def to_param
    title
  end

end
