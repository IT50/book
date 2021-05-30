# Partitioning and Filesystem

You should have kept in mind that we have been exploring the contexts of data, constructing meaning out of mundaneness. In this chapter, we go beyond the files and look at what contains the files.

Remember from where we introduced data, the space on your disk is just a singular series of 0’s and 1’s, and they can *only* be 0’s and 1’s. That is to say, the space allocation information is stored just in these 0’s and 1’s. Some parts of your disk stores your files, and some parts store the space allocation information, all in the same, continuous, indifferent series of 0’s and 1’s of your disk.

There are two types of allocation: **partitioning** and **filesystem**. Partitioning is quite rudimentary: it defines usable segments of your disk space. Then, typically, a filesystem is established in each partition to contain files, usually in a tree structure.

On modern disks, data is accessed by logical blocks. Logical blocks addresses are linearally assigned, starting with 0. Most disks have a logical block size of 512 bytes.

## Partitioning

[[CON]] Partitioning is about specifying non-overlapping usable segments called **partitions**. A small **partition table** that stores this structure is usually put at the beginning of the disk, and the corresponding segments of space should be made accessible by the operating system as if they were separate. If some of the space is not allocated, then it should not be made accessible by the operating system.

[[STD]] We will learn about the modern and common partitioning standard, the **GUID Partition Table** (**GPT**). A GPT typically takes the first 34 and last 33 logical blocks (two copies) to store the partition data, but this size can vary to accommodate more or fewer partitions. Each partition entry in the table contains the following information:

- Partition type GUID. Every partition type people use has a standard GUID.
- Partition GUID. A unique GUID to identify the partition. There should not be duplicate partition GUIDs on a system.
- Start LBA. Specifies the start position. The partition includes the whole start logical block.
- End LBA. Specifies the end position. The partition includes the whole end logical block.
- Attribute flags.
- Partition name.

## Filesystem

Now that we have defined partitions, what gives the directory structure out of the raw data in a partition? A filesystem is established to do this job.

Filesystem is already a very complicated topic on its own. But a general idea is that, somewhat similar to partitioning, there is some sort of "file table" at a fixed location (usually the start of space), and it contains data about where each file starts and ends, the directory structure, permissions, etc. The actual file data is put in the remaining space. In such a framework, the fastest way to delete a file is to remove it from the "file table", and the fastest way to rename or move a file is to change this information in the "file table". Both actions do nothing about the actual file data, and this is exactly how most filesystems work. Only copying a file will actually copy the file data. This can mean that your deleted files can be accessed, but not in every way. To know more about this, read the Operating System chapter.

Because files can unpredictably be created or grow in size, it is inevitable that some files have their data separated into multiple segments. While the "file table" can manage this correctly, too much of this happening is called **fragmentation** and impacts performance.
