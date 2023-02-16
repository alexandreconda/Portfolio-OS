<div id="window">

{foreach $icons as $icon}
  <div class="icon">
    <img src="{$j_themepath . "img/" . $icon['img']}">
    <div class="label">{$icon['name']}</div>
  </div>
{/foreach}

<div id=fenetres>
</div>

<script type="text/javascript">
var urlAjaxGet = "{jurl 'core~window:ouvrirFenetre'}"
{literal}

    jQuery('#window').selectable({filter: ".icon"});
    
    jQuery('.icon').dblclick(function() {
        var titre = jQuery(this).children(".label").text();
    
        jQuery.ajax
        (
            urlAjaxGet,
            {
                method: "GET",
                data: {titre: titre},
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

	
</div>