# File Format

We just learned about the standards for encoding and decoding text. Another aspect within which they should be consistent is how to save and read various kinds of files. Essentially, they are also just standards, and the standard for the structure of a file is called its **format**. There is a specialized file format created for almost any kind of data people use. This chapter only lists and describes the most important ones. Most file formats are public standards. That said, you need to look up the standard if you need to work with one.

## File name and extensions

[[CON]] The file name, including any extensions, is independent from the data in the file. People commonly misunderstand the extensions in file names. The extensions are only a conventional, supplementary description of the file format, and may or may not provide more detailed description beyond the standardized characteristics in the file. [[IMPL]] You can open any file with any program and the program *should* check if the file opened is in a supported format, but a poorly made program may not do so and corrupt the file. Some operating systems (including Windows) solely rely on the extension to pick a program to open a file. If you use a non-conventional extension, or there's a rare format that uses a common extension, these operating systems may or may not open the correct program when you try to open a file by clicking on it.

## List of generic file types, formats and conventional extensions

- Non-compressed archive of other files (.tar, .zip, etc. that reflect the archive format)
- Compressed file (.gz, .xz, .7z, etc. that reflect the compression format)
- Compressed archive of other files (.zip, .7z, etc. that reflect the format)
- Binary executable
  - Entry program (.exe on Windows, no extension on UNIX-like)
  - Library (.dll on Windows, .so on Linux)
- Raw data (.bin)
  - Raw partition or disk image (.img, .bin)
  - Memory dump
- Plain text of any encoding (.txt)
  - Program code (.c, .cpp, .java, etc. that reflect the language)
    - Shell script (.sh, .ps1, etc. that reflect the shell, or no extension on UNIX-like)
  - Markup language document (.html, .md, etc. that reflect the language)
  - Structured information (.json, .ini, .yml, etc that reflect the language)
    - Configuration file of standardized or non-standardized structure (.conf, .cf, etc.)
- Other specialized formats

## Description of specialized types

### Archive and compression

[[CON]] **Archive** formats combine multiple files into one file. **File compression** algorithms can losslessly convert data to and from a less space-consuming form stored in a specialized format.

An archive does not have to compress its contents. The UNIX Tape Archive (TAR) format is an example of this. People usually compress the TAR file with one of the compression algorithms and get the compressed file with double extensions (e.g. .tar.gz). Other archive formats may have compression integrated and produce one compressed file with one extension.

### Media

[[CON]] Media file formats are not different from the general definition. However, these file formats are containers that contain metadata and the actual media data. The actual media data is encoded with a **codec** and stored its specialized structure. Media codec is already a complicated topic on its own, but for the purpose of this book, you only need to know the following:

**Lossless codecs**, much like file compression, do lossless conversion between data and analog media. However, they are much more efficient than universal file compression because they are specialized for a particular media type. Examples include Portable Network Graphic (PNG) and Free Lossless Audio Codec (FLAC).

**Lossy codecs** lose information when the media is encoded. They substantially decrease the data sizes while only losing the minimal details that we are unable to see or hear, and the quality is usually configurable in the encoder. Examples include nearly all modern video codecs, JPEG, WebP, MP3 and opus.

## Try it

- Create a Microsoft Word (2007 or later) document. You can open it with Microsoft Word, of course. But did you know that it is just a ZIP archive of its contents? Try to open the file with any archive program and you should see the content, which is encoded in a way that Microsoft Word can understand. You may also be able to understand those code.
- [[IMPL]] Change the extension on a file and use the properties menu to explore how your operating system chooses a program to open a file when you click on it.