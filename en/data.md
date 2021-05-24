# Data

It is commonly known that computers hold and process data in binary — 0’s and 1’s. However, it may take a few moments for you to understand what that actually means.

To illustrate some points, we start with an example:

```
0000011000001000000010110100010011100010101010101010101101001101
```

## Bit and Byte

[[CON]] A single digit in the data above represents a **bit**. Its symbol is a lowercase **b**. A bit has only two possible values, and we call them “off” and “on”. In raw data we can use 0 and 1 to represent them. The data above contains 64 bits.

A **byte** is 8 bits long. Its symbol is an uppercase **B**. Today's computers know bytes inherently. Computers process a multitude of bytes at once. They also recognize the positions where bytes start. Data storage is always aligned to bytes. Thus, it is usually meaningless to read data starting from somewhere that is not the start position of a byte. You will also read data in bytes rather than in bits. The example data can be split into bytes:

```
00000110 00001000 00001011 01000100 11100010 10101010 10101011 01001101
```

A byte can be written as a two-digit hexadecimal number that can be directly converted from its binary representation. For example, `11100100` will be represented as `E4` (by convention, with prefix `0x` if ambiguous).

An **address** is a number used to specify a location in raw data. It is a convention that we count the address from zero, and this has an advantage that we will talk about later.

The address is often defined sequentially to each byte. In this way, we nicely format the example:

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

## Data is mundane

[[CON]] As far as we have learned now, a piece of data is mundane, or dull. This is to make you keep in mind that data only becomes meaningful in a context. The context can be a standard, or an environment.

Just for the purpose of illustrating this point, we create a standard so there is some context for our example data. For the example above, you may read one byte at a time from the beginning to the end and think of them as integers. If you follow this structure, you will get these integers:

| Address | Data       | Integer (decimal) |
| ------- | ---------- | ----------------: |
| `0`     | `00000110` |                 6 |
| `1`     | `00001000` |                 8 |
| `2`     | `00001011` |                11 |
| `3`     | `01000100` |                68 |
| `4`     | `11100010` |               226 |
| `5`     | `10101010` |               170 |
| `6`     | `10101011` |               171 |
| `7`     | `01001101` |                77 |

But alternatively, someone may have designed a bitmap image standard, and the rules are:

- The first byte should be interpreted as an integer that is the width of the image.
- The next byte should be interpreted as an integer that is the height of the image.
- The rest of the data bits should be interpreted as pixels, starting from the top-left corner, going right and wrapping at the end of each row.

If you follow this structure, the image will have a width of 6 and height of 8. You will wrap the bits from 16 to 63 like this:

```
000010
110100
010011
100010
101010
101010
101101
001101
```

And an image viewer for this type should render these 0's and 1's into pixels of two different colors in the arrangement as above.

Unfortunately, because the example data itself has no context, no one can tell if this data means a list of integers, a bitmap, or anything else. We will learn about how to determine these contexts and interpret data in the following chapters.

## Why we count from zero

[[CON]] Look at the table of a few numbers in their decimal and binary forms.

| Decimal |      Binary |
| ------: | ----------: |
|       0 |  `00000000` |
|       1 |  `00000001` |
|      63 |  `00111111` |
|      64 |  `01000000` |
|     255 |  `11111111` |
|     256 | `100000000` |

Note where the binary number bumps to the 7th and 9th place. Because there are so many advantages to keep the length of data the same, we want to use all the 2⁸ = 256 possible values in an 8-bit piece of data. We have to use this combination of all zeros in order to use all of the 256 combinations.

## Units

The base units for the amount of data are byte and bit. We use prefixes on them to specify a magnitude.

| Prefix | Magnitude |           (calculated) |     | Prefix | Magnitude |
| ------ | --------: | ---------------------: | --- | ------ | --------: |
| Ki     |       2¹⁰ |                = 1 024 |     | K      |       10³ |
| Mi     |       2²⁰ |            = 1 048 576 |     | M      |       10⁶ |
| Gi     |       2³⁰ |        = 1 073 741 824 |     | G      |       10⁹ |
| Ti     |       2⁴⁰ |    = 1 099 511 627 776 |     | T      |      10¹² |
| Pi     |       2⁵⁰ | ≈ 1.125 899 907 × 10¹⁵ |     | P      |      10¹⁵ |
| Ei     |       2⁶⁰ | ≈ 1.152 921 505 × 10¹⁸ |     | E      |      10¹⁸ |
| Zi     |       2⁷⁰ | ≈ 1.180 591 621 × 10²¹ |     | Z      |      10²¹ |
| Yi     |       2⁸⁰ | ≈ 1.208 925 820 × 10²⁴ |     | Y      |      10²⁴ |

There is some difference in how people use these two series of prefixes. For example, on Windows, the set of symbols without the “i” is used, but actually means that with an “i”. It is always good to clarify and test before doing things formally.

## Try it

You can view any file and any part of a disk with a raw data viewer. Try a hexadecimal data editor. It allows you to see raw data bytes in hexadecimal. However, you are not able to interpret it before you learn the standards, and you will probably corrupt your files if you edit randomly. Remember to back up your files before editing them. Do not edit your disk directly unless you have read the [Partitioning and Filesystem](../partitioning-and-filesystem) chapter.

