# Binary Data

It is commonly known that computers hold and process data in binary — 0’s and 1’s. However, it may take a few moments for you to understand what that actually means.

To illustrate some points, we start with an example:

```
0000011000001000000010110100010011100010101010101010101101001101
```

## Bit and Byte

A single digit in the data above represents a **bit**. A bit has only two possible values, “off” and “on”, and we use 0 and 1 to represent them. 

A **byte** is 8 bits long. Today's computers know bytes inherently. Computers process a multiple of bytes at once. They also recognize the positions where bytes start. Bytes are usually only used as a whole. Incomplete bytes do not exist.

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

## Amount of binary data

When discussing the amount of binary data, we can say there is a certain number of bits or bytes. The example data above is 8 bytes, or 64 bits.

The symbol for bit is a lowercase **b**. For extra clarity, you can also use **bit**.

The symbol for byte is an uppercase **B** or lowercase **o** (“octet”, a group of eight things).

## Addressing

An **address** is a number used to locate a byte or block in raw data.

**Linear addressing** is a very simple way to addresses a piece of data. The starting position has address 0, and the address increases by 1 for every subsequent byte (or fixed-size **block** of bytes, which we will use in a later chapter.)

In our example, these are the addresses and their corresponding data.

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

At a low level, binary data has a fixed size and does not become longer or shorter. This way of treating binary data is natural to computer engineers. On binary data, to write means to overwrite, changing a part to the desired content and destroying existing data.

If a piece of binary data can become longer or shorter, this usually means it is a file in a [filesystem](./partitioning-and-filesystem.md), a higher level of abstraction which we have not discussed yet.

When the original data is not important, a piece of binary data may be referred to as space. Without any abstraction performed by the operating system, the disk in your computer appears as a long sequence of bytes.

## Units

The base units for the amount of data are byte and bit. We use **prefixes** on them to specify a **magnitude**. As per **IEC 80000-13** and **SI**:

| IEC 80000-13 Prefix | Magnitude |           (calculated) |
| ------------------- | --------: | ---------------------: |
| Ki                  |       2¹⁰ |                = 1 024 |
| Mi                  |       2²⁰ |            = 1 048 576 |
| Gi                  |       2³⁰ |        = 1 073 741 824 |
| Ti                  |       2⁴⁰ |    = 1 099 511 627 776 |
| Pi                  |       2⁵⁰ | ≈ 1.125 899 907 × 10¹⁵ |
| Ei                  |       2⁶⁰ | ≈ 1.152 921 505 × 10¹⁸ |
| Zi                  |       2⁷⁰ | ≈ 1.180 591 621 × 10²¹ |
| Yi                  |       2⁸⁰ | ≈ 1.208 925 820 × 10²⁴ |

| SI Prefix | Magnitude |
| --------- | --------: |
| k         |       10³ |
| M         |       10⁶ |
| G         |       10⁹ |
| T         |      10¹² |
| P         |      10¹⁵ |
| E         |      10¹⁸ |
| Z         |      10²¹ |
| Y         |      10²⁴ |

For example, 4 **KiB** = 4 × 2¹⁰ **B** = 4096 **byte** = 32768 **bit**, but 4 **kbit** = 4 × 10³ **bit** = 4000 **bit**.

However, certain systems do not use these standards, causing a lot of confusion. It is always good to clarify and test before doing things formally.

Notably, **JEDEC** is a standard usually confused with SI. What makes things more interesting, some developers (including the Windows operating system) decided to extend JEDEC by filling the empty cells in the table with T, P, E, Z, Y, all of which are similar to SI prefixes. The author’s opinion is to use IEC 80000-13 and SI only, in line with IEEE/ASTM SI 10-1997, which stated “This \[JEDEC\] practice frequently leads to confusion and is deprecated.”

| IEC 80000-13 Prefix | JEDEC Prefix | Magnitude |           (calculated) |
| ------------------- | ------------ | --------: | ---------------------: |
| Ki                  | K            |       2¹⁰ |                = 1 024 |
| Mi                  | M            |       2²⁰ |            = 1 048 576 |
| Gi                  | G            |       2³⁰ |        = 1 073 741 824 |
| Ti                  |              |       2⁴⁰ |    = 1 099 511 627 776 |
| Pi                  |              |       2⁵⁰ | ≈ 1.125 899 907 × 10¹⁵ |
| Ei                  |              |       2⁶⁰ | ≈ 1.152 921 505 × 10¹⁸ |
| Zi                  |              |       2⁷⁰ | ≈ 1.180 591 621 × 10²¹ |
| Yi                  |              |       2⁸⁰ | ≈ 1.208 925 820 × 10²⁴ |
