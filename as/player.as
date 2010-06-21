import fl.controls.Label;
import fl.video.*;
import fl.video.CaptionChangeEvent;
import fl.video.CaptionTargetEvent;
import flash.display.MovieClip;
import flash.display.Stage;
import flash.events.Event;
import flash.events.FullScreenEvent;
import flash.events.MouseEvent;
import flash.external.ExternalInterface;
import flash.text.StyleSheet;
import flash.text.TextField;
import flash.text.TextFormat;


include 'setup.as'; // components

include 'captioning.as'; // captioning subsystem

include 'tokenizing.as'; // tokenizer registry
include 'rockinrussian.as'; // Russian tokenizer

include 'params.as' // flashvar parsing

include 'externalinterface.as'; // javascript interface