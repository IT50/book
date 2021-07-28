# Cryptographic Hash

## Hash function

A **hash function** is a function that takes in data of any length and outputs data of a fixed length, called its **hash**.

Hash functions are deterministic. The same input data will always result in the same hash. Hash functions are also quick to compute for a single input.

| Data (hexadecimal)       | Text (UTF-8)  | SHA-2 256 hash                                               |
| ------------------------ | ------------- | ------------------------------------------------------------ |
| (empty)                  | (empty)       | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` |
| `48656c6c6f20776f726c64` | `Hello world` | `64ec88ca00b268e5ba1a35678a1b5316d212f4f366b2477232534a8aeca37f3c` |

## Cryptographic hash function

A **cryptographic hash function** is also:

Irreversible. Hash functions can only take in a piece of data and output its hash. They are not feasibly reversible: the only way to reverse a hash function is trying inputs. Similarly, it should be infeasible to find two different pieces of data that have the same hash value.

Chaotic. The mapping from data to hashes should seem random. Two similar pieces of data will result in seemingly uncorrelated hashes.

| Data (hexadecimal) | SHA-2 256 hash |
| ---- |------------ |
| `089f8954a605c945` | `e7ad94f8f1338ce71c0b033d881abafd978cb332a56f1fe2d79082565aafc5ee` |
| `089f8954a605c946` | `581c858eba8d0c8a9e418f35193ca72536f91f55a7610b7001d0c0330bc8b1b6` |

Hashing is useful when we need to make sure two pieces of data are the same without comparing any meaningful details in them. When it comes to data validation, systems often compare hash values, not the data themselves.

Currently, the most commonly used and secure cryptographic hash functions are the SHA-2 and SHA-3 families.

## Insecurities

When we use cryptographic hashes to secure things, we rely on their irreversibility. Because ideal cryptographic hash functions are irreversible, the only way to attack is to use brute force, simply trying inputs one by one. The chance of finding the same hash value is so low that it is expected to take very long to find the same hash.

An intelligent finding in the algorithm may make attacking faster than brute force. When such attacks are found, the hash function should be obsoleted.

