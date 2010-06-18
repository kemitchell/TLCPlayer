
// a lot of the code below is commented out.  This is because the
// we are just setting those values to the default values anyways.
// This gives you an idea of how little code you might have to write
// if you did your own skin!  But we leave the commented code in
// to give you an idea of what you would need to do if you wanted
// to customize the skin.

// set up linkages
this.pauseButtonDisabledState = "fl.video.skin.PauseButtonDisabled";
this.pauseButtonDownState = "fl.video.skin.PauseButtonDown";
this.pauseButtonNormalState = "fl.video.skin.PauseButtonNormal";
this.pauseButtonOverState = "fl.video.skin.PauseButtonOver";

this.playButtonDisabledState = "fl.video.skin.PlayButtonDisabled";
this.playButtonDownState = "fl.video.skin.PlayButtonDown";
this.playButtonNormalState = "fl.video.skin.PlayButtonNormal";
this.playButtonOverState = "fl.video.skin.PlayButtonOver";

this.stopButtonDisabledState = "fl.video.skin.StopButtonDisabled";
this.stopButtonDownState = "fl.video.skin.StopButtonDown";
this.stopButtonNormalState = "fl.video.skin.StopButtonNormal";
this.stopButtonOverState = "fl.video.skin.StopButtonOver";

this.fullScreenButtonOffDisabledState = "fl.video.skin.FullScreenButtonOffDisabled";
this.fullScreenButtonOffDownState = "fl.video.skin.FullScreenButtonOffDown";
this.fullScreenButtonOffNormalState = "fl.video.skin.FullScreenButtonOffNormal";
this.fullScreenButtonOffOverState = "fl.video.skin.FullScreenButtonOffOver";

this.fullScreenButtonOnDisabledState = "fl.video.skin.FullScreenButtonOnDisabled";
this.fullScreenButtonOnDownState = "fl.video.skin.FullScreenButtonOnDown";
this.fullScreenButtonOnNormalState = "fl.video.skin.FullScreenButtonOnNormal";
this.fullScreenButtonOnOverState = "fl.video.skin.FullScreenButtonOnOver";

this.bufferingBar = "fl.video.skin.BufferingBar";
this.bufferingBarFill = "fl.video.skin.BufferingBarFill";

this.seekBar = "fl.video.skin.SeekBar";
this.seekBarHandle = "fl.video.skin.SeekBarHandle";
this.seekBarHit = "fl.video.skin.SeekBarHit";
this.seekBarProgress = "fl.video.skin.SeekBarProgress";

this.volumeBar = "fl.video.skin.VolumeBar";
this.volumeBarHandle = "fl.video.skin.VolumeBarHandle";

// minimum width and height of video recommended to use this skin,
// leave as undefined or <= 0 if there is no minimum
this.minWidth = 222;
this.minHeight = 60;

// Defaults:
// * this.foo_mc.anchorLeft defaults to true, unless anchorRight
//   is explicitly set to true and then it defaults to false
// * this.foo_mc.anchorRight defaults to false
// * this.foo_mc.anchorTop defaults to false
// * this.foo_mc.anchorBottom defaults to true, unless anchorTop
//   is explicitly set to true and then it defaults to false

// background for controls, some commented out because are defaults
// by calling this border_mc we have specially flagged it to be treated
// as additional space for detecting rollover for auto show/hide skin
// as well as background color and alpha setting
this.border_mc.colorMe = true;  // this indicates it is OK to tweak color and alpha
this.border_mc.anchorLeft = true;
this.border_mc.anchorRight = true;
//this.border_mc.anchorBottom = true;
//this.border_mc.anchorTop = false;

// the outline of the border, lays on top of the border
// separated out because of the alpha and color setting on the border
this.outline_mc.anchorLeft = true;
this.outline_mc.anchorRight = true;
//this.shadow_mc.anchorBottom = true;
//this.shadow_mc.anchorTop = false;

// the shadow of the border, lays below the border
// separated out because of the alpha and color setting on the border
this.shadow_mc.anchorLeft = true;
this.shadow_mc.anchorRight = true;
//this.shadow_mc.anchorBottom = true;
//this.shadow_mc.anchorTop = false;

// playpause_mc just using all defaults, so no code needed
//this.playpause_mc.anchorLeft = true;
//this.playpause_mc.anchorRight = false;
//this.playpause_mc.anchorBottom = true;
//this.playpause_mc.anchorTop = false;

// stop_mc just using all defaults, so no code needed
//this.stop_mc.anchorLeft = true;
//this.stop_mc.anchorRight = false;
//this.stop_mc.anchorBottom = true;
//this.stop_mc.anchorTop = false;

// volumeBar_mc overriding default for anchorRight property
//this.volumeBar_mc.anchorLeft = false;
this.volumeBar_mc.anchorRight = true;
//this.volumeBar_mc.anchorBottom = true;
//this.volumeBar_mc.anchorTop = false;

// fullScreenToggle_mc overriding default for anchorRight property
//this.fullScreenToggle_mc.anchorLeft = false;
this.fullScreenToggle_mc.anchorRight = true;
//this.fullScreenToggle_mc.anchorBottom = true;
//this.fullScreenToggle_mc.anchorTop = false;

// seekBar_mc using mostly defaults, but setting anchorRight to true
this.seekBar_mc.anchorLeft = true;
this.seekBar_mc.anchorRight = true;
//this.seekBar_mc.anchorBottom = true;
//this.seekBar_mc.anchorTop = false;

// seekBarHit_mc using mostly defaults, but setting anchorRight to true
this.seekBarHit_mc.anchorLeft = true;
this.seekBarHit_mc.anchorRight = true;
//this.seekBarHit_mc.anchorBottom = true;
//this.seekBarHit_mc.anchorTop = false;

// bufferingBar_mc using mostly defaults, but setting both anchorLeft
// and anchorRight to true and setting fill_mc
this.bufferingBar_mc.anchorLeft = true;
this.bufferingBar_mc.anchorRight = true;
//this.bufferingBar_mc.anchorBottom = true;
//this.bufferingBar_mc.anchorTop = false;
