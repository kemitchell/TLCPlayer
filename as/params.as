var params = LoaderInfo(this.root.loaderInfo).parameters;

player.skin = (params['skin']) ? params['skin'] : null ; 

if(params['autoplay']) {
	player.autoPlay = true;
	player.playWhenEnoughDownloaded();
}

// todo : show error if no video specified or not found
if (params['video']) {
	player.source = params['video']; 
}

for (var key:String in params) {
	if (key.match(/captions-(.+)/)) {
		try {			
			var captionName = key.substring(9);
			var captioning = new FLVPlaybackCaptioning();
			addChild(captioning);
			captioning.source = params[key];
			captioning.autoLayout = false;
			captioning.captionTarget = captionBox;
			captioning.simpleFormatting = true;
			captions[captionName] = captioning;
			captioning.showCaptions = false;
			captioningNames.push(captionName);
		} catch(e:Error) {
			continue;
		}
	} else if (key.match(/tokenizer-for-(.+)/)) {
		var languageCode = key.substring(14);
		var tokenizerName = params[key];
		if (tokenizers[tokenizerName]) {
			captioningTokenizers[languageCode] = tokenizers[tokenizerName];
		}
	}
}

captioningNames.push('None');

eachCaptioning(function(n, c) {
	c.addEventListener(CaptionChangeEvent.CAPTION_CHANGE, onCaptionChange);
});

if(params['captions'] && captions[params['captions']]) {
	showCaptions(params['captions']);
}
