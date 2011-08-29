class Photo < ActiveRecord::Base
	has_attached_file :photo,
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension",
		  :styles => {:medium =>"120x120>", :large => "600x600>"} 

	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
        belongs_to :car
        belongs_to :user
end
