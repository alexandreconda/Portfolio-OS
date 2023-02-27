<div class="fichiers">
{foreach $fichiers as $fichier}
  <div class="fichier" data-id={$fichier['id']}>
    <img src="{$j_themepath . "img/" . $fichier['img']}">
    <div class="label">{$fichier['nom']}</div>
  </div>
{/foreach}
</div>

<script type="text/javascript">
var urlAjaxGet = "{jurl 'core~fenetre:ouvrirFenetre'}"
{literal}

    jQuery('#window').selectable({filter: ".fichier"});
    
    // On s'assure que l'ouverture de fenêtre à l'ouverture ne soit liée qu'une fois
    jQuery('.fichier').off("dblclick.ouvrir_fenetre").on("dblclick.ouvrir_fenetre", function() {
        var id_fichier = jQuery(this).attr('data-id');
    
        jQuery.ajax
        (
            urlAjaxGet,
            {
                method: "GET",
                data: {id_fichier: id_fichier},
                complete: function(jqXHR, textStatus) 
                {
                    jQuery("#fenetres").append(jqXHR.responseText);
                }
            }
        );
    
        
//         var jTitre = jQuery(this).find('.label').html();
//         jQuery('.fenetre-header-titre').html(jTitre);
    });

{/literal}
</script> 