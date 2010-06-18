var tokenizers:Object = new Object();
function registerTokenizer(tokenizer) {
	tokenizers[tokenizer.name] = tokenizer;
}