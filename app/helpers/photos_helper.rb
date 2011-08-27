module PhotosHelper
	def gallery(photos)
		photos.each do |image|
			image_tag image.url(:medium)
		end
		#if photos.count>=9
		#	x = 3
		#	y = 3
		#end
		#for i in 0..x 
		#	photos
		#end
        end 
end
