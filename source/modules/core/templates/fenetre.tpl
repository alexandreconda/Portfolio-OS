<div class="fenetre">
          <div class="fenetre-header"> 
              <div class="fenetre-header-titre">{$titre}</div>
              <img class="fenetre-header-icone fenetre-header-icone-close" src={$j_themepath . "img/close.svg"} />
          </div>
          <div class="fenetre-contenu">
            Ca marche !
          </div>

<script type="text/javascript">
{literal}

    jQuery('.fenetre').draggable();
    
    jQuery('.fenetre').on('click', '.fenetre-header-icone-close', function() {
        jQuery(this).parents('.fenetre').remove();
    });

{/literal}
</script>      

</div>