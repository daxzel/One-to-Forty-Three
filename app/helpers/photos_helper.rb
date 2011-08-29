module PhotosHelper
  def gallery(photos)
    result = "%table"
      (photos.length.div(3)).times do |i|
        result += "%tr"
          ([photos.length - i*3,3].min).times do |j|
            result += "%td"
              "%a.gallery{:href => photos[i*3+j].photo.url(:large)}"
                result += image_tag photos[i*3+j].photo.url(:medium)
              
          end
      end
      result
  end
end
