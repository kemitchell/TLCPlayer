TLC Player
==========

Flash-based FLV player supporting multiple Timed Text captions and word linking

Who?
---

TLC Player has been released to make the job of building websites that incorporate multi-captioned foreign-language videos for language instruction easier.

What?
----

TLC Player is a collection of ActionScript 3 files and a Flash project file that compile to an Adboe Flash `.swf` file suitable for embedding into webpages. This `.swf` file can be used to display videos with multiple caption tracks, allowing students to switch between captions as video plays. Additionally, the player supports the tokenization of captioning and the linking of individual caption words to external web resources (see _What Else?_ below).

Why?
----

Until browser support for HTML5 video becomes widespread, educators must fall back on the technology that is currently available on student computers to display video online. While Flash fills this niche, its built-in support for multiple captions during FLV playback is limited to cuepoints baked into FLV files during encoding, which are cumbersome to produce and laborious to edit. TLC Player allows any student whose computer can display, e.g., YouTube videos to watch multi-captioned videos.

Where?
------

TLC Player's source repository is hosted on [GitHub](http://github.com/):

> [http://github.com/kemitchell/TLCPlayer](http://github.com/kemitchell/TLCPlayer)

Developers: Please feel free to fork the project and submit pull requests!

How?
----

To use TLC Player in your webpage you will need 3 components:

1. tlcplayer.swf from TLC Player
2. An FLV video file to play
3. Timed Text files describing captions for the video file.
4. A standard Flash FLVPlayer skin `.swf` file

For creating Timed Text files, I heartily recommend  I recommend [Subtitle Horse](http://subtitle-horse.org/), which is practical and free.

Embed the SWF into the page as you usually would, using the following FlashVars:

* video – Path of the FLV video file to be played
* captions-NAME – path to the Timed Text XML file for caption track NAME. You may include any number of captions- flashvars for multiple caption tracks.
* captions — the NAME of the captions to show by default
* tokenizer-for-NAME – The word tokenizer and linker to use with caption track NAME. More on word tokenizers below.
* skin — The FLVPlayer skin to use

### Example Usage

The following is an edited version of a JavaScript file used by the “Retro Russian” site for which the player was built. The example loads captions for native Russian captions with tokenization, as well as literal English translation and colloquial English translation captions. It makes use of the [jQuery Tools](http://flowplayer.org/tools/) project's [Flashembed](http://flowplayer.org/tools/toolbox/flashembed.html) script to embed the flash object in a compatible way across browsers.

    flashembed('flash', {
        // parameters
        src:                   'tlcplayer.swf',
        version:               [9,0],
        wmode:                 'opaque',
        expressInstall:        'expressinstall.swf',
        bgcolor:               '#000000'
    },{
        // flashvars
        'video':               'content/video.flv',
        'captions-Russian':    'content/captions/ru.xml',
        'captions-Colloquial': 'content/captions/en-c.xml',
        'captions-Literal':    'content/captions/en-l.xml',
        'captions':            'Russian',
        'tokenizer-Russian':   'Russian',
        'autoplay':             true,
        'skin':                'skin.swf'
    });

What Else?
----------

TLC Player supports the concept of a “tokenizer”, which is a module of code that breaks captions into chunks of words, and optionally allows those words to be linked to web addresses. For example, a tokenizer for Russian words might transform words in Russian-language captions into clickable links that allow the student to look up unfamiliar words in an online dictionary.

The first job of a tokenizer is to break a caption into parts — those words that should be linked, and those additional characters that needn't be. Thus a tokenizer for English might take a caption like the following:

    "How are you, Ted?"

Into the following chain of words and extra text:

    ['How', ' ', 'are', ' ', 'you', ', ', 'Ted', '?', ]

The words “How”, “are”, and “you” might then be linked to, e.g., [dictionary.com](http://www.dictionary.com).

At present only a simple word tokenizer for the Russian language is built into TLC Player. This tokenizer links Russian words to the online reference component of the “Rockin’ Russian” project. Developers familiar with ActionScript should start with that example when building their own tokenizers. The general means of baking a tokenizers into TLC Player looks as follows:

    registerTokenizer({
        tokenize: function (str) {
            // this function receives the caption string, str
            // and should return an array of objects like the following:
            // {
            //     URL: '', // null if token should not be linked
            //     text: '' // text of the token
            // }
        }
    });

Please share any tokenizers you come up with!

Whence?
-------

The TLC Player was extracted from “Retro Russian” extension of the [“Rockin’ Russian”](http://tltc.la.utexas.edu/rr/index.html) project, a website for students of Russian that uses multi-captioned Russian music videos to teach grammar, vocabulary, and linguaculture. Both projects are the brainchildren of [Dr. Thomas J Garza](https://webspace.utexas.edu/garzatj/), Distinguished Teaching Associate Professor at the [Department of Slavic and Eurasian Studies](http://www.utexas.edu/cola/depts/slavic/) at [The University of Texas at Austin](http://www.utexas.edu) and director of the [Texas Language Center](http://www.utexas.edu/cola/centers/tlc/), at whose gracious behest TLC Player has been made available under the terms of an open source license.