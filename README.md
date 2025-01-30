# Buffer_Overflow

This project demonstrates a Buffer Overflow attack on a vulnerable program inside an isolated Docker environment. The objective is to exploit a buffer overflow vulnerability to obtain a shell.

## Prerequisites

Before starting, ensure you have:

- Docker installed on your system.

- A compatible system for exploitation tools.

- Basic knowledge of GDB, Buffer Overflow, and binary exploitation.

## Build and Run the Docker Container

1️. Build the Docker Image

```bash
docker build -t buffer-overflow .
```

2️. Run the Container in Interactive Mode

```bash
docker run --rm -it buffer-overflow
```
Once inside the container, you can execute and debug the vulnerable program.

## Identifying the Overflow and RIP Offset

1. Launch the Vulnerable Program in GDB

```bash
gdb -q ./vuln
run
```
Then, cause a segmentation fault by providing a long input string. Once the error occurs, check the state of the registers:
```bash
info registers
```
Find the RIP value to determine the exact offset where it is overwritten.

2. Identify the Exact Offset

```bash
python3 -c 'from pwn import *; print(cyclic(100))' | ./vuln
```

Then, determine the offset of RIP:
```bash
gdb -q ./vuln
run $(python3 -c 'from pwn import *; print(cyclic(100))')
info registers
```

## Execute the Attack

Run the Exploit with:
```bash
python3 exploit.py
```
If successful, you will obtain an interactive shell inside the container:
```bash
whoami
root
```
I didn't succeed to found the exact address. If you want to try 

