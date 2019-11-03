          var infowindow;
          var arrMarkers=[];
          var map;
          var listeLogements;

          $(function(){
              initAutocomplete();
          });         

          function initAutocomplete() {
            // Localisation de maps par default
            map = new google.maps.Map(document.getElementById('map'), {
              center: {lat: 55, lng: 10},
              zoom: 3
            });

            // Création de la search box
            var input     = document.getElementById('maps-rechercher');
            var searchBox = new google.maps.places.SearchBox(input);

            // Positionne maps avec la recherche
            searchBox.addListener('places_changed', function() {
              var places = searchBox.getPlaces();

              if (places.length == 0) {
                return;
              }

              // Position
              var bounds = new google.maps.LatLngBounds();
              places.forEach(function(place) {
                if (place.geometry.viewport) {
                  bounds.union(place.geometry.viewport);
                } else {
                  bounds.extend(place.geometry.location);
                }
              });
              map.fitBounds(bounds);
            });

            infowindow = new google.maps.InfoWindow({
                content: " ",
                maxWidth: 350
            });

            google.maps.event.addListener(map, 'click', function(event){
              this.setOptions({scrollwheel:true});
            });

            var scope = this;
            // $.ajax({
            //   url: "data.php?action=logement",
            //   success:function(res){
            //     scope.listeLogements = JSON.parse(res);
            //     codeAddress(map);
            //   },
            //   error:function(){
            //     alert("Erreur lors du chargement des données");
            //   }
            // });          

           google.maps.event.addListener(infowindow, 'domready', function() {

              // Reference to the DIV that wraps the bottom of infowindow
              var iwOuter = $('.gm-style-iw');

              /* Since this div is in a position prior to .gm-div style-iw.
               * We use jQuery and create a iwBackground variable,
               * and took advantage of the existing reference .gm-style-iw for the previous div with .prev().
              */
              var iwBackground = iwOuter.prev();

              // Removes background shadow DIV
              iwBackground.children(':nth-child(2)').css({'display' : 'none'});

              // Removes white background DIV
              iwBackground.children(':nth-child(4)').css({'display' : 'none'});

              // Reference to the div that groups the close button elements.
              var iwCloseBtn = iwOuter.next();

              // Apply the desired effect to the close button
              iwCloseBtn.css({opacity: '1', 
                              right: '70px', 
                              top: '26px', 
                              width: '25px', 
                              height: '24px', 
                              border: '6px solid #ffffff', 'border-radius': '4px', 'box-shadow': '0 0 0px #ffffff',
                              //border: '7px solid #FFF','border-radius': '13px','box-shadow': '0 0 5px #3990B9'
                            });

              // If the content of infowindow not exceed the set maximum height, then the gradient is removed.
              if($('.iw-content').height() < 140){
                $('.iw-bottom-gradient').css({display: 'none'});
              }

              // The API automatically applies 0.7 opacity to the button after the mouseout event. This function reverses this event to the desired value.
              iwCloseBtn.mouseout(function(){
                $(this).css({opacity: '1'});
              });
            });

          }

          function codeAddress(map) {       
            var dirUpload = "upload/";
            var dirImg = "img/";       

            for(var i in listeLogements){

                // var pathUpload = dirUpload + listeLogements[i].id + "/";
                // listeLogements[i].src_img = pathUpload + listeLogements[i].src_img;

                var position = listeLogements[i].position.split(" ");
            
                var myLatLng = {lat: parseFloat(position[0]), lng: parseFloat(position[1])};

                // var pays = dirImg + "pays/"+ listeLogements[i].pays +".svg";

                var icon = dirImg + "flag.png";
                          
                var marker = new google.maps.Marker( {
                    id          : listeLogements[i].id,
                    // location    : listeLogements[i].location,
                    // vente       : listeLogements[i].vente,
                    titre       : listeLogements[i].titre,
                    adresse       : listeLogements[i].adresse,
                    // type        : listeLogements[i].type,
                    // nb_salles   : listeLogements[i].nb_salles,
                    // surface_sej : listeLogements[i].surface_sej,
                    // pays        : listeLogements[i].pays,
                    // pays_src    : pays,
                    // ville       : listeLogements[i].ville,
                    // location    : listeLogements[i].location,
                    // vente       : listeLogements[i].vente,
                    img         : listeLogements[i].src_image,
                    position    : myLatLng,
                    map         : map,
                    icon: icon
                });

                arrMarkers.push(marker);

                google.maps.event.addListener(marker, 'click', function() {

                  // var pluriel_chambre = '';
                  // var pluriel_salles = '';
                  // var prestation = '';

                  // if(this.location == 1 && this.vente == 1){
                  //   prestation = 'Location & Vente';
                  // }else if(this.location == 1 && this.vente == 0){
                  //   prestation = 'Location';
                  // }else if(this.location == 0 && this.vente == 1){
                  //   prestation = 'Vente';
                  // }

                  // if(parseInt(this.nb_salles) > 1){
                  //    pluriel_salles = 's';
                  // }

                  infowindow.setContent('<div id="iw-container">' +
                      '<div class="iw-title">' + this.titre + '</div>' +
                      '<div class="iw-content">' +
                      '<img src="img/logement/'+ this.img.toString() +'" class="imgBienMarker" alt="Image Bien" height="135" width="170">' +
                      '<div class="iw-subTitle">' + this.adresse + '</div>' +
                      // '<p><strong>' + prestation + '</strong></p>'  +
                      // '<p class="icon-pays"> Pays : '+ this.pays + '&nbsp&nbsp<img width="20px" height="20px" src="'+ this.pays_src +'"></p>'  +
                      // '<p> Ville : ' + this.ville + '</p>'  +
                      // '<p> Superficie : ' + this.surface_sej + ' mÂ²</p>'  +
                      // '<p>' + this.nb_salles + ' piÃ¨ce' + pluriel_salles + '</p>'  +
                      '<a id="btnVoir" href="description.php?logement='+ this.id.toString() +'" class="bloc-bouton" target="_blank">Voir le bien</a>' +
                      '</div>' +
                      '</div>');

                      infowindow.setw;
                      infowindow.open(map, this);
                   });

            }

          }  

          function initMarkers(){
            for(i=0;i<arrMarkers.length;i++){
                arrMarkers[i].setMap(map);
             }             
          }

          function removeMarkers(type){
            if(type != 'tous'){
               var i;
               for(i=0;i<arrMarkers.length;i++){
                  if(type == 'location'){ // voir les locations = supprimer les markers de vente
                    if(arrMarkers[i]['location'] == 0){
                      arrMarkers[i].setMap(null);
                    }  
                  }                  
                  if(type == 'vente'){ // voir les ventes = supprimer les marker de location
                    if(arrMarkers[i]['vente'] == 0){
                      arrMarkers[i].setMap(null);
                    }  
                  }
               }            
            }              
          }