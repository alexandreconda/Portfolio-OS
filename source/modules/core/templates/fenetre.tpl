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

    if (jFenetrePrecedente.length !== 0)
    {
        jFenetreCourante.offset({left: jFenetrePrecedente.offset().left +30, top: jFenetrePrecedente.offset().top +30});
    }

    jFenetreCourante.draggable();
    
    jFenetreCourante.on('click', '.fenetre-header-icone-close', function() {
        jQuery(this).parents('.fenetre').remove();
    });

{/literal}
</script>