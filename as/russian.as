registerTokenizer({
	name: 'Russian',
	CHARS: '-́йцукенгшщзхъёфывапролджэячсмитьбюЙЦУКЕНГШЩЗХЪЁФЫВАПРОЛДЖЭЯЧСМИТЬБЮ',
	isCharacter: function (c) {
		return (this.CHARS.indexOf(c) >= 0);
	},
	linkFor: function (word) {
		var raw_word = word.replace('́', '');
		return 'http://dev.laits.utexas.edu/rr/morphology/find.php?q=' + encodeURIComponent(raw_word) + '&t=Search';
	},
	shouldLink: function (word) {
		return this.isCharacter(word.charAt(0));
	},
	splitWords: function (str) {
		var ret = [];
		var current = '';
		for (var i = 0; i < str.length; i++) {
			var character = str.charAt(i);
			if(this.isCharacter(character)) {
				current += character;
			} else {
				if(current.length > 0) {
					ret.push(current);
					current = '';
				}
				ret.push(character);
			}
		}
		if(current.length > 0)
			ret.push(current);
		return ret;
	}
});