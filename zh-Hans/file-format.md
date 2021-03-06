# 文件格式

我们刚刚了解了编码和解码文本的标准。它们在其中应保持一致的另一个方面是如何保存和读取各种文件。从本质上讲，它们也只是标准，文件结构的标准被称为**格式**。几乎所有人们使用的数据都会有专门的文件格式产生。本章只列出和描述最重要的几种。大多数文件格式是公共标准。也就是说，如果你需要使用一个标准，你需要查一下这个标准。

## 文件名和扩展名

[[CON]] 文件名，包括任何扩展名，是独立于文件中的数据的。人们通常误解了文件名中的扩展名。扩展名只是对文件格式的惯例性、补充性描述，可能提供也可能不提供比文件内标准化特征更详细的描述。

[[IMPL]] 你可以用任何程序打开任何文件，程序*应该*检查所打开的文件是否为支持的格式，但一个拙劣的程序可能不会这样做，并损坏文件。一些操作系统（包括 Windows）完全依靠扩展名来挑选程序打开文件。如果你使用非惯例的扩展名，或者有一种罕见的格式使用普通的扩展名，那么当你试图通过点击文件来打开一个文件时，这些操作系统可能会也可能不会打开正确的程序。

## 通用文件类型、格式和惯例扩展名列表

- 文件的非压缩档案（反映档案格式的 `.tar`、`.zip` 等）
- 压缩文件（反映压缩格式的 `.gz`、`.xz`、`.7z` 等）
- 文件的压缩档案（反映格式的 `.zip`、`.7z` 等）
- 二进制可执行文件
  - 入口程序（在 Windows 上为 `.exe`，在类 UNIX 上无扩展名）
  - 库（Windows 上的 `.dll`，Linux 上的 `.so`）
- 原始数据（`.bin`）
  - 原始分区或磁盘镜像（`.img`、`.bin`）
  - 内存转储
- 任何编码的纯文本（`.txt`）
  - 程序代码（`.c`、`.cpp`、`.java` 等，反映了语言）
    - shell 脚本（`.sh`、`.ps1` 等，反映了 shell，或者在类 UNIX 上没有扩展名）
  - 标记语言文件（反映语言的 `.html`、`.md` 等）
  - 结构化信息（反映语言的 `.json`、`.ini`、`.yml` 等）
    - 标准化或非标准化结构的配置文件（`.conf`、`.cf` 等）
- 其他专门的格式

## 专门的文件类型

### 归档和压缩

[[CON]] **归档**格式将多个文件合并为一个文件。**文件压缩**算法可以无损地将数据转换为以专门格式存储的耗费更少空间的形式。

归档文件并不必压缩其内容。UNIX 磁带档案（TAR）格式就是这样一个例子。人们通常用其中一种压缩算法来压缩 TAR 文件，得到的压缩文件有两个扩展名（`.tar.gz`）。其他存档格式可能集成了压缩功能，并产生一个带有一个扩展名的压缩文件。

### 媒体

[[CON]] 媒体文件格式与一般定义没有区别。然而，这些文件格式是包含元数据和实际媒体数据的容器。实际的媒体数据用**编解码器**进行编码，并以专门结构存储。媒体编解码器本身已经是一个复杂的话题，但为了本书的目的，你只需要知道以下内容：

**无损编解码器**，很像文件压缩，在数据和模拟媒体之间做无损转换。然而，它们比通用文件压缩的效率要高得多，因为它们是专门针对某一特定媒体类型的。例子包括便携式网络图形（Portable Network Graphic, PNG）和自由无损音频编解码器（Free Lossless Audio Codec, FLAC）。

**有损编解码器**，在对媒体进行编码时失去了信息。它们大大减少了数据大小，同时只丢失了我们无法看到或听到的最小细节，而且质量通常可以在编码器中配置。例子包括几乎所有现代视频编解码器、JPEG、WebP、MP3 和 opus。

## 试一下

- 创建一个 Microsoft Word（2007 或更高版本）文档。当然，你可以用 Microsoft Word 打开它。但你知道它只是一个包含内容的 ZIP 档案吗？试着用任何归档程序打开该文件，你应该看到内容，这些内容是以 Microsoft Word 可以理解的方式编码的。你也可能能够理解这些代码。
- [[IMPL]] 改变一个文件的扩展名，并使用「属性」菜单来探索当你点击这个文件时，你的操作系统如何选择程序来打开它。