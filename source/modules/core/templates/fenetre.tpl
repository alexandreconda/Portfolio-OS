<div class="fenetre">
          <div class="fenetre-header"> 
              <img class="fenetre-header-icone fenetre-header-icone-fichier" src={$j_themepath . "img/" . $icone} />
              <div class="fenetre-header-titre">{$titre}</div>
              <img class="fenetre-header-icone fenetre-header-icone-close" src={$j_themepath . "img/close.svg"} />
          </div>
          <div class="fenetre-contenu">
            {$contenu}
          </div>
 </div>

<script type="text/javascript">
{literal}
    var jFenetreCourante = jQuery('.fenetre').eq(-1);
    var jFenetrePrecedente = jQuery('.fenetre').eq(-2);
    var jContainer = jQuery("#window");

    // On positionne le fenêtre courant par rapport à la dernière fenêtre ouverte, tant qu'on ne dépasse pas de l'écran
    if (jFenetrePrecedente.length !== 0)
    {
        if (jFenetrePrecedente.offset().left + jFenetreCourante.width() < jContainer.width() - 40)
        {
            jFenetreCourante.offset({left: jFenetrePrecedente.offset().left +30, top: jFenetreCourante.offset().top});
        }
        
        if (jFenetrePrecedente.offset().top + jFenetreCourante.height() < jContainer.height() - 40)
        {
            jFenetreCourante.offset({left: jFenetreCourante.offset().left, top: jFenetrePrecedente.offset().top +30});
        }
    }
    
    // Si le fichier possède un contenu volumineux, on met la fenêtre en plein écran
    if (jFenetreCourante.height() > jContainer.height() * 0.8)
    {
        jFenetreCourante.width(jContainer.width());
        jFenetreCourante.height(jContainer.height());
        jFenetreCourante.offset({left: jContainer.offset().left, top: jContainer.offset().top});
    }

    // On fait passer la fenêtre active au premier plan
    var fenetres = jQuery(".fenetre");
    fenetres.off("mousedown.fenetreActive").on("mousedown.fenetreActive", function(e) {
        var fenetreActive = jQuery(this), // La fenêtre sur laquelle on vient de cliquer
            max = 0;

        // Trouver le plus grand z-index
        fenetres.each(function() {
            // Trouver le z-index courant
            var z = parseInt( jQuery( this ).css( "z-index" ), 10 );
            // Garder la plus grande valeur entre la valeur courante et le max
            max = Math.max( max, z );
        });

        // Mettre le z-index de la fenêtre courante au z-index max + 1
        fenetreActive.css("z-index", max + 1 );
    });
    
    jFenetreCourante.on('click', '.fenetre-header-icone-close', function() {
        jQuery(this).parents('.fenetre').remove();
    });
    jFenetreCourante.trigger("mousedown.fenetreActive");

    jFenetreCourante.draggable({containment: "#window", cancel: ".fenetre-contenu"});

{/literal}
</script>