<div id="window">

{foreach $icons as $icon}
  <div class="icon">
    <img src="{$j_themepath . "img/" . $icon['img']}">
    <div class="label">{$icon['name']}</div>
  </div>
{/foreach}




  
    <div class="fenetre-modale hidden">
		  <div class="fenetre-modale-header"> 
		      <div class="fenetre-modale-header-titre">Bienvenue</div>
		      <img class="fenetre-modale-header-icone fenetre-modale-header-icone-close" src={$j_themepath . "img/close.svg"} />
		  </div>
		  <div class="fenetre-modale-contenu">En cours de développement (1).</div>
    </div>
    
     <div class="fenetre-modale hidden">
          <div class="fenetre-modale-header"> 
              <div class="fenetre-modale-header-titre">Bienvenue</div>
              <img class="fenetre-modale-header-icone fenetre-modale-header-icone-close" src={$j_themepath . "img/close.svg"} />
          </div>
          <div class="fenetre-modale-contenu">En cours de développement (2).</div>
    </div>
  

<script type="text/javascript">
{literal}

    jQuery('.fenetre-modale').draggable();
    
    jQuery('body').on('click', '.fenetre-modale-header-icone-close', function() {
        jQuery(this).parents('.fenetre-modale').remove();
    });
    
    jQuery('.icon').dblclick(function() {
        var jTitre = jQuery(this).find('.label').html();
        jQuery('.fenetre-modale-header-titre').html(jTitre);
    });

{/literal}
</script> 

	
</div>