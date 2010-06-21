registerTokenizer({
	name: 'RockinRussian',
	CHARS: '-́йцукенгшщзхъёфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪЁФЫВАПРОЛДЖЭЯЧСМИТЬБЮ',
	isCharacter: function (c) {
		return (this.CHARS.indexOf(c) >= 0);
	},
	urlFor: function (word) {
		var raw_word = word;
		var encodedWord = encodeURIComponent(raw_word);
		return 'http://dev.laits.utexas.edu/rr/morphology/find.php?q=' + encodedWord + '&t=Search';
	},
	addWord: function (array, item) {
		if (this.isCharacter(item.text.charAt(0))) {
			item.url = this.urlFor(item.text);
		}
		array.push(item);
	},
	tokenize: function (str) {
		var ret = [];
		var current = {
			url: null,
			text: ''
		};
		for (var i = 0; i < str.length; i++) {
			var character = str.charAt(i);
			if(this.isCharacter(character)) {
				current.text += character;
			} else {
				if(current.text.length > 0) {
					this.addWord(ret, current);
					current = {
						url: null,
						text: ''
					};
				}
				this.addWord(ret, {url: null, text: character});
			}
		}
		if(current.text.length > 0)
			this.addWord(ret, current);
		return ret;
	}
});