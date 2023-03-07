<audio id="startup_audio" src={$j_themepath . "snd/startup.mp3"}></audio>

<div id = "screen">
{$WINDOW}
{$TASKBAR}
</div>


<script type="text/javascript">
{literal}
var audio = jQuery('#startup_audio')[0]
jQuery('#screen').click(function() {
    audio.play();
});

audio.addEventListener('ended', function(){
        audio.muted = true;
});


{/literal}
</script>   
