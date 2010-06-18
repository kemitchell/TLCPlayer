ExternalInterface.addCallback('stop', function() { player.stop(); });

ExternalInterface.addCallback('play', function() { player.play(); });

ExternalInterface.addCallback('pause', function() { player.pause(); });

ExternalInterface.addCallback('setVolume', function(v) { if(v >= 0 && v <=1) player.volume = v; });

ExternalInterface.addCallback('getVolume', function() { return player.volume; });

ExternalInterface.addCallback('listCaptions', function() {
	// todo : better way to get object keys as Array?
	var allCaptions:Array = new Array();
	eachCaptioning(function(n, c) {
		allCaptions.push(n);
	});
	return allCaptions;
});

ExternalInterface.addCallback('setCaptioning', function(name) { showCaptions(name); });

ExternalInterface.addCallback('getCaptioning', function() { return activeCaptioning; });