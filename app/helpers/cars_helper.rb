module CarsHelper
  def info_view_car(count_cars,count_all_cars) 
    result = t("articles_in_auto_wiki")
    result += " ( "
    result += count_cars
    result +=" "+t("of")+" "
    result +=count_all_cars
    if count_cars>count_all_cars
      result+=link_to t("all"), cars_path
    end
    result += " ) "
    result 
  end

  def car_photo(car)
    photos = car.photos
    if photos.length > 0 
      photo = photos.offset(rand(car.photos.count)).first 
      image_tag photo.photo.url(:medium)    
    else
      image_tag "rails.png" 
    end
  end

  def subscribe_car(car)
    if current_user
      if current_user.cars.include?(car)
        link_to "[-]", unscribe_user_car_path(car), :method => :post
      else
        link_to "[+]", subscribe_user_car_path(car), :method => :post  
      end
    end
  end
end
