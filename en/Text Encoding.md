# Text Encoding

<lm class="lm-concept"></lm>We learned that raw data is free for any interpretation, but we always want software to be consistent and compatible with each other. One of the aspects within which they should be consistent is how to save and read text.

The basic idea for any text-to-data conversion is to establish a bidirectional map between each character and raw bit sequence.

<lm class="lm-standard"></lm>Back some time ago, storage space was expensive and software were not designed to be multilingual. People came up with quite limited sets of letters, numbers, symbols and control characters, and mapped them to shorter bit sequences. In ISO Latin 1, a character takes 1 byte (8 bits). Mathematically, there are only 256 unique 8-bit sequences, and each of them has a character defined. [Here](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout) is a list of characters ISO Latin 1 contains. The first 128 of them are defined to be the same as in ASCII.

ASCII and ISO Latin 1 are **text encoding standards**, and people usually just say **encoding**.

ASCII has only unaccented Latin and ISO Latin 1 contains a limited set of accented Latin characters, which definitely does not satisfy people who use other characters. In the old days people would switch their text editor’s encoding to one for their language. In the table below, you can see how the text mapped from the same data but using different encodings are different:

| Raw data | Read with ISO 8859-1 Latin 1                                 | Read with ISO 8859-5 Latin/Cyrillic                        |
| -------- | ------------------------------------------------------------ | ---------------------------------------------------------- |
| `EF E9`  | `ïé`<br/>(lowercase i with diaeresis, lowercase e with acute) | `ящ`<br/>(lowercase Cyrillic ya, lowercase Cyrillic shcha) |

If a piece of data is encoded text, you need to open it with the original encoding or a compatible one. <lm class="lm-implementation"></lm>Usually, your text editor would guess an encoding based on the content of the file, but if that guess was wrong, you will see the wrong characters for the reason shown in the table above. You may also see rectangles or question marks because those bit sequences happen to be undefined in the encoding you open with.

## Unicode

<lm class="lm-standard"></lm>More recently, the world designed a single standard for all languages. It is **Unicode**. The specific parts of it are **UTF-8**, **UTF-16**, etc. Unicode character lengths are variable. The numbers in these names stand for the smallest length of each character, and the lengths for other characters are always a multitude of this smallest unit. Unicode has its own rules to split continuous data into segments of different lengths and then map these segments to characters. The designers of Unicode followed a rule: the more commonly a character is used, the shorter its bit sequence. We save a lot of space in this way.

## Compatibility

<lm class="lm-standard"></lm>Some encodings are compatible in a particular way. In ASCII, a character takes 7 bits. In ISO Latin 1, a character takes 8 bits, and the lower 128 (`0x00` to `0x7F`) are defined to be the same as in ASCII, meaning that ISO Latin 1 is single-direction compatible with ASCII if ASCII data are padded to 8 bits with a leading zero. Similarly, UTF-8 is compatible with ISO Latin 1, because all 8-bit characters in UTF-8 are defined to be the same as in ISO Latin 1. 

## Text File

Most text files are just each character’s bit sequences concatenated together, and the files themselves contain no other information that identify their encodings or that they are plain text. That’s why text editors often guess the encoding for you, and it is often (not always) correct. If you have tried to open with all encoding standards and still cannot see readable text, the file you opened is probably not a text file.

## Try it

<lm class="lm-application"></lm>Try a text editor that lets you choose an encoding to work with. Create a file, set the editor’s encoding mode to ISO Latin 1, and type some characters. Switch the editor’s mode to Unicode and see if text is still displayed correctly. Paste some characters from Cyrillic, Greek, Arabic, or Chinese into the document and see if text is still displayed correctly. Now switch the editor’s mode back to ISO Latin 1 and see how these new characters are displayed.

You may also want to save this file from time to time and use a hexadecimal data viewer to see it in raw.
