// initialize captioning
var activeCaptioning:String = null;
var captions:Object = new Object();
var captioningNames = [];
var captioningTokenizers:Object = new Object();

function showCaptions(name) {
	
	if(name == 'None')
		name = null;
	
	if(name && captions[name]) {
		activeCaptioning = name;
		languageToggle.text = name;
	} else {
		captionBox.htmlText = '';
		captionBox.visible = false;
		activeCaptioning = null;
		languageToggle.text = 'None';
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
		var words = tokenizer.splitWords(text);
		var html = '<p>';
		for (var i=0; i < words.length; i++) {
			var word = words[i];
			if(tokenizer.shouldLink(word)) {
				html += '<a href="' + tokenizer.linkFor(word) + '" target="_blank">' + word + '</a>';
			} else {
				html += word;
			}
		}
		html += '</p>';
		// captionBox.htmlText = html;
		event.captionCuePointObject.parameters.text = html;
	}
		
}