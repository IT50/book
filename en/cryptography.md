# Cryptography

Magic? You can say that. The following activities are all made possible by modern cryptography.

- Ensuring two pieces of data are the same without comparing any meaningful details.
- Encrypted storage.
- Sending a message privately to a designated recipient.
- Proving the authenticity of a publication.

**Encryption** is a transformation where **plaintext** is losslessly transformed into **ciphertext**, a form that appears to be random. The opposite of that action is **decryption**. A **key** is a parameter used to transform the data. With different keys, ciphertext will be different.

A **brute force attack** means trying parameters one by one until a particular one is found. The security of cryptography is entirely based on the humble idea to make brute force attack astronomically more expensive than the “legitimate” usage. The amount of trials increases exponentially with the key size or hash length. With a sufficient key size or hash length, brute force attack is by far the least prominent insecurity and generally negligible.
