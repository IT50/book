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

Now, imagine that you trust the SHA-1 hash value `38762cf7f55934b34d179ae6a4c80cadccbb7f0a`. You then receive `shattered-2.pdf`, compute its SHA-1 hash, and subsequently trust `shattered-2.pdf`, assuming no one is able to construct a different piece of data that hashes to the same value. Were you the victim of a collision attack? We further verify that the content of the two files are different, using the SHA-2 256 hash algorithm:

```
$ sha256sum shattered-1.pdf
2bb787a73e37352f92383abe7e2902936d1059ad9f1ba6daaa9c1e58ee6970d0  shattered-1.pdf
$ sha256sum shattered-2.pdf
d4488775d29bdef7993367d541064dbdda50d383f89f0aa13a6ff2e0894ba5ff  shattered-2.pdf
```

That is the proof of a successful SHA-1 collision attack. Note that this was not obtained using plain brute force; an intelligent finding in the algorithm produced a method 100,000 times faster, according to the original researchers. This is why SHA-1 should be obsoleted.
