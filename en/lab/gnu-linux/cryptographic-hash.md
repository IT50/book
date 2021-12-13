# Cryptographic Hash

## Computing hashes

We use the `sha256sum` utility to compute the SHA-2 256 hash of a given input.

To hash the text you then type into the terminal, use `sha256sum`. The text is encoded with your terminal’s text encoding and then sent to `sha256sum`. To finish the input, issue ++ctrl+d++. Note that the inclusion of a newline character (produced by ++enter++) will make the input different.

To hash a file, use `sha256sum file_name`.

## Revisiting the [SHAttered](https://shattered.io) collision attack

A collision attack is where one tries to produce a different piece of data that has the same hash as a given piece of data.

Researchers have already broken SHA-1. A way to construct a collision attack much faster than brute force was used in the [SHAttered](https://shattered.io) project. We are going to use the two files provided on the website to further explore the concept of cryptographic hash.

Use these commands to download the attack results:

``` sh
wget https://shattered.io/static/shattered-1.pdf
wget https://shattered.io/static/shattered-2.pdf
```

Then use these commands to compute the SHA-1 hashes of the two files:

``` sh
sha1sum shattered-1.pdf
sha1sum shattered-2.pdf
```

The outputs should be:

```
$ sha1sum shattered-1.pdf
38762cf7f55934b34d179ae6a4c80cadccbb7f0a  shattered-1.pdf
$ sha1sum shattered-2.pdf
38762cf7f55934b34d179ae6a4c80cadccbb7f0a  shattered-2.pdf
```

Now, imagine that you trust the SHA-1 hash value `38762cf7f55934b34d179ae6a4c80cadccbb7f0a`, because the author of the file gave you this hash. You then receive the `shattered-2.pdf` version, compute its SHA-1 hash, and subsequently trust `shattered-2.pdf`, assuming no one is able to construct a different piece of data that hashes to the same value. Were you the victim of a collision attack? We further verify that the two files are different, using the SHA-2 256 hash algorithm:

```
$ sha256sum shattered-1.pdf
2bb787a73e37352f92383abe7e2902936d1059ad9f1ba6daaa9c1e58ee6970d0  shattered-1.pdf
$ sha256sum shattered-2.pdf
d4488775d29bdef7993367d541064dbdda50d383f89f0aa13a6ff2e0894ba5ff  shattered-2.pdf
```

Or you can simply use `diff shattered-1.pdf shattered-2.pdf` to compare their data verbatim.

That is the proof of a SHA-1 collision. Note that this was not obtained using plain brute force; an intelligent finding in the algorithm produced an algorithm 100,000 times faster, according to the original researchers. This is why SHA-1 should be obsoleted.

### File format and content modification

You can find that both `shattered-1.pdf` and `shattered-2.pdf` are valid PDF files, with modifications only at very intentional positions. This hints that such attacks can produce content as intended. In fact, this is the whole point of an attack.

Many file formats specify unused positions. Data at these positions are ignored when opened by a supported program. However, data at these positions still contribute towards the hash. By changing these parts, an attacker can try to collide the hash after the intended modification is done.

Hashes are short: SHA-1 is only 20 bytes long, and even SHA-2 512 is only 64 bytes long. If we assume that the SHA-2 512 mapping from input to output is “uniformly dense”, then we should expect to find one collision for all the possible 64-byte strings at an unused position. If there are 65 bytes of available space, then we should expect 256 collisions. This turns out to be very feasible since most file formats have way more than enough unused space for this modification. However, the irreversibility and chaosity still prevents an attack from being computed quickly.

## Experimenting the one-time password generator

The popular one-time password (OTP) specification is based on cryptographic hashes. An OTP program generates a different code every fixed amount of time, and only this code is valid for this period of time. We are going to simulate an OTP system.

First, the server determines a **secret** and displays it to the user. Let’s use the secret `He110!` (UTF-8 string) for our example.

Then, assuming the client and the server both have synced their clocks, they calculate how many 30-second periods have passed since 12:00 AM, January 1, 1970 (GMT). Let’s use the value `54646121` for our example.

Then, we combine these two pieces of data and hash it. If we simply concatenate these two strings into `He110!54646121` and use `sha256sum`, then we get the hash `c927ef15ac1d090bac6c3a9860242ddf2170b53aedaaac8f78c7e71cd3c6d11c`. We further reduce this to its first 3 bytes `c927ef` so it’s easy to type within 30 seconds. (This also makes brute force attacks almost impossible.)

This hash will change after the 30-second period, but as long as the server and client still share the same secret and have their clocks synced, they will continue to generate the same hash. Even if an OTP such as `c927ef` is leaked, a person who doesn’t know the secret cannot continue to produce the same hash as the server. Therefore, it is important to protect OTP secrets, and this is why OTP utilities always hide them.
