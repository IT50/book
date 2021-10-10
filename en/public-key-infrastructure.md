# Public Key Infrastructure

As you read through the Asymmetric Cryptography chapter, you may have noticed that such a system alone cannot guarantee the authenticity of the public key, _i.e._ no way to trust that a particular public key belongs to a particular entity, other than manual record. The world currently has a **public key infrastructure** (**PKI**) for authentic public key distribution.

## Entity

We do not trust a public key by itself; we trust the fact that it is owned by a particular person, because keys cannot be used interchangably between people you communicate with. That “particular person” is generalized into the concept of entity, which can be a person, an organization, a website, _etc._

Different entity types have different kinds of suitable information fields. The Common Name field is a generic choice, but there are also many others in the **X.509** standard. It is possible to have only the minimal necessary information. For example, for a website, it is considered OK to only have the domain name in the Common Name field.

## Establishing trust

To establish trust, a third party attests an entity’s ownership of a public key. This third party is called a **certificate authority** (**CA**), and such an attestation is called a **CA certificate**, done by signing the combination of the public key and identifiable information of the entity. The trust comes from the CA’s behavedness. We trust all a CA’s public key ownership attestations if we believe that the CA only provides such attestations responsibly, _i.e._ only after it has verified the accuracy of the entity’s details and its ownership of the public key. Then, we add this well-behaving CA to our list of trusted CAs and verify all certificates it issues afterwards. From this point on, no one needs to manage trusted public keys for any entity — only trusted CAs, and then check the identifiable information of the entity.

In other words, CAs establish trust by sticking to the rule that they only make entities known as who they really are, and not interchangably.

As a part of PKI, all operating systems have a built-in list of trusted CAs, and this list can be managed by the user.

Certificates also have a valid period of time, beyond which the key pair should be discarded for security. This is general good practice in asymmetric cryptography.

## Entities in a tree structure

A CA can issue certificates to let other entities be CAs by specifying this special usage in the certificate. The new CAs being signed are called **intermediate CA**s. They are trusted automatically by inherentance from the parent CA, and are expected to follow the same rules to be well-behaved. These CAs form a hierarchy in a tree structure, with the top one being the **root CA**. In other words, trusting a root CA automatically trusts the whole tree, unless an entity in that tree is marked as untrusted and that invalidates its whole subtree.

The world currently has a number of well-behaving root CAs in multiple countries and regions.

From the perspective of verification, trust is established in a chain structure: from the root CA to all intermediate CAs to the end entity. If any entity in the chain is untrusted, trust cannot be established.

## Revocation

A certificate should be **revoked** if its corresponding private key has been compromised, or if the certificate itself was issued improperly. A certificate for a CA should be revoked if the CA fails to behave, and unfortunately this had happened in the past. The revocation process takes some time, and an internet connection is needed to download certificate revocation information from the CA’s **OCSP server**, which may fail. Operating systems also update their local lists, but that takes even longer.

The certificate revocation system is too likely to fail, but it is the best as it can get because revocation is real-time data that needs to be downloaded. For the most rigorous verification, one should always check for revocation.
