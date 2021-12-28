# Cryptographic Hash

Labs for [GNU/Linux](../../lab/gnu-linux/cryptographic-hash) · macOS · Windows

## Hash function

A **hash function** is a function that takes in data of any length and outputs data of a fixed length, called its **hash**.

Hash functions are deterministic. With the same hash function, the same input data will always result in the same hash.

For a good hash function, the time needed to compute grows with the size of the data, because the hash is determined by all of the data. Cryptographic hash functions have this property.

Below are two pieces of data and their 256-bit SHA-2 hash.

| Data (hexadecimal)       | Text (UTF-8)  | SHA-2 256 hash                                                     |
|:------------------------ |:------------- |:------------------------------------------------------------------ |
| (empty)                  | (empty)       | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` |
| `48656c6c6f20776f726c64` | `Hello world` | `64ec88ca00b268e5ba1a35678a1b5316d212f4f366b2477232534a8aeca37f3c` |

Because there are infinite possible inputs but only finitely many hash values, there must be infinite pieces of data that hashes to the same value. This is called **collision**.

## Cryptographic hash function

A **cryptographic hash function** is also:

- *Irreversible.* The only way to find possible inputs from a hash is to try inputs one by one and check if the hash matched. It is also infeasible to make any inference about the input data from the hash alone.

- *Chaotic.* The mapping from data to hashes should seem random. Two similar pieces of data will result in seemingly uncorrelated hashes. Therefore, it is infeasible to construct an input that hashes to a given value (purposefully construct a collision).

| Data (hexadecimal) | SHA-2 256 hash                                                     |
|:------------------ |:------------------------------------------------------------------ |
| `089f8954a605c945` | `e7ad94f8f1338ce71c0b033d881abafd978cb332a56f1fe2d79082565aafc5ee` |
| `089f8954a605c946` | `581c858eba8d0c8a9e418f35193ca72536f91f55a7610b7001d0c0330bc8b1b6` |

Hashing is useful when we need to make sure two pieces of data are the same without comparing any meaningful details in them.

Currently, the most commonly used and secure cryptographic hash functions are the SHA-2 and SHA-3 families.

## Usages and insecurities

Hash algorithms can be used in the following ways:

- *Compare hashes only.* Used when any meaningful details are secrets or unnecessary. Password verification.

- *Derive symmetric encryption key.* The hash of the user input is used as the symmetric encryption key, rather than the user input itself.

- *Verify data.* The hash is trusted by some other method, and then one computes the hash of the data to verity its authenticity.

In some cases, a slow hash algorithm is chosen to improve security.

Different attacks target different use cases. Some are more interested in producing a certain hash (**collision** or **second preimage**), while some are more interested in getting the input data (**preimage**).

An intelligent finding in the algorithm may make attacking faster than brute force. When such attacks are found, the hash function should be obsoleted.
