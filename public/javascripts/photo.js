
function fancy()
{
    $("#gallery").click(function(){
      $.fancybox("http://localhost:3000/cars/audi/photos");
      return false;
    });   
}


