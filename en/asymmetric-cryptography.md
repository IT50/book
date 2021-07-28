# Asymmetric Cryptography

**Asymmetric cryptography** has a pair of keys. When one of the keys is used to encrypt data, only the other key can be used to decrypt.

Keep in mind that the sender knows the original data.

A pair of keys is generated at once. Usually, one key is made public, and called the **public key**; the other is kept private, and called the **private key**. Then the following actions are possible:

- Sending a message securely to a designated recipient. Transforming a piece of data with the public key ensures that the data can only be read by the designated recipient, the owner of the private key.
- Proving authenticity. Transforming a piece of data with the private key proves the authenticity of the data because only the owner of the key can do so. Thus, this action is not called encrypting but **signing** as it does not make anything secret.

## Ideal workflow for sending a message

- Everyone knows everyone’s public key.
- Alice has the original data.
- Alice encrypts the original data with Bob’s public key.
- Alice sends the encrypted data to Bob.
- Bob decrypts the data with his private key.
- Bob has the original data.

Note that Alice does not encrypt with her own private key, or anyone who has access to the encrypted data would be able decrypt it.

However, in the real world it is not practical to know everyone’s public key in advance. The key has to be shared at the start of the connection. In this situation, the connection bearer can always perform a **man-in-the-middle (MITM)** attack. The next section shows how such attack works. The world currently has a widely used (and *pretty* solid) way to prevent MITM attacks, and we will talk about that in the Chain of Trust chapter.

## Workflow for sending a message, but with in-time public key sharing and MITM attack

- Alice has the original data.
- Alice requests Bob for his public key and this request ended up in Charles’ hand.
- Charles requests Bob for his public key. Bob responds with his public key.
- Charles responds Alice with his own public key.
- Alice encrypts the original data with Charles’s public key.
- Alice sends the encrypted data to Bob and it ended up in Charles’ hand.
- Charles decrypts the data with his private key.
- Charles has the original data.
- Charles optionally modifies the original data.
- Charles encrypts the original data with Bob’s public key.
- Bob decrypts the data with his private key.
- Bob has the original data.

The two scenarios above also apply to signing and signature verification. For brevity, only the ideal one is described here.

## Ideal workflow for signing and signature verification

- Alice has a piece of data to publish.
- Alice signs (transforms) a cryptographic hash of the data with her private key. This is the **signature**.
- Alice sends the original data along with the signature.
- Bob receives the data along with the signature.
- Bob calculates the hash of the data.
- Bob transforms the signature with Alice's public key, and gets the authentic hash of the data.
- If the hashes match, the signature is verified and the data is authentic. Else, the data or the signature has changed.