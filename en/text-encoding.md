# Text Encoding

We always want software to be consistent and compatible with each other. One of the aspects within which they should be consistent is how to save and read text. **Text encoding** standards specify how we do this one important level of abstraction. The basic idea for any text-to-data conversion is to establish an one-to-one mapping between each character and its raw bit sequence.

## Fixed character length

Mathematically, with exactly _n_ bits, it is only possible to define 2ⁿ unique characters. If each character takes up exactly 8 bits, we can define 256 characters. This is the case in [ISO 8859-1 Latin 1](https://en.wikipedia.org/wiki/ISO/IEC_8859-1#Code_page_layout), although some sequences are left undefined.

Control characters, such as line break and null terminator, are treated just as normal characters in text encodings.

ISO Latin 1 contains only a limited set of accented Latin characters, which definitely does not satisfy people who use other writing systems. In a similar way, people have defined standards for them. In the table below, you can see how the text mapped from the same data but using different encodings are different:

| Raw data     | Decoded with ISO 8859-1 Latin 1                            | Decoded with ISO 8859-5 Latin/Cyrillic                 |
|:------------ |:---------------------------------------------------------- |:------------------------------------------------------ |
| `0x69 0xE9`  | `ié`<br/>(lowercase Latin i, lowercase Latin e with acute) | `iщ`<br/>(lowercase Latin i, lowercase Cyrillic shcha) |

Such character encoding scheme has compatibility for those characters that happen to have the same definitions, like the `i` in the example above. If a piece of data is encoded text, you had better open it with the original encoding, unless you know the content of the file and how these standards are compatible.

## Unicode

**Unicode** is the modern-day default text encoding standard for all languages. It achieves extensibility and compatibility with ISO Latin 1, using the technique of variable character length. Unicode character lengths are always a multitude of a smallest **unit** of 8 or 16 bits. It has a special rule to split a continuous string of encoded text into segments of different lengths and then map these sequences to characters. This is done in a way that makes UTF-8 compatible with ISO Latin 1 for those characters they share.

Writing systems that have fewer characters use the shorter sequences (for example, 1 or 2 UTF-8 units), and writing systems that have more characters use the longer sequences (for example, 3 UTF-8 units). This minimizes the data size of the encoded text for everyone.

## Text File

Most text files are just each character’s bit sequences concatenated together, and the files themselves contain no other information that identify their encodings or that they are plain text. That’s why text editors often guess the encoding for you, and you may be able choose to open with a specific encoding.
