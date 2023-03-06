<div id="taskbar">
	{$DEMARRER}
	<div id="system-tray">
		<p id="heure"></p>
	</div>
</div>

<script type="text/javascript">
{literal}

    // MAJ de l'heure
    function updateClock() {
        var now = new Date();
        jQuery('#heure').text(now.toLocaleTimeString([], {hour: '2-digit', minute:'2-digit'}));
    }
    var oneMinute = 1000 * 60;
    var now = new Date();
    var timeUntilMinuteTick = 
        oneMinute - 
        (now.getSeconds() * 1000 + now.getMilliseconds());
    setTimeout(function(){
      updateClock();
      setInterval(updateClock, oneMinute);
    }, timeUntilMinuteTick);
    updateClock();

{/literal}
</script>      
