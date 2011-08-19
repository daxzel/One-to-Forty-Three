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
end
