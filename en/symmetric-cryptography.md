# Symmetric Cryptography

**Symmetric cryptography** has one key. This key is used to encrypt and decrypt the data.

Symmetric **encryption** is suitable for storage. If a key is shared unencrypted with the encrypted data, the encryption can *always* be compromised by the connection bearer.

## Typical workflow

- Alice and Bob knows the key.
- Alice has the original data.
- Alice encrypts the original data with the key.
- Alice sends the encrypted data to Bob.
- Bob decrypts the data with the key.
- Bob has the original data.
