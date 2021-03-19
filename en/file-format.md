# File Format

We learned that raw data is free for any interpretation, but we always want software to be consistent and compatible with each other. Another aspect within which they should be consistent is how to save and read various kinds of files. Essentially, they are also just standards. This chapter lists and describes the most important ones.

## Standards and conventions

Most file formats are publicly standardized.

People commonly misunderstand the extensions in file names. The extentions are only a conventional, supplementary description of the file format, and may or may not provide more detailed description beyond the standardized characteristics in the files. You can open any file with any program and the program *should* check if the file opened is of a supported format. If you use a non-conventional extension, your operating system may or may not open the correct program when you try to open a file by clicking on it.

## List of generic file types, formats and conventional extensions

- Non-compressed container of other files (.tar, .zip, etc. that reflect the container format)
- Compressed file (.gz, .xz, .7z, etc. that reflect the compression format)
- Compressed container of other files (.zip, .7z, etc. that reflect the format)
- Binary executable
  - Entry program (.exe on Windows, no extension on UNIX-like)
  - Library (.dll on Windows, .so on Linux)
- Raw data (.bin)
  - Raw partition or disk image (.img, .bin)
  - Memory dump
- Plain text of any encoding (.txt)
  - Program code (.c, .cpp, .java, etc. that reflect the language)
    - Shell script (.sh, .ps1, etc. that reflect the shell)
  - Markup language document (.html, .md, etc. that reflect the language)
  - Structured information (.json, .ini, .yml, etc that reflect the language)
    - Configuration file of standardized or non-standardized structure (.conf, .cf, etc.)
- Other specialized formats

## Description of specific types

### Containers and compression

### Media



