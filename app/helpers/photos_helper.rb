module PhotosHelper
  def gallery_photo(photo, options = {})
    content_tag :div do
      link_to (image_tag "rails.png"),  :id =>photo.id, :car_id => params[:car_id],  :method =>:delete , :class => "deliting"
      link_to (image_tag photo.photo.url(:medium)), photo.photo.url(:large) , :class => "gallery"
    end
  end
end
