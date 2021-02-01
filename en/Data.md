# Data

It is commonly known that computers hold and process data in binary — 0's and 1's. However, it may take a few moments for you to understand what that *actually* means.

To illustrate some points, we start with an example:

```
0000011000001000000010110100010011100010101010101010101101001101
```

A single digit in the data above represents a **bit**. Its symbol is a lowercase **b**. A bit has only two possible values, and we call them “off” and “on”. In raw data we can use 0 and 1 to represent them. The data above contains 64 bits.

## Byte

A **byte** is 8 bits long. Its symbol is an uppercase **B**.

Today's computers know bytes inherently. Computers process a multitude of bytes at once. They also recognize the positions where bytes start. Data storage is always aligned to bytes. Thus, not any consecutive 8-bit sequence is a byte. It is usually meaningless to read data starting from somewhere that is not the start position of a byte. You will also read data in bytes rather than in bits. The example data can be split into bytes:

```
00000110 00001000 00001011 01000100 11100010 10101010 10101011 01001101
```

A byte can be written as a two-digit hexadecimal number that can be directly converted from its binary representation. For example, `11100100` will be represented as `E4` (with prefix `0x` if singular or ambiguous).

An **address** is a number (usually hexadecimal with prefix `0x`) used to locate a byte and is assigned in sequential order. It is a convention that we count the address from zero when dealing with raw data, and this has an advantage that we will talk about later.

We nicely format it:

```
Address             0x0      0x1      0x2      0x3      0x4      0x5      0x6      0x7
Data (binary)       00000110 00001000 00001011 01000100 11100010 10101010 10101011 01001101
Data (hexadecimal)  06       08       0B       44       E2       AA       AB       4D
```

## Data is disorganized

A piece of data is open for any interpretation. For the example above, you may read one byte at a time from the beginning to the end and think of them as integers. If you treat the digits in the written arrangement as above, you will get these integers:

| Address | Data | Integer (decimal) |
| ------- | ----- | ----:|
| `0` | `00000110` | 6 |
| `1` | `00001000` | 8 |
|`2`|`00001011`|11|
|`3`|`01000100`|68|
|`4`|`11100010`|226|
|`5`|`10101010`|170|
|`6`|`10101011`|171|
|`7`|`01001101`|77|

But you may have designed a bitmap image format, and your rules are:

- The first byte should be interpreted as an integer that is the width of the image.
- The next byte should be interpreted as an integer that is the height of the image.
- The rest of the data should be interpreted as pixels, starting from the top-left corner, going right and wrapping at the end of each row.

If you follow this rule, the image will have a width of 6 and height of 8. You will wrap the string from bits 16 to 63 like this:

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

And your particular image viewer for this type should render these 0's and 1's into pixels of two different colors in the arrangement as above.

Unfortunately, for now, no one can tell if this data means a list of integers, a bitmap, or anything else. We will learn about the standards for interpreting data in the following chapters.

## Why we count from zero

Look at the table of a few numbers in their decimal and binary forms.

| Decimal | Binary         |
| -------:| --------------:|
| 0       | `00000000`     |
| 1       | `00000001`     |
| 63      | `00111111`     |
| 64      | `01000000`     |
| 255     | `11111111`     |
| 256     | `1` `00000000` |

Note where the binary number bumps to the 7th and 9th place. Because there are so many advantages to keep the length of data the same, we want to use all the 2⁸ = 256 possible values in an 8-bit piece of data. We have to use this combination of all zeroes in order to use all of the 256 combinations.

## Units

The base units for the amount of data are byte and bit. We use prefixes on them to specify a magnitude.

| Prefix | Magnitude |           (calculated) |      | Prefix | Magnitude |
| ------ | --------: | ---------------------: | - | ------ | --------: |
| Ki     |       2¹⁰ |                = 1 024 |      | K      |       10³ |
| Mi     |       2²⁰ |            = 1 048 576 |      | M      |       10⁶ |
| Gi     |       2³⁰ |        = 1 073 741 824 |      | G      |       10⁹ |
| Ti     |       2⁴⁰ |    = 1 099 511 627 776 |      | T      |      10¹² |
| Pi     |       2⁵⁰ | ≈ 1.125 899 907 × 10¹⁵ |      | P      |      10¹⁵ |
| Ei     |       2⁶⁰ | ≈ 1.152 921 505 × 10¹⁸ |      | E      |      10¹⁸ |
| Zi     |       2⁷⁰ | ≈ 1.180 591 621 × 10²¹ |      | Z      |      10²¹ |
| Yi     |       2⁸⁰ | ≈ 1.208 925 820 × 10²⁴ |      | Y      |      10²⁴ |

There is some conventional difference in how people use these two series of prefixes. On Windows, the set of symbols without the “i” is used, but actually means that with an “i”.

## Try it

You can view any file and any part of a disk with a raw data viewer. Try a hexadecimal data editor. It allows you to see raw data bytes in hexadecimal. Remember to back up your important files before editing them. Do not edit your disk directly unless you have read the Partitioning and Filesystem chapter.