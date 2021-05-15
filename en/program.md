# Program

For you, a software user, it is only necessary to know that a program is something that can be executed, despite the proper definition.

## Binary program

You might probably have heard that computers can only execute binary instructions directly. These binary instructions are known to be in **machine language**.

However, a given machine only accepts some machine languages, not all the ones that exist in the world. These pecuilarities are standardized into **instruction sets**, sets of instructions that the machine is able to accept. A machine's instruction sets must contain all the instructions used in the program for it to run correctly. Luckily, for a simpler comprehension, we usually only need to match the **architecture** of the CPU to run the program correctly, because instruction sets are usually not shared between architectures.

Machine codes run at a very low level. They talk directly to the CPU and RAM.

## To and from binary programs

Machine code is hard for people to write and understand, so people typically do not write it directly. Instead, we write in one of the **high-level languages** (for example, C), and use a **compiler** to generate binary programs for some instruction sets, from the high-level language **source code**.

The reverse of this process is possible, but much more difficult. Even if **decompilers** are available for this job, they will likely not produce the exact original source code, but a version that is optimized for computers and less friendly for humans.

## Interpreted program

For the sake of convenience, portability, and many things else, it is sometimes helpful to run program source code directly. Doing this requires an **interpreter**, which, simply put, compiles and executes only one line of code at a time when it needs to be executed.