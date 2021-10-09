# Binary Data

It is commonly known that computers hold and process data in binary — 0’s and 1’s. However, it may take a few moments for you to understand what that actually means.

To illustrate some points, we start with an example:

```
0000011000001000000010110100010011100010101010101010101101001101
```

## Bit and Byte

A single digit in the data above represents a **bit**. Its symbol is a lowercase **b** (or for better discrimination, **bit**). A bit has only two possible values, “off” and “on”, and we use 0 and 1 to represent them. The data above contains 64 bits.

A **byte** is 8 bits long. Its symbol is an uppercase **B**. Today's computers know bytes inherently. Computers process a multitude of bytes at once. They also recognize the positions where bytes start. Bytes are usually only used as a whole. Incomplete bytes do not exist.

The example data are these bytes:

```
00000110 00001000 00001011 01000100 11100010 10101010 10101011 01001101
```

and there is no such thing as:

```
00 00011000 00100000 00101101 00010011 10001010 10101010 10101101 001101
```

or

```
00000110 00001000 00001011 01000100 11100010 10101010 10101011 01001
```

You will also read data in bytes rather than in bits. A byte is commonly written as a two-digit hexadecimal number that can be directly converted from its binary representation. For example, `0b11100100` will be represented as `0xE4`, where in a certain convention `0b` stands for binary and `0x` stands for hexadecimal.

## Addressing

Similar to how only whole bytes are useful, in certain contexts, only whole **blocks** of some bytes are useful. In such contexts, the total length of raw data is a multitude of a block size, which is commonly chosen to be a power of 2 bytes. In contexts where the concept of block is not helpful, the length of binary data can be any number of bytes.

An **address** is a number used to locate a byte or block in raw data.

**Linear addressing** is a very simple way to give addresses to positions in a piece of data. The starting position has address 0, and the address increases by 1 for every subsequent byte or block.

In our example, the author dictates to not use blocks, so addresses are given to bytes. These are the addresses and their corresponding data.

| Byte address | Data (binary) | Data (hexadecimal) |
| ------------ | ------------- | ------------------ |
| `0`          | `00000110`    | `06`               |
| `1`          | `00001000`    | `08`               |
| `2`          | `00001011`    | `0B`               |
| `3`          | `01000100`    | `44`               |
| `4`          | `11100010`    | `E2`               |
| `5`          | `10101010`    | `AA`               |
| `6`          | `10101011`    | `AB`               |
| `7`          | `01001101`    | `4D`               |

It is more than a convention that we count the address and many things else from zero. Look at the table of a few numbers in their decimal and binary forms to find out why.

|  Decimal |      Binary |
| -------: | ----------: |
|        0 |  `00000000` |
|        1 |  `00000001` |
|       63 |  `00111111` |
|  2⁶ = 64 |  `01000000` |
|      255 |  `11111111` |
| 2⁸ = 256 | `100000000` |

Note where the binary number bumps to the 7th and 9th place. Because there are so many advantages to keep the length of data the same, we want to use all the 2⁸ = 256 possible values in an 8-bit piece of data. We have to use this combination of all zeros in order to use all of the 256 combinations.

## Binary data operations

In most contexts, binary data has a fixed size and does not become longer or shorter. 

On binary data, to write means to overwrite, changing a part to the desired content and destroying existing data. The time needed to read and write sequentially on any storage device is proportional to the data size.

When the original data is not important, a piece of binary data may be referred to as space.

## Units

The base units for the amount of data are byte and bit. We use prefixes on them to specify a magnitude. As per **IEC 80000-13** and **SI**:

| Prefix | Magnitude |           (calculated) |     | Prefix | Magnitude |
| ------ | --------: | ---------------------: | --- | ------ | --------: |
| Ki     |       2¹⁰ |                = 1 024 |     | k      |       10³ |
| Mi     |       2²⁰ |            = 1 048 576 |     | M      |       10⁶ |
| Gi     |       2³⁰ |        = 1 073 741 824 |     | G      |       10⁹ |
| Ti     |       2⁴⁰ |    = 1 099 511 627 776 |     | T      |      10¹² |
| Pi     |       2⁵⁰ | ≈ 1.125 899 907 × 10¹⁵ |     | P      |      10¹⁵ |
| Ei     |       2⁶⁰ | ≈ 1.152 921 505 × 10¹⁸ |     | E      |      10¹⁸ |
| Zi     |       2⁷⁰ | ≈ 1.180 591 621 × 10²¹ |     | Z      |      10²¹ |
| Yi     |       2⁸⁰ | ≈ 1.208 925 820 × 10²⁴ |     | Y      |      10²⁴ |

However, some systems do not use these standards, and that often causes confusion. It is always good to clarify and test before doing things formally.

## Try it

You can view any file and any part of a disk with a binary data viewer. Try a hexadecimal data editor. It allows you to see raw data bytes in hexadecimal. However, you are not able to understand it before you learn the standards, and you will probably corrupt your files if you edit randomly. Remember to back up your files before editing them. Do not edit your disk directly unless you have read the Partitioning and Filesystem chapter.
