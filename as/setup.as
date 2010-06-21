var player:FLVPlayback = new FLVPlayback(); 
player.x = 0;
player.y = 0;
player.width = stage.stageWidth;
player.height = stage.stageHeight;
player.autoPlay = false;
player.skinBackgroundColor = 0x000000;
player.skinAutoHide = true;
player.skinFadeTime = 0;
player.fullScreenTakeOver = false;
addChild(player);

var captionBox:TextField = new TextField();
captionBox.x = 0;
captionBox.y = 335;
captionBox.width = stage.stageWidth;
captionBox.height = 50;
captionBox.autoSize = 'center';
captionBox.background = true;
captionBox.backgroundColor = 0x000000;
captionBox.visible = false;
captionBox.selectable = true;

var stylesheet = new StyleSheet();
stylesheet.setStyle('p', {
    fontSize: 28,
    color: '#FFFFFF',
    textAlign: 'center',
	fontFamily: 'Times New Roman'
});
stylesheet.setStyle('a:hover', {
    textDecoration: 'underline'
});
captionBox.styleSheet = stylesheet;
addChild(captionBox);

var languageToggle:TextField = new TextField();
var TOGGLE_INACTIVE_ALPHA = 0.25;
var TOGGLE_ACTIVE_ALPHA = 0.9;
languageToggle.y = 10;
languageToggle.x = 0;
languageToggle.background = true;
languageToggle.backgroundColor = 0x000000;
languageToggle.autoSize = 'left';
languageToggle.selectable = false;
languageToggle.blendMode = BlendMode.LAYER; // for alpha support
languageToggle.alpha = 0.25;

var toggleFormat:TextFormat = new TextFormat();
toggleFormat.font = "Arial";
toggleFormat.color = 0xFFFFFF;
languageToggle.defaultTextFormat = toggleFormat;

addChild(languageToggle);

languageToggle.addEventListener(MouseEvent.CLICK, function(e:Event) {
	var position = captioningNames.indexOf(activeCaptioning);
	var next = captioningNames[position + 1];
	if (next) {
		showCaptions(next);
	} else {
		showCaptions(captioningNames[0]);
	}
});

languageToggle.addEventListener(MouseEvent.MOUSE_OVER, function() {
	languageToggle.alpha = TOGGLE_ACTIVE_ALPHA;
});

languageToggle.addEventListener(MouseEvent.MOUSE_OUT, function() {
	languageToggle.alpha = TOGGLE_INACTIVE_ALPHA;
});

// pause video when subtitles clicked
captionBox.addEventListener(MouseEvent.CLICK, function() {
    if(stage.displayState == 'fullScreen') {
        stage.displayState = 'normal';
    }
	player.pause();
});