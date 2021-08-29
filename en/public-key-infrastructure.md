# Public Key Infrastructure

As you read through the Asymmetric Cryptography chapter, you may have noticed that such a system alone cannot guarantee the authenticity of the public key, i. e. no way to trust that a particular public key is linked to an entity (person, company, website, etc.). And you may have also guessed that it is not a good idea to pre-share all public keys to everyone. The world currently has a **public key infrastructure** (**PKI**) for authentic public key distribution.

## Establishing trust

To establish trust, a third party verifies an entity's ownership of a public key and attests that. This third party is called a **certificate authority** (**CA**), and such an attestation is called a **CA certificate**, done by signing the combination of the public key and identifiable information of the entity. We can trust all a CA's public key ownership attestations if we believe that the CA only provides attestation responsibly, i.e. only after it has verified the entity's ownership of the public key. Then we add the public key of this well-behaving CA to our list of trusted CAs and verify all certificates it issues afterwards. From this point on, no one needs to manage trusted public keys for any entity — only trusted CAs, and then check the identifiable information of the entity.

As a part of PKI, all operating systems have a built-in list of trusted CAs and historically revoked certificates.

A certificate contains a number of information fields, such as a Common Name, Organizational Unit, etc. It is possible to have a certificate with only the minimal necessary information for a secure data exchange. For example, for a secure connection to a website, it is considered OK to only match the domain name. In this situation, the CA only needs to verify that a public key owner also owns the domain. If more information fields are used, the CA would have more verification to do. When there is enough information to associate with a legal entity, this certificate is called to fulfill **extended validation** (**EV**).

Certificates also have a valid period of time, beyond which the key pair should be discarded for security.

## Entities in a tree structure

A CA can issue certificates to let other entities be CAs by specifying this special usage in the certificate. The new CAs being signed are called **intermediate CA**s. They are trusted automatically by inherentance from the parent CA, and are expected to follow the same rules to be well-behaved. These CAs form a hierarchy in a tree structure, with the top one being the **root CA**.

The world currently has a number of well-behaving root CAs in multiple countries and regions.

From the perspective of certificate entities, trust is established in a chain structure: from the root CA to all intermediate CAs to the entity's certificate. If any entity in the chain is untrusted, trust cannot be established. In other words, trusting a root CA automatically trusts the whole tree, unless an entity in that tree is marked as untrusted and that invalidates its whole subtree.

## Revocation

A certificate should be **revoked** if the corresponding private key has been compromised, or if the certificate itself was issued improperly. A certificate for a CA should be revoked if the CA fails to behave, and unfortunately this had happened in the past. The revocation process takes some time, and an internet connection is needed to download certificate revocation information from the CA's **OCSP server**, which may fail. Operating systems also update their local lists, but that takes even longer.

The certificate revocation system is too likely to fail, but it is the best as it can get because revocation is real-time data that needs to be downloaded. For the most rigorous verification, one should always check for revocation.
