# Symmetric Cryptography

**Symmetric cryptography** has one key. This key is used to encrypt and decrypt the data.

Symmetric encryption is suitable for storage. If a key is shared unencrypted with the ciphertext protected by it, the encryption can *always* be compromised by the connection bearer. Therefore, symmetric cryptography cannot be used to initialize a secure connection. Asymmetric cryptography is used for that purpose.

## Typical workflow

- Alice and Bob knows the key.
- Alice has the plaintext.
- Alice encrypts the plaintext with the key.
- Alice sends the ciphertext to Bob.
- Bob decrypts the ciphertext with the key.
- Bob has the plaintext.
