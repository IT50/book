# Encryption

We want to keep secrets. Rather than keeping all the data in our heads or guarding a physical copy, we can encrypt that data so it exists in some other form that is not meaningful to anyone who cannot decrypt.

In this chapter, we are mainly going to talk about the two types of encryption: **symmetric encryption** and **asymmetric encryption**. We will deal with original data, encrypted data, and **keys**. The key is the parameter used to transform the data. Ideally, encrypted data should look like random data, and data encrypted with different (even similar) keys should be in no way similar to each other. Such encryption algorithms have been designed by scientists. But still, they fall into the two categories.

## Symmetric encryption

Symmetric encryption has one key. This key is used to encrypt and decrypt the data.

Symmetric encryption is suitable for storage and internal networks where keys are pre-shared. If a key is shared unencrypted with the encrypted data, the encryption can *always* be compromised by the connection bearer.

### Typical workflow

- Alice and Bob knows the key.
- Alice has the original data.
- Alice encrypts the original data with the key.
- Alice sends the encrypted data to Bob.
- Bob decrypts the data with the key.
- Bob has the original data.

## Asymmetric encryption

Asymmetric encryption has a pair of keys. When one of the keys is used to encrypt data, only the other key can be used to decrypt. Keep in mind that the sender knows the original data.

Usually, one key is made public and the other is kept private. This design allows secure communication.

Asymmetrical encryption is mathematically similar to signing. They were actually born at the same time.

### Ideal workflow

- Everyone knows everyone's public key.
- Alice has the original data.
- Alice encrypts the original data with Bob's public key.
- Alice sends the encrypted data to Bob.
- Bob decrypts the data with his private key.
- Bob has the original data.

Note that Alice does not encrypt with her own private key, or anyone who has access to the encrypted data would be able decrypt it.

However, in the real world we can't possibly know everyone's public key. The key has to be shared at the start of the connection. In this situation, the connection bearer can always perform a **man-in-the-middle (MITM)** attack. The next section shows how such attack works. The world currently has a widely used (and *pretty* solid) way to prevent MITM attacks, and we will talk about that in the Signing and CA chapter.

### Workflow with in-time key sharing and MITM attack

- Alice has the original data.
- Alice requests Bob for his public key and this request ended up in Charles' hand.
- Charles requests Bob for his public key. Bob responds with his public key.
- Charles responds Alice with his own public key.
- Alice encrypts the original data with Charles's public key.
- Alice sends the encrypted data to Bob and it ended up in Charles' hand.
- Charles decrypts the data with his private key.
- Charles has the original data.
- Charles optionally modifies the original data.
- Charles encrypts the original data with Bob's public key.
- Bob decrypts the data with his private key.
- Bob has the original data.

## Insecurities

A brute force attack means to keep attempting decryption with different keys until the correct one is found. To prevent this to the maximum extent, use a key as random as possible. Even though most programs use a hash of your password as the key, keep in mind that attackers can try popular passwords and word combinations, so follow the typical advice when setting your password.

An encryption algorithm is considered cracked if there is any way to decrypt data faster (computationally less expensive) than using brute force. However, these can be done in differet levels and some speeds up the attempts more than others. If the data can be

## Block cipher

Mathematics require that the key be larger (longer) than the data for the encryption to function. (BOTH SY AND ASY?) Therefore, people come up with different ways to split up data while keeping the system secure.

Here is a list of common block ciphers:

