# File Format

We just learned about the standards for encoding and decoding text. Another aspect within which they should be consistent is how to save and read various kinds of files. Essentially, they are also just standards built on top of binary data, and the standard for the structure of a file is called its **format**. This chapter only introduces the most cognitively constructive formats.

## File name and extensions

The file name, including any extensions, is independent from the data in the file — renaming will not change the data in the file. The extension is only a conventional, supplementary description of the file format, and may or may not provide more detailed description beyond the standardized characteristics in the file. Different formats can even share the same extension.

You can open any file with any program and the program *should* check if the file opened is in a supported format, but a poorly made program may not do so and corrupt the file when saving. Some operating systems solely rely on the extension to pick a program to open a file. Therefore, these operating systems may or may not open the correct program when you try to open a file by clicking on it.

## List of generic file types, formats and conventional extensions

- Uncompressed archive of files (`.tar`, `.zip`, _etc._ that reflect the archive format)
- Compressed file (`.gz`, `.xz`, `.7z`, _etc._ that reflect the compression format)
- Compressed archive of files (`.zip`, `.7z`, _etc._ that reflect the format)

- Binary executable
  - Entry program (no extension on UNIX-like, `.exe` on Windows)
  - Library program (`.so`, `.o`, `.dll` on Windows)

- Raw binary 
  - Raw partition or disk image (`.img`, `.bin`)
  - Memory dump

- Plain text of any encoding (`.txt`)
  - Program source code (`.c`, `.cpp`, `.java`, _etc._ that reflect the language)
  - Shell script (`.sh`, `.ps1`, _etc._ that reflect the shell, or no extension on UNIX-like)
  - Markup language document (`.html`, `.md`, _etc._ that reflect the language)
  - Structured information (`.json`, `.ini`, `.yml`, _etc._ that reflect the language)
    - Configuration file of standardized or non-standardized structure (`.conf`, `.cf`, _etc._)

- Other specialized formats

## Description of specialized types

### Archive and compression

**Archive** formats combine multiple files into one file. **File compression** algorithms can losslessly convert data to and from a less space-consuming form stored in a specialized format.

An archive does not have to compress its contents. The UNIX Tape Archive (TAR) format is an example of this. People usually compress the TAR file with one of the compression standards and get the compressed file with double extensions (`.tar.gz`). Other archive formats may have compression integrated and produce one compressed file with one extension.

### Media

Media file formats are not different from the general definition. However, these file formats are containers that contain metadata and the actual media data. The actual media data is encoded with a **codec** designed for its media type. Media codec is already a complicated topic on its own, but for the purpose of this book, you only need to know the following:

**Lossless codecs**, much like file compression, do lossless conversion between data and analog media. However, they are much more efficient than universal file compression because they are specialized for a particular media type. Examples include Portable Network Graphic (PNG) and Free Lossless Audio Codec (FLAC).

**Lossy codecs** lose information when the media is encoded. They substantially decrease the data sizes while only losing the minimal details that we unlikely see or hear, and the quality is usually configurable in the encoder. Examples include nearly all modern video codecs, JPEG, WebP, MP3 and opus.
