# Program

## How fast is RAM?

There are plenty of system benchmark tools available. Use one of your choice to benchmark your hard drive and RAM, and compare their sequential and random read/write speeds.

RAM should be extraordinarily faster than your hard drive when it comes to random operations. Random operations are very common in running programs, so RAM is chosen to be the storage for them.

## Compiling a simple program

Here is the source code of a very simple C program that adds the integers 3 and 5 together. It does not even give back the result in any way.

``` C
int main() {
  int a = 3;
  int b = 5;
  int s = a + b;
  return 0;
}
```

Type the code into `add.c` and save the file.

Then, use the following commands to let `gcc` compile the code into two executable binary versions. The first version has optimization disabled while the second version has optimization level set to 3. The outputs are saved to `add-O0` and `add-O3` respectively.

``` sh
gcc -O0 add.c -o add-O0
gcc -O3 add.c -o add-O3
```

In case you wonder, `gcc` and its dependencies are in machine code. Because a computer can only understand its own machine language, anything that is not will ultimately be processed by some code in its own machine language.

You can now run these two programs with `./add-O0` and `./add-O3`. It does not print anything to the terminal.

## What a binary program looks like

On your operating system, binary executables are in ELF format.

Use the following `objdump` command to disassemble the `add-O0` binary executable and save the output to `add-O0.dump.txt`.

``` sh
objdump -D add-O0 > add-O0.dump.txt
```

Then, open the dump. Now locate the compiled `main` function, the x86-64 outcome of which is also provided below.

```
0000000000401106 <main>:
  401106:       55                      push   %rbp
  401107:       48 89 e5                mov    %rsp,%rbp
  40110a:       c7 45 fc 00 00 00 00    movl   $0x3,-0x4(%rbp)
  401111:       c7 45 f8 04 00 00 00    movl   $0x5,-0x8(%rbp)
  401118:       8b 55 fc                mov    -0x4(%rbp),%edx
  40111b:       8b 45 f8                mov    -0x8(%rbp),%eax
  40111e:       01 d0                   add    %edx,%eax
  401120:       89 45 f4                mov    %eax,-0xc(%rbp)
  401123:       b8 00 00 00 00          mov    $0x0,%eax
  401128:       5d                      pop    %rbp
  401129:       c3                      ret
```

The first column is the linear byte address in the file. The hexadecimal data in the second column is the data at that address. The special thing about these data is that they are instructions directly executable by the x86-64 CPU. The last column shows what those hexadecimals stand for, in a more human-readable **assembly language** specific to the CPU architecture. Assembly code is only an alternative representation of the binary instructions; no transformation in the computing procedure is involved.

You don’t have to understand this piece of code. However, try to look at how values are manipulated and moved around. We can see a single `add` instruction with two operands. That instruction indeed does the addition for us, although the result is unused. Note that no variable name is preserved in the compiled program.

## Optimization

The compiler we used, GCC, has optimization functionalities. The second version we produced, `add-O3`, is the optimized version. After running `objdump -D add-O3 > add-O3.dump.txt`, we have a look look at its `main` function:

```
0000000000401020 <main>:
  401020:       31 c0                   xor    %eax,%eax
  401022:       c3                      ret
```

This version is much shorter than the unoptimized one. In fact, the only thing it does is returning 0. This is because GCC found that we left the result unused and further omitted the procedures to produce this result, so the program can run faster but still interact in the same way. This is only one of the many optimization techniques. Generally, optimizations make the code much faster to run, but much harder to read.

## Interpreted program

Python is an easy-to-learn interpreted programming language. Because it is interpreted, it has an interactive shell that lets you type in one line of code at a time and run it as appropriate. Start `python3`, then issue `a = 3`, `b = 5`, `s = a + b`, and `print(s)`. This will not save anything to a file. Use `exit()` to exit.

Again, these lines are ultimately processed by some machine code, in this case `python3` and its dependencies.
