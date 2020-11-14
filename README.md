## Script for Benford's Law

### Description

This project is part of [MC346 - Programming Paradigms](https://www.ic.unicamp.br/~wainer/cursos/2s2020/346/topo346.html) course. Its goal is to apply [Benford's Law](https://en.wikipedia.org/wiki/Benford%27s_law) to a ASCII or UTF-8 text using a functional programming language [(Haskell)](https://www.haskell.org/).

### Running Locally

You must have [GHC](https://www.haskell.org/downloads/) (Haskell compiler) installed. On Ubuntu, just install with:

```shell
$ sudo apt install ghc
```

> For other distros/OS, follow the link above.

Then just clone the repository:

```shell
$ git clone git@github.com:vpalmerini/benford-law.git

$ cd benford-law
```

Finally, compile the code with:

```
$ ./build.sh
```

A `bin/` folder will be created with the binary.

> A `.o` and `.hi` files will also be created in the root folder but they will not be used.

To run it, just run the binary with a text file as input:

```shell
$ ./bin/app < input.txt
```

The output should be a array of tuples, each tuple corresponding to a digit (1-9). Something like this:

```
[('1',"0.50"),('2',"0.00"),('3',"0.00"),('4',"0.00"),('5',"0.50"),('6',"0.00"),('7',"0.00"),('8',"0.00"),('9',"0.00")]
```