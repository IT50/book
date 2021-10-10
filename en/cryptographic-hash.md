# Cryptographic Hash

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

Hashing is useful when we need to make sure two pieces of data are the same without comparing any meaningful details in them, often because any meaningful details are secrets or the data is too large to send. When it comes to data validation, systems often compare hash values, not the data themselves.

Currently, the most commonly used and secure cryptographic hash functions are the SHA-2 and SHA-3 families.

## Insecurities

When we use cryptographic hashes to secure things, we rely on their irreversibility. Because ideal cryptographic hash functions are irreversible, the only way to attack is to use brute force, simply trying inputs one by one. The chance of finding the same hash value is so low that it is expected to take very long to find the same hash. Even if one is found, the data may not be the original one, because infinite pieces of data hash to the same value. Therefore, for short data such as passwords, we should consider the possibility of a brute force attack trying to find its plain text. The countermeasure is to use a slower algorithm or more iterations, use different salts, and very importantly, as a user, use long, complex passwords and not use a single pattern for all passwords.

An intelligent finding in the algorithm may make attacking faster than brute force. When such attacks are found, the hash function should be obsoleted.
