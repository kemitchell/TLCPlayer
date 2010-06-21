// initialize captioning
var activeCaptioning:String = null;
var captions:Object = new Object();
var captioningNames = [];
var captioningTokenizers:Object = new Object();

function showCaptions(name) {
	
	if(name == NO_CAPTIONS)
		name = null;
	
	if(name && captions[name]) {
		activeCaptioning = name;
		languageToggle.text = name;
	} else {
		captionBox.htmlText = '';
		captionBox.visible = false;
		activeCaptioning = NO_CAPTIONS;
		languageToggle.text = NO_CAPTIONS;
		name = null;
	}
		
	eachCaptioning(function(n, c) {
		if (n == name) {
			c.showCaptions = true;
			activeCaptioning = name;
		} else {
			c.showCaptions = false;
		}
	});
	
}

function eachCaptioning(callback) {
	for(var captionName:String in captions) {
		callback(captionName, captions[captionName]);
	}
}

var TAG_REGEXP = /<([^>])+>/g;

function onCaptionChange(event:CaptionChangeEvent) {
	
	if(!event.added) {
		captionBox.htmlText = '';
		captionBox.visible = false;
		return;
	} else {
		captionBox.visible = true;
	}
	
	var text = event.captionCuePointObject.parameters.text;	
	if (captioningTokenizers[activeCaptioning]) {
		text = text.replace(TAG_REGEXP, '');
		var tokenizer = captioningTokenizers[activeCaptioning];
		var words = tokenizer.tokenize(text);
		var html = '<p>';
		for (var i=0; i < words.length; i++) {
			var word = words[i];
			if(word.url) {
				html += '<a href="' + word.url + '" target="_blank">' + word.text + '</a>';
			} else {
				html += word.text;
			}
		}
		html += '</p>';
		event.captionCuePointObject.parameters.text = html;
	}
		
}