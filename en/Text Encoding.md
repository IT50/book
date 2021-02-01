# Text Encoding

We learned that raw data is free for any interpretation, but we always want software to be consistent and compatible with each other. One of the aspects within which they should be consistent is how to save and read text.

The basic idea for any text-to-data conversion is to establish a bidirectional map between each character and bit sequence.

Back some time ago, storage space was expensive. People came up with smaller lists of letters, numbers, symbols and control characters, and mapped them to shorter bit sequences. In ISO Latin 1, a character takes 1 byte (8 bits). Mathematically, there are only 256 unique 8-bit sequences, and each of them has a character defined. [Here](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) is a list of characters ISO Latin 1 contains. The first 128 of them are defined to be the same as in ASCII.

ASCII and ISO Latin 1 are **text encoding standards**, and people usually just say **encoding**.

ASCII has only unaccented Latin and ISO Latin 1 contains a limited set of accented Latin characters, which definitely does not satisfy people who use other characters. In the old days people would switch their text editor's encoding to one of their language's. In the table below, you can see how the text mapped from the same data but using different encodings differ:

| Raw data | Read with ISO Latin 1 | Read with ISO Latin 3 |
| -------- | --------------------- | --------------------- |
|          |                       |                       |

If a piece of data is encoded text, you need to open it with the original encoding or a compatible one. Usually, your text editor would guess an encoding based on the content of the file, but if that guess was wrong, you will see gibberish for the reason shown in the table above. You may also see rectangles or question marks because those bit sequences happen to be undefined in the encoding you open with.

## Unicode

More recently, the world designed a single encoding for all languages. It's **Unicode**. The specific encodings are **UTF-8**, **UTF-16**, etc. Unicode character lengths are variable. The numbers in these names stand for the smallest length of each character, and the lengths for other characters are always a multitude of this smallest unit. Unicode has its own rules to split a continuous data string into ones of different lengths and then map these ones to characters.

The designers of Unicode followed a rule: the more commonly a character is used, the shorter its bit sequence. We save a lot of space in this way. 

## Compatibility

Some encodings are compatible in a particular way. In ASCII, a character takes 7 bits. In ISO Latin 1, a character takes 8 bits, and the lower 128 (`0x00` to `0x7F`) are defined to be the same as in ASCII, meaning that ISO Latin 1 is single-direction compatible with ASCII if ASCII data are padded to 8 bits with a leading zero. UTF-8 is compatible with ISO Latin 1.
