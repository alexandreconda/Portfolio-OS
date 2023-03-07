    <label class="demarrer-bouton">
      <p>DEMARRER</p>
    </label>
    <div class="demarrer">
      <div class="demarrer-header">
        <div class="account-image-wrapper">
          <img src={$j_themepath . "img/" . $icone}>
        </div>
        <h1 class="account-name">- Portfolio OS - <br/> Alexandre Condamine</h1>
      </div>
      <div class="demarrer-body">
        <div class="demarrer-content">
            {$aPropos}
        </div>
      </div>
    </div>
  


<script type="text/javascript">
{literal}
    jQuery(document).click(function(e){
        var jTarget = jQuery(e.target);
        if (jTarget.closest('.demarrer-bouton').length)
        {
            jQuery('.demarrer').toggleClass('active');
        }
        else if(!jTarget.closest('.demarrer').length && jQuery('.demarrer').hasClass('active'))
        {
            jQuery('.demarrer').removeClass('active');
        }
    });
{/literal}
</script>      
