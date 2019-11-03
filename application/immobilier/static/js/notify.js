function Notify(type,description){

  // Position.
  // Repositionne chaque structure de notification affiché
  // pour pouvoir ajouter la nouvelle notification.
  var top = 90;
  $('.notification').each(function(){
      top = top + 100;
      $(this).css("top",top+"px");
  });

  // Icone.
  // En fonction du type.
  var icone = null;
  switch(type){
    case 'success' :
      icone = "<i class='lnr lnr-checkmark-circle'></i>";
    break;      
    case 'info' :
      icone = "<i class='lnr lnr-checkmark-circle'></i>";
    break;          
    case 'warning' :
      icone = "<i class='lnr lnr-warning'></i>";
    break;    
    case 'danger' :
      icone = "<i class='lnr lnr-cross-circle'></i>";
    break;    

    case 'danger' :
      icone = "<i class='lnr lnr-cross-circle'></i>";
    break;

    default: // Par securité default = affiche une icone de danger.
      icone = "<i class='lnr lnr-cross-circle'></i>";
    break;
  }

  // Structure HTML.
  $("\
    <div class='notification animated slideInRight'>\
      <div class='card text-white bg-"+type+" mb-3'>\
          <div class='card-body'>\
            <div class='row'>\
              <div class='col-md-2'>\
                "+icone+"\
              </div>\
              <div class='col-md-10 bloc-text'>\
                <p class='card-text'>"+description+"</p>\
              </div>\
            </div>\
        </div>\
      </div>\
    </div>\
  " ).prependTo("body").delay(3000).queue(function(){ // Apres le FadeIn (slideInRight) de la structure.
       $(this).removeClass("slideInRight").dequeue();
       $(this).addClass("fadeOutRight").dequeue(); // FadeOut (fadeOutRight) de la structure.
       var elem = $(this);
       setTimeout(function(){ // Supprime la structure html du DOM.
          elem.remove();
      }, 2000).dequeue();
      });
}