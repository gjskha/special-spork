function palindrome(word: string) : boolean {

    if (word.length <= 1) {  	
        return true;
    }

    if (word[0] !== word.split("").reverse().join("")[0]) {
        return false;
    } else {
	let subWord: string = word.substring(1,word.length-1);
        return palindrome(subWord);
    }
}

console.log(palindrome("e"));
console.log(palindrome("fred"));
console.log(palindrome("eve"));
console.log(palindrome("madamImadam"));
console.log(palindrome("lapopal"));
